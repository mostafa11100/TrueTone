import 'package:equatable/equatable.dart';

class VoiceEntity extends Equatable
{
  int? id;
  String? name;
    String?type;
   double?lngth;
  String?url;
VoiceEntity({this.name,this.url,this.type,this.lngth,this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [name,type,lngth,url];}
