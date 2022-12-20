import '../app_data_source.dart';

class UserRepository {
  UserRepository({required AppDataSource appDatasource})
      : _appDataSource = appDatasource;
  final AppDataSource _appDataSource;

  Future<Map<String, dynamic>>? getUserImc(
      {Map<String, dynamic>? userData}) async {
    final imcData = await _appDataSource.getUserImc(userData: userData!);
    return imcData!;
  }

  Future<List<Map<String, dynamic>>> getAllUserImc(
      {Map<String, dynamic>? userData}) async {
    final imcList = await _appDataSource.getAllUserImc(userData: userData!);
    return imcList!;
  }

  Future<void> saveUserImc(Map<String, dynamic> userImc) async {
    await _appDataSource.saveUserImc(userImc);
  }

  Future<List<Map<String, dynamic>>> deleteUserImc(
      Map<String, dynamic> userImc) async {
    final result = await _appDataSource.deleteUserImc(userImc);
    return result!;
  }
}
