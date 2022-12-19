import '../../models/user_model.dart';
import '../app_data_source.dart';

class UserRepository {
  UserRepository({AppDataSource? appDatasource})
      : _appDataSource = appDatasource!;
  final AppDataSource _appDataSource;

  UserModel? userModel = UserModel();
 

  Future<UserModel> getUserImc() async {
    final result = await _appDataSource.getUserImc();
    return UserModel.fromMap(result!.data()!);
  }
}
