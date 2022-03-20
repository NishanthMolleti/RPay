import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Account.dart';
import 'package:flutter_application_1/screen/ConfirmPayment.dart';
import 'package:flutter_application_1/screen/EnterAmount.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';
import 'package:flutter_application_1/screen/SearchPage.dart';
import 'package:flutter_application_1/screen/SearchingforContacts.dart';
//import 'package:flutter_application_1/screen/Testing.dart';
import 'package:flutter_application_1/screen/TransactionComplete.dart';
import 'package:flutter_application_1/screen/qrcodepage.dart';
import 'package:flutter_application_1/screen/JsonParseDemo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'screen/HttpScreen.dart';

var x;
var y;
//var jsonResponse = getUserfromQuery('Nishanth');
dynamic getUserfromQuery(contact) async {
  var url = "localhost:8080";
  final response =
      await http.get(Uri.http(url, "walletengine/user/" + contact));
  //    await http.get(Uri.http(url, "walletengine/user/query/" + contact));

  if (response.statusCode == 200) {
    //   print("in status 200" + response.body);
    final jsonResponse = jsonDecode(response.body);
    x = jsonResponse['BALANCE'];
    y = jsonResponse['Status'];
    print(jsonResponse['NAME'] + " is the user ");
//    print(x.toString() + " balance here ");

    return jsonResponse;
  }
}

dynamic getUserfromSearch(searchval) async {
  var url = "localhost:8080";
  final response =
      await http.get(Uri.http(url, "walletengine/user/query/" + searchval));

  if (response.statusCode == 200) {
    dynamic d = json.decode(response.body);
    var users = d["Users"];
    //   print(users[1]["NAME"]);
    int l = users.length;
    //initialize a list
    List<String> a = [];
    for (int i = 0; i < l; i++) {
      a.add(users[i]["NAME"]);
    }
    return a;
  }
}

void main() => runApp(MyApp());
const primaryColor = Color(0xFFFFFFFF);
dynamic res = 0;
//var jsonResponse = getUserfromQuery('Nishanth');

class MyApp extends StatelessWidget {
  var jsonResponse = getUserfromQuery('Nishanth');

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
          "/Account": (BuildContext context) => new Account(),
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
