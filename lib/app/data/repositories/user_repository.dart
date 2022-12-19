import '../../models/user_model.dart';
import '../app_data_source.dart';

class UserRepository {
  UserRepository({AppDataSource? appDatasource})
      : _appDataSource = appDatasource!;
  final AppDataSource _appDataSource;

  UserModel? userModel = UserModel();

  Future<List<Map<String, dynamic>>> getUserImc(
      {required Map<String, dynamic> userData}) async {
    final imcList = await _appDataSource.getUserImc(userData: userData);
    return imcList;
  }

  Future<void> saveUserImc(Map<String, dynamic> userImc) async {
    await _appDataSource.saveUserImc(userImc);
  }
}
