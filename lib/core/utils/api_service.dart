// ignore_for_file: file_names, avoid_print, duplicate_ignore
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  Future<Response> post({
    required body,
    required String url,
    required String token,
    Map<String,String>? headers,
    String? contentType,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(headers:headers?? {
        'Content-Type': contentType,
        'Authorization': 'Bearer $token',
      }),
    );

    return response;
  }
}
