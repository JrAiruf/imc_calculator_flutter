import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/repositories/user_repository.dart';
import '../../models/user_model.dart';

class InitialController extends GetxController {
  InitialController({UserRepository? userRepository})
      : _userRepository = userRepository!;

  final UserRepository _userRepository;

  final emailController = TextEditingController();
  final nameController = TextEditingController();

  final userKey = GlobalKey<FormState>();

  Future<void> addUser({@required UserModel? user}) async {
    await _userRepository.addUser(user: user!);
  }
}
