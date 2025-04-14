import 'package:truetone/feature/home/data/models/uploadfile_model.dart';
import 'package:truetone/feature/home/domain/%20entitys/homeentity_uploadfile.dart';

extension ConvertToHomeModels on HomeEntity

{
  HomeModel tohomemodel()

  {
    return HomeModel(file);
  }

}
extension  ConvertToHomeEntity on HomeModel
{
  HomeEntity tohomeentity()
  {
    return HomeEntity(rate: rate ,type: typefile);
  }
}