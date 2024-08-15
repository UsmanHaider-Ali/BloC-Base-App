import 'dart:io';

import 'package:bloc_base_app/data/api/api_service.dart';
import 'package:bloc_base_app/data/api/endpoints.dart';
import 'package:bloc_base_app/domain/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient extends ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: Endpoints.baseUrl));

  @override
  Future postService(String url, headers, body) async {
    dynamic jsonResponse;

    try {
      final response = await _dio.post(url, data: body, options: Options(headers: headers));

      jsonResponse = handleResponse(response);

      jsonResponse = response.data;
    } on DioException catch (e) {
      debugPrint("Post Service => DioException: $e");
    } on SocketException catch (e) {
      throw NoInternetException(e.message);
    } on Exception catch (e) {
      debugPrint("Post Service => Exception: $e");
    }
    
    return jsonResponse;
  }

  @override
  Future putService(String url, headers, body) {
    throw UnimplementedError();
  }

  @override
  Future getService(String url, headers) {
    throw UnimplementedError();
  }

  @override
  Future deleteService(String url, headers) {
    throw UnimplementedError();
  }
}

dynamic handleResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response.data;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
      throw UnauthorisedException(response.data.toString());

    case 403:
      throw UnauthorisedException(response.data.toString());
    case 500:
    default:
      throw FetchDataException("Error occurred while communicating with server with status code: ${response.statusCode}");
  }
}
