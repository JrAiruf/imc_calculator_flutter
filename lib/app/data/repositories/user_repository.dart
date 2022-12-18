import '../../models/user_model.dart';
import '../app_data_source.dart';

class UserRepository {
  UserRepository({AppDataSource? appDatasource})
      : _appDataSource = appDatasource!;
  final AppDataSource _appDataSource;

  Future<void> addUser({UserModel? user}) async {
    await _appDataSource.addUserToDatabase(user: user!.toMap());
  }
}
