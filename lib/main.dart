import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Account.dart';
import 'package:flutter_application_1/screen/ConfirmPayment.dart';
import 'package:flutter_application_1/screen/EnterAmount.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';
import 'package:flutter_application_1/screen/QueryUsers.dart';
import 'package:flutter_application_1/screen/SearchPage.dart';
import 'package:flutter_application_1/screen/SearchingforContacts.dart';
//import 'package:flutter_application_1/screen/Testing.dart';
import 'package:flutter_application_1/screen/TransactionComplete.dart';
import 'package:flutter_application_1/screen/qrcodepage.dart';
import 'package:flutter_application_1/screen/JsonParseDemo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'screen/HttpScreen.dart';

class User {
  late String name;
  late String userLoginId;

  User(this.name, this.userLoginId);
}

List<User> li = [] /*= [User("Anirudh", 1, 1), User("Nishanth", 128, 133)]*/;

dynamic getUserfromQuery(String contact) async {
  var url = "localhost:8080";
  final response =
      await http.get(Uri.http(url, "walletengine/user/query/" + contact));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);

    var u = jsonResponse['users'];
    li.clear();
    for (int i = 0; i < u.length; i++) {
      User obj = User(u[i]["name"], u[i]["user_login_id"]);
      li.add(obj);
    }
  }
}

Future<QueryUsers> getquerysuggestions(search) async {
  final url = "localhost:8080/walletengine/user/query/A";
  final resp = await http.get(Uri.http(url, ''));
  if (resp.statusCode == 200) {
    final jsondata = jsonDecode(resp.body);
    print(jsondata);
    return jsondata;
  } else {
    throw Exception();
  }
}

void main() => runApp(MyApp());
const primaryColor = Color(0xFFFFFFFF);
dynamic res = 0;
//var jsonResponse = getUserfromQuery('Nishanth');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rpay Home!',
        color: Colors.white,
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: HomeScreen(),

        // adding routes to access all pages from account page
        routes: <String, WidgetBuilder>{
          "/Account": (BuildContext context) =>
              new Account(loginUserName: '', loginUserBalance: ''),
          "/SearchPage": (BuildContext context) => new SearchPage(),
          "/EnterAmount": (BuildContext context) => new EnterAmount(),
          "/TransactionComplete": (BuildContext context) =>
              new TransactionComplete(),
          //         "/Testing": (BuildContext context) => new Testing(),
          "/qrcodepage": (BuildContext context) => new qrcodepage(),
          "/ConfirmPayment": (BuildContext context) => new ConfirmPayment(),
          "/HttpScreen": (BuildContext context) => new HttpScreen(),
          "/SearchingforContacts": (BuildContext context) =>
              new SearchingforContacts(),
          //add more pages based on the need similarly
        });
  }
}
