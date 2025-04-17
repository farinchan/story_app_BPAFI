import 'package:story_app_bpafi/data/models/register_model.dart';

abstract class RemoteDatasource {
  Future<RegisterModel> register(String name, String email, String password);

}
