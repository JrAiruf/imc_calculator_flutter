abstract class AppDataSource {
  Future<List<Map<String, dynamic>>> getUserImc({required Map<String, dynamic> userData});
  Future<void>saveUserImc(Map<String, dynamic> userImc);
}