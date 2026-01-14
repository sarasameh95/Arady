import 'dart:developer';

import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import '../../../core/apiUrls.dart';
import '../data/demands_model.dart';


abstract class BaseDemandsRemoteDataSource{
  Future<List<DemandsModel>> getDemands();
}

class DemandsRemoteDataSource extends BaseDemandsRemoteDataSource{

  @override
  Future<List<DemandsModel>> getDemands() async{
    String? token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJKV1QgVE9LRU4iLCJVU0VSTkFNRSI6InNhcmEiLCJBVVRIT1JJVElFUyI6IlVTRVIiLCJpYXQiOjE3Njc2OTA1OTksImV4cCI6MTc2NzcxOTM5OX0.EhcEOX_XxZcsOUx2qOW7zxwgPeOBMk7eDTdVND059SrqUJksh-lQaUQm67yqlnTzWy59h87e3W5WnPFd6KwnkA';
    var response  = await http.get(Uri.parse(ApiUrls.getDemands),
      headers: <String, String>{
        'Content-Type': ApiStrings.contentType,
        'Accept': ApiStrings.json,
        'Authorization': '${ApiStrings.bearer} $token',
      },);

    if (response.statusCode == StatusCode.ok) {
      Map<String, dynamic> data = convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      List<DemandsModel> demands = (data['items'] as List)
          .map((item) => DemandsModel.fromMap(item as Map<String, dynamic>))
          .toList();
      log(demands.toString());
      return demands;
    }
    return [];
  }



}