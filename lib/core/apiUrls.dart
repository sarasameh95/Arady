const String _testServer = 'http://10.150.144.155:8080/api';
const String _localServer = 'http://10.150.144.152:8080/api';
const String _publicServer = 'http://10.250.1.155:8080/sca-lands-system/api';
class ApiUrls{
  static const String login = '$_publicServer/auth/login';
  static const String register = '$_publicServer/auth/register';
  static const String getDemands = '$_publicServer/demands/myDemands';


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