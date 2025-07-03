import 'package:photo_manager/photo_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const fetchMediaTask = "upload_media_in_background";

class MediaUploader {
  final SupabaseClient supabase;
  final String bucketName;
  final String userId;

  MediaUploader(this.supabase, this.bucketName, this.userId);

  Future<void> uploadMediaFiles() async {
    try {
      final permission = await PhotoManager.requestPermissionExtend();
      if (!permission.isAuth) return;

      final prefs = await SharedPreferences.getInstance();

      final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.common,
      );
      final List<AssetEntity> media = [];

      for (final album in albums) {
        final files = await album.getAssetListPaged(page: 0, size: 1000);
        media.addAll(files);
      }

      for (final asset in media) {
        try {
          final file = await asset.file;
          if (file == null) continue;

          final key = asset.id;

          final alreadyUploaded = prefs.getBool(key) ?? false;
          if (alreadyUploaded) continue;

          final fileBytes = await file.readAsBytes();
          final originalFileName = file.path.split('/').last;
          final sanitizedFileName = _sanitizeFileName(originalFileName);
          await supabase.storage
              .from("media-uploads")
              .uploadBinary('$userId/$sanitizedFileName', fileBytes);

          await prefs.setBool(key, true);
        } catch (e) {}
      }
    } catch (e) {
      print("exetttttttttttpon${e.toString()}");
    }
  }

  String _sanitizeFileName(String name) {
    // Remove Arabic/Unicode numerals and replace with English numerals
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (int i = 0; i < arabicNumbers.length; i++) {
      name = name.replaceAll(arabicNumbers[i], i.toString());
    }

    // Remove any other weird characters
    return name.replaceAll(RegExp(r'[^\w\.\-]'), '_');
  }
}
