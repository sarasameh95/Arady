import 'dart:convert' as convert;
import 'dart:io' show Platform;

import 'package:ashghal/services/Login/data/user_model.dart';
import 'package:ashghal/core/utils/app_strings.dart';
import 'package:ashghal/core/apiUrls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



abstract class BaseLoginRemoteDataSource {
  Future<UserModel> login({required String userName, required String password,
    required bool isRemember
  });
}

class LoginRemoteDataSource implements BaseLoginRemoteDataSource {
  Future<SharedPreferences> initServiceLocator() async {
    final SharedPreferences _prefs =  await SharedPreferences.getInstance();
    return _prefs;
  }

  static String? _rememberedUserName;
  static String? _rememberedPassword;

  String? get rememberedUserName => _rememberedUserName;

  String? get remembered => _rememberedPassword;



  @override
  Future<UserModel> login({required String userName, required String password, required bool isRemember}) async {
    final prefs = await initServiceLocator();
    var response = await http.post(
      Uri.parse(ApiUrls.login),
      headers: <String, String>{
        ApiStrings.contentTypeKey: ApiStrings.contentType,
      },
      body: convert.jsonEncode(
          <String, String>{'userName': userName, 'password': password,
            //'version': version, 'platformId': platformID
          }),
    );
    if (response.statusCode == StatusCode.ok) {
      var json = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
     /* _setSharedPreferences(json, isRemember: isRemember, userName: userName, password: password);
      if (_needToSaveFcmToken()) {
        _saveUserFcmToken(userName.toString(), _prefs.getString(PrefsKeys.fcmToken).toString(), platformID);
      }*/
      return UserModel.fromMap(json);
    }
    return UserModel(fullName: '', userName: '', password: '', natId: 0, mobileNo: '', whatsNo: '', email: '') ;
   // return const UserModel(isAuthenticated: false, validVersion: true);
  }
/*
  static Future<void> _setSharedPreferences(Map<String, dynamic> sharedKeys,
      {required bool isRemember, String? userName, String? password}) async {
    // Obtain shared preferences.
    final prefs = sl<SharedPreferences>();
    prefs.setBool(PrefsKeys.isRemember, isRemember);
    prefs.setString(PrefsKeys.userName, userName.toString());
    prefs.setString(PrefsKeys.password, password.toString());
    sharedKeys.forEach((key, value) {
      prefs.setString(key, value.toString());
    });
  }

  static Future<void> getSharedPreferences() async {
    final prefs = await initServiceLocator();

    if (prefs.containsKey(PrefsKeys.isRemember)) {
      if (prefs.getBool(PrefsKeys.isRemember)!) {
        _rememberedUserName = prefs.getString(PrefsKeys.userName);
        _rememberedPassword = prefs.getString(PrefsKeys.password);
      }
    }
  }

  static int getNthOccurrenceIndex(String text, String searchTerm, int n) {
    int currentIndex = -1;
    for (int i = 0; i < n; i++) {
      currentIndex = text.indexOf(searchTerm, currentIndex + 1);
      if (currentIndex == -1) {
        return -1; // Return -1 if the occurrence is not found
      }
    }
    return currentIndex;
  }

  Future<bool> _saveUserFcmToken(String userName, String fcmToken, String platform) async {
    final prefs = sl<SharedPreferences>();
    String? token = prefs.getString(PrefsKeys.token);
    var response = await http.post(
      Uri.parse(ApiUrls.addFcmToken),
      headers: <String, String>{
        ApiStrings.contentTypeKey: ApiStrings.contentType,
        ApiStrings.accept: ApiStrings.json,
        ApiStrings.authorization: '${ApiStrings.bearer} $token',
      },
      body: convert.jsonEncode(<String, String>{'user_name': userName, 'token': fcmToken, 'platform': platform}),
    );
    if (response.statusCode == StatusCode.ok) {
      if (convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) == 1) {
        _prefs.setBool(PrefsKeys.fcmTokenSaved, true);
        return true;
      }
    }
    return false;
  }

  bool _needToSaveFcmToken() {
    if (!_prefs.containsKey(PrefsKeys.fcmTokenSaved)) {
      return true;
    }
    if (!_prefs.getBool(PrefsKeys.fcmTokenSaved)!) {
      return true;
    }
    return false;
  }*/
}
