abstract class ApiService {
  Future<dynamic> postService(String url, dynamic headers, dynamic body);
  Future<dynamic> putService(String url, dynamic headers, dynamic body);
  Future<dynamic> getService(String url, dynamic headers);
  Future<dynamic> deleteService(String url, dynamic headers);
}
