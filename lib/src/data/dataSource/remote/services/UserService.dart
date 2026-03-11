import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/src/data/api/ApiConfig.dart';
import 'package:e_commerce/src/data/dataSource/local/SharedPref.dart';
import 'package:e_commerce/src/domain/models/AuthResponse.dart';
import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/domain/utils/ListToString.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class UserService {
  SharedPref sharedPref;

  UserService(this.sharedPref);

  Future<Resource<User>> update(int id, User user) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/users/$id');
      String token = "";
      final userSession = await sharedPref.read('user');
      if (userSession != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
      }
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": token,
      };
      String body = json.encode({
        'name': user.name,
        'lastName': user.lastName,
        'phone': user.phone,
        'email': user.email,
      });
      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return Error(listToString(data['message']));
      }
      User userReponse = User.fromJson(data);
      return Success(userReponse);
    } catch (e) {
      print('Error: ${e}');
      return Error(e.toString());
    }
  }

  Future<Resource<User>> updateImage(int id, User user, File file) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/users/upload/$id');
      String token = "";
      final userSession = await sharedPref.read('user');
      if (userSession != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
      }
      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = token;
      request.files.add(
        http.MultipartFile(
          'file',
          http.ByteStream(file.openRead().cast()),
          await file.length(),
          filename: basename(file.path),
          contentType: MediaType('image','jpg')
        ),
      );
      request.fields['user'] = json.encode({
        'name': user.name,
        'lastName': user.lastName,
        'phone': user.phone,
        'email': user.email,
      });
      final response = await request.send();
      final data = json.decode(
        await response.stream.transform(utf8.decoder).first,
      );
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return Error(listToString(data['message']));
      }
      User userReponse = User.fromJson(data);
      return Success(userReponse);
    } catch (e) {
      print('Error: ${e}');
      return Error(e.toString());
    }
  }
}
