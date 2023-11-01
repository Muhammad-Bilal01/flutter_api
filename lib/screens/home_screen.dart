import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../services/api_call.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

// api Request

  // getData() async {
  //   var url = Uri.https("jsonplaceholder.typicode.com", "/users");
  //   var response = await http.get(url);
  //   var responseBody = jsonDecode(response.body);

  //   // print(json[0]);

  //   return responseBody;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Request"),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: Services.getUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${snapshot.data?[index].id ?? 0}"),
                  ),
                  title: Text(snapshot.data?[index].name ?? "Not Found"),
                  subtitle: Text(snapshot.data?[index].email ?? " Not Found"),
                  trailing:
                      Text(snapshot.data?[index].address?.city ?? "Not Found"),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await getData();
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
