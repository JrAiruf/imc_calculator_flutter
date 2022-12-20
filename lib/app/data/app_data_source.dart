abstract class AppDataSource {
  Future<List<Map<String, dynamic>>>? getAllUserImc({required Map<String, dynamic> userData});
  Future<Map<String, dynamic>>? getUserImc({required Map<String, dynamic> userData});
  Future<void>? saveUserImc(Map<String, dynamic> userImc);
  Future<List<Map<String, dynamic>>>? deleteUserImc(Map<String, dynamic> userImc);
}