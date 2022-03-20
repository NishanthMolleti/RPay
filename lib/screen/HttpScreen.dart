import 'dart:convert';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/Rusers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpScreen extends StatelessWidget {
  const HttpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/*
dynamic getUserfromQuery(contact) async {
  var url = "localhost:8080";
  final response =
      await http.get(Uri.http(url, "walletengine/user/" + contact));
  //    await http.get(Uri.http(url, "walletengine/user/query/" + contact));

  if (response.statusCode == 200) {
    //   print("in status 200" + response.body);
    final jsonResponse = jsonDecode(response.body);
    x = jsonResponse['BALANCE'];
    print(jsonResponse['NAME']);
//    print(x.toString() + " balance here ");

    return jsonResponse;
  }
}
 


 */
Future<User> getStudent(name) async {
  var url = "localhost:8080";
  final response = await http.get(Uri.http(url, "walletengine/user/" + name));

  print("in status 200");
  final jsonUser = jsonDecode(response.body);
  var result = User(jsonUser["Status"], jsonUser["Name"], jsonUser["LogId"],
      jsonUser["Balance"]);
  return result;
}
