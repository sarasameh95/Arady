import 'package:ashghal/core/apiUrls.dart';
import 'package:ashghal/core/token_storage.dart';
import 'package:ashghal/services/Login/domain/register_request.dart';
import 'package:ashghal/services/Login/domain/request.dart';
import 'package:ashghal/services/operations/data/demands_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        ApiStrings.accept: ApiStrings.json,
        ApiStrings.contentTypeKey: ApiStrings.json,
      },
    ),
  );

  Future<LoginResponse> login(LoginRequest request) async {
    print({'request': request.toJson().toString()});
    try {
      final response = await _dio.post(ApiUrls.login, data: request.toJson());
      print('response ${response}');

      if (response.data['data'] == null) {
        return LoginResponse.fromJson(response.data['message']);
      }
      return LoginResponse.fromJson(response.data['data']);
    } on DioException catch (e) {
      print('STATUS CODE: ${e.response?.statusCode}');
      print('ERROR BODY: ${e.response?.data}');

      throw Exception(e.response?.data['data'] ?? e.response?.data['message']);
    }
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      print(request.toJson().toString());

      final response = await _dio.post(
        ApiUrls.register,
        data: request.toJson(),
      );

      print('from post ${response.data}');

      //  return RegisterResponse.fromMap(response.data['data']);
      return RegisterResponse.fromMap(response.data);
    } on DioException catch (e) {
      print('STATUS CODE: ${e.response?.statusCode}');
      print('ERROR BODY: ${e.response?.data}');

      throw Exception(e.response?.data['data'] ?? e.response?.data['message']);
    }
  }

  //   print(request.toJson().toString());
  //   final response = await _dio.post(
  //     ApiUrls.register,
  //     data: request.toJson(),
  //   );
  //   print('from post ${response}');
  //   return RegisterResponse.fromMap(response.data['data']);
  // }
}

class DemandService {
  final TokenStorage tokenStorage;
  final Dio _dio = Dio();
  DemandService(this.tokenStorage) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await tokenStorage.getToken();

          if (token != null) {
            options.headers[ApiStrings.authorization] = 'Bearer $token';
            options.headers[ApiStrings.accept] = ApiStrings.json;
          }
          return handler.next(options);
        },
      ),
    );
  }
  Dio get dio => _dio;

  // BaseOptions(
  //   headers: {
  //     ApiStrings.accept: ApiStrings.json,
  //     ApiStrings.authorization : "Bearer $tokenStorage",
  //   },
  //   // Android emulator
  //   // baseUrl: 'http://127.0.0.1:3000', // physical device
  // ),

  Future<List<DemandsModel>> getUserDemands() async {
    final response = await dio.get(ApiUrls.getDemands);
    print('response ${response.data['data']}');

    final List list = response.data['data'];
    // print('list ${list}');

    return (list).map((e) => DemandsModel.fromMap(e)).toList();
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
