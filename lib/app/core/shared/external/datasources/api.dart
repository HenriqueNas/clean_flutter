import 'package:clean_dart/app/core/shared/infra/datasources/api_interface.dart';
import 'package:dio/dio.dart';

class Api implements ApiInterface {
  final Dio httpClient;
  final String baseUrl;

  Api({
    required this.baseUrl,
    required this.httpClient,
  });

  @override
  Future<Response> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await httpClient.get(
        url,
      );

      return response;
    } catch (e) {
      throw Exception('Can\'t request now. Try again later.');
    }
  }

  @override
  Future<Response> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      return await httpClient.post(
        url,
        data: body,
      );
    } catch (e) {
      throw Exception('Can\'t request now. Try again later.');
    }
  }

  @override
  Future<Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      return await httpClient.delete(
        url,
        data: body,
      );
    } catch (e) {
      throw Exception('Can\'t request now. Try again later.');
    }
  }

  @override
  Future<Response> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      return await httpClient.put(
        url,
        data: body,
      );
    } catch (e) {
      throw Exception('Can\'t request now. Try again later.');
    }
  }
}
