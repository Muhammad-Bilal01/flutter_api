import 'dart:convert';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<UserModel>>? getUsers() async {
    List<UserModel> users = [];

// call api to get users
    var url = Uri.https("jsonplaceholder.typicode.com", "/users");
    var response = await http.get(url);
    var data = jsonDecode(response.body);

    // iterate all value to add in List
    for (var i in data) {
      users.add(UserModel.fromJson(i));
    }

    return users;
  }
}
