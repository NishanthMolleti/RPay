import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Account.dart';
import 'package:flutter_application_1/screen/ConfirmPayment.dart';
import 'package:flutter_application_1/screen/EnterAmount.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';
import 'package:flutter_application_1/screen/SearchPage.dart';
//import 'package:flutter_application_1/screen/Testing.dart';
import 'package:flutter_application_1/screen/TransactionComplete.dart';
import 'package:flutter_application_1/screen/qrcodepage.dart';

void main() => runApp(MyApp());
const primaryColor = Color(0xFFFFFFFF);
dynamic res = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          //add more pages based on the need similarly
        });
  }
}
