import 'dart:convert';
import 'dart:io';

import 'package:graduationproject/api/api_constants.dart';
import 'package:graduationproject/model/request/ChangePasswordRequest.dart';
import 'package:graduationproject/model/request/CheckOTPRequest.dart';
import 'package:graduationproject/model/request/ForgetPasswordRequest.dart';
import 'package:graduationproject/model/request/LoginRequest.dart';
import 'package:graduationproject/model/request/RegisterRequest.dart';
import 'package:graduationproject/model/response/ChangePasswordResponse.dart';
import 'package:graduationproject/model/response/CheckOTPResponse.dart';
import 'package:graduationproject/model/response/LoginResponse.dart';
import 'package:graduationproject/model/response/RegisterResponse.dart';
import 'package:graduationproject/model/response/forgetPasswordResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

import '../model/response/CreateCaseResponse.dart';
import '../model/response/LoggedUserInfo.dart';
import '../model/response/LoggedUserPosts.dart';
import '../model/response/Missing.dart';
import '../model/response/SearchAiResponse.dart';

class ApiManager {
  static Future<RegisterResponse> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      String governorate) async {
    var registerBody = RegisterRequest(
      fullName: name,
      email: email,
      password: password,
      confirmPassword: rePassword,
      mobileNumber: phone,
      governorate: governorate,
    );
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(registerBody.toJson()),
    );
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoginResponse> login(String email, String password) async {
    var loginBody = LoginRequest(
      email: email,
      password: password,
    );
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(loginBody.toJson()),
    );
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ForgetPasswordResponse> forgetPassword(String email) async {
    var forgetPasswordBody = ForgetPasswordRequest(
      identification: email,
    );
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.otpApi);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(forgetPasswordBody.toJson()),
    );
    return ForgetPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<CheckOtpResponse> checkOTP(String email, String code) async {
    var checkOTPBody = CheckOtpRequest(
      identification: email,
      code: code,
    );
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.checkOTPApi);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(checkOTPBody.toJson()),
    );
    return CheckOtpResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ChangePasswordResponse> changePassword(String email,
      String code, String newPassWord, String confirmNewPassword) async {
    var checkOTPBody = ChangePasswordRequest(
        identification: email,
        code: code,
        newPassword: newPassWord,
        confirmNewPassword: confirmNewPassword);
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.changePasswordApi);
    var response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(checkOTPBody.toJson()),
    );
    return ChangePasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoggedUserInfo> getLoggedUserInfo(String token) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.userApi);
    try {
      var response = await http.get(
        url,
        headers: {
          'token': token,
        },
      );
      var json = jsonDecode(response.body);
      return LoggedUserInfo.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<Missing> getAllMissing(String token) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.allMissingApi);
    try {
      var response = await http.get(
        url,
        headers: {'token': token},
      );

      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return Missing.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<LoggedUserPosts> getLoggedUserPosts(String token) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.userPostsApi);
    try {
      var response = await http.get(
        url,
        headers: {'token': token},
      );
      var json = jsonDecode(response.body);

      return LoggedUserPosts.fromJson(json);
    } catch (e) {
      print('Exception: ${e.toString()}');
      throw e;
    }
  }

  static Future<Missing> SearchByName(String query) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, ApiConstants.allMissingApi, {'keyword': query});
    try {
      var response = await http.get(
        url,
        headers: {
          'token':
          'secret_eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzkzMjQ4YmM3ZDY2Y2M5NWI2ZTU5MiIsImVtYWlsIjoib3NhbWEuYWJkbzQwNDBAZ21haWwuY29tIiwiaWF0IjoxNzE5MjMxNTA5fQ.z4qD71W5zmfLJ50rOQhvsdmgulv-qs81J-SOur5zOcA'
          , 'Content-Type': 'application/json',
        },
      );
      var json = jsonDecode(response.body);
      return Missing.fromJson(json);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  static Future<SearchAiResponse?> SearchByAI(File image) async {
    try {
      var uri = Uri.parse(ApiConstants.searchAIApi);
      var request = http.MultipartRequest('POST', uri);
      request.headers['token'] =
      'secret_eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzkzMjQ4YmM3ZDY2Y2M5NWI2ZTU5MiIsImVtYWlsIjoib3NhbWEuYWJkbzQwNDBAZ21haWwuY29tIiwiaWF0IjoxNzE5MjMxNTA5fQ.z4qD71W5zmfLJ50rOQhvsdmgulv-qs81J-SOur5zOcA';

      // Attach the file to the request
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image', // This is the field name on the server side
        stream,
        length,
        filename: path.basename(image.path),
        contentType: MediaType('image', 'jpg'),
      );

      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();
      if (response.statusCode == 200) {
        print('1111111111 Status code: ${response.statusCode}');

        var responseData = await http.Response.fromStream(response);
        var jsonResponse = jsonDecode(responseData.body);

        return SearchAiResponse.fromJson(jsonResponse);
      }
    } catch (e) {
      throw e.toString();
    }
    return null;
  }

  static Future<CreateCaseResponse?> CreateCase(
      File image,
      String name,
      String gender,
      int age,
      String mobileNumber,
      String city,
      String locationOfLoss,
      String dateOfLoss,
      String description,
      String status,
      String token) async {
    try {
      var uri = Uri.parse(ApiConstants.createcaseApi);

      var request = http.MultipartRequest('POST', uri);
      request.headers['token'] = token;

      // Attach the file to the request
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'images', // This is the field name on the server side
        stream,
        length,
        filename: path.basename(image.path),
        contentType: MediaType('image', 'jpg'),
      );

      request.files.add(multipartFile);
      request.fields['name'] = name;
      request.fields['gender'] = gender;
      request.fields['age'] = age.toString();
      request.fields['mobileNumber'] = mobileNumber;
      request.fields['city'] = city;
      request.fields['locationOfLoss'] = locationOfLoss;
      request.fields['dateOfLoss'] = dateOfLoss;
      request.fields['description'] = description;
      request.fields['status'] = status;

      // Send the request
      var response = await request.send();
      print('2222222 Status code: ${response.statusCode}');
      if (response.statusCode == 201) {
        print('1111111111 Status code: ${response.statusCode}');
        var responseData = await http.Response.fromStream(response);
        var jsonResponse = jsonDecode(responseData.body);
        return CreateCaseResponse.fromJson(jsonResponse);
      } else {
        // Print response body for debugging
        var responseData = await http.Response.fromStream(response);
        print('Response data: ${responseData.body}');
      }
    } catch (e) {
      throw e.toString();
    }
    return null;
  }
}