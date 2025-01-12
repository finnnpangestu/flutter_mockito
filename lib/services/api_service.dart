abstract class ApiService {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> getProducts();
}
