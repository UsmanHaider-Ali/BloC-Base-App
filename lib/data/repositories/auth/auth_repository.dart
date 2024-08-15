import 'package:bloc_base_app/data/api/dio_client.dart';
import 'package:bloc_base_app/data/api/endpoints.dart';

class AuthRepository {
  final DioClient _dioClient = DioClient();

  Future<dynamic> login({var body}) async => await _dioClient.postService(Endpoints.login, null, body);

  Future<dynamic> register({var body}) async => await _dioClient.postService(Endpoints.register, null, body);
}
