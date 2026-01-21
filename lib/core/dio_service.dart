

import 'dart:convert' as convert;

import 'package:ashghal/core/apiUrls.dart';
import 'package:ashghal/services/operations/data/demands_model.dart';
import 'package:ashghal/services/operations/domain/demands_entity.dart';
import 'package:dio/dio.dart';


class DemandService {

  final Dio dio = Dio(
  //  String? token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJKV1QgVE9LRU4iLCJVU0VSTkFNRSI6Im1vd2FlbCIsIkFVVEhPUklUSUVTIjoiVVNFUiIsImlhdCI6MTc2ODk4NDkzNSwiZXhwIjoxNzY5MDEzNzM1fQ.hcHEwLbLVmBWklopn3BdR6UW_t9eCWS7h0Gq4fqUEf-1y3NPUKvah4KMIi-X0GVuEK1Q9nwxBsgqbgVrea0Isg';
    BaseOptions(
      baseUrl: 'http://10.150.144.171:8080',
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJKV1QgVE9LRU4iLCJVU0VSTkFNRSI6Im1vd2FlbCIsIkFVVEhPUklUSUVTIjoiVVNFUiIsImlhdCI6MTc2ODk4NDkzNSwiZXhwIjoxNzY5MDEzNzM1fQ.hcHEwLbLVmBWklopn3BdR6UW_t9eCWS7h0Gq4fqUEf-1y3NPUKvah4KMIi-X0GVuEK1Q9nwxBsgqbgVrea0Isg",

      },
      // Android emulator
      // baseUrl: 'http://127.0.0.1:3000', // physical device
    ),
  );

  Future<List<DemandsModel>> getUserDemands() async {
    final response = await dio.get(ApiUrls.getDemands);
    //print(response.data);

    final List list = response.data;
    print(list);
    return (list)
        .map((e) => DemandsModel.fromMap(e))
        .toList();
  }
  //   if (response.statusCode == StatusCode.ok) {
  //
  //     //Map<String, dynamic> data = convert.jsonDecode(convert.utf8.decode(response.data)) as Map<String, dynamic>;
  //
  //     // List<DemandsModel> demands = (response.data as List)
  //     //     .map((item) => DemandsModel.fromMap(item as Map<String, dynamic>))
  //     //     .toList();
  //     // print(demands.toString());
  //     // return demands;
  //   return response.data.map((e) => DemandsModel.fromMap(e)).toList();
  // }
  //   return [];
  // }
}
  // static String get _baseUrl {
  //   // Android Emulator
  //   return 'http://10.150.144.171:8080';
  //
  //   // iOS Simulator
  //   // return 'http://localhost:3000';
  //
  //   // Physical device (server on same device)
  //   // return 'http://127.0.0.1:3000';
  // }
