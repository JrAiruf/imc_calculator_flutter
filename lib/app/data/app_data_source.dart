abstract class AppDataSource {
  Future<List<Map<String, dynamic>>>? getAllUserImc({required Map<String, dynamic> userData});
  Future<void>? saveUserImc(Map<String, dynamic> userImc);
}