import '../app_data_source.dart';

class UserRepository {
  UserRepository({required AppDataSource appDatasource})
      : _appDataSource = appDatasource;
  final AppDataSource _appDataSource;

  Future<List<Map<String, dynamic>>> getAllUserImc(
      { Map<String, dynamic>? userData}) async {
    final imcList = await _appDataSource.getAllUserImc(userData: userData!);
    return imcList!;
  }

  Future<void> saveUserImc(Map<String, dynamic> userImc) async {
    await _appDataSource.saveUserImc(userImc);
  }
}
