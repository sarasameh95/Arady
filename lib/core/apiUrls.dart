const String _testServer = 'http://10.150.144.177:8080/api';
const String _localServer = 'http://localhost:8080/api';
class ApiUrls{
  static const String login = '$_localServer/auth/login';
  static const String getDemands = '$_localServer/demands/myDemands';


}

class StatusCode{
  static const int ok = 200;
  static const int badRequest = 400;
  static const int unAuthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int expiredOtp = 410;
  static const int repeatedOtp = 429;
  static const int internalServerError = 500;
}

class ApiStrings {
  static const String contentType = 'application/json; charset=UTF-8';
  static const String contentTypeKey = 'Content-Type';
  static const String json = 'application/json';
  static const String bearer = 'Bearer';
  static const String authorization = 'Authorization';
  static const String accept = 'Accept';
}