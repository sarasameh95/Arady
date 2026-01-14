

import 'package:ashghal/core/apiUrls.dart';
import 'package:dio/dio.dart';

class DioService{
  final dio = Dio();
  Future<dynamic> getNews() async {
    final response = await dio.get(ApiUrls.getDemands,queryParameters: {});
    return response.data;

  }
}