// import 'dart:_http';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_1/scr/users_list/models/user_model.dart';
import 'package:mvvm_1/scr/users_list/repo/api_status.dart';
import 'package:mvvm_1/scr/utils/constants.dart';

class UserService {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USER_LIST);
      var response = await http.get(url);
      if (SUCCESS == response.statusCode) {
        return Success(response: userListModelFromJson(response.body));
      }
      //failure object when status code is not 200
      return Failure(code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    }
     on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet connection');
    } 
     on SocketException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet connection');
    } 
    
    on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
