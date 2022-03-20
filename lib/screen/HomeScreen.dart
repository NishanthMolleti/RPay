import 'dart:html';
import 'package:flutter_application_1/screen/HttpScreen.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

import 'Rusers.dart';

String x = "";
//var jsonResponse = getUserfromQuery('Nishanth');

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
//          "/Users/ar-molleti.nishanth/Desktop/project/flutter_application_1/Rakuten_Pay_logo.png",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Center(
        child: RaisedButton.icon(
          onPressed: () {
            //           User result = getStudent("Anirudh") as User;
            //           print(result.Name);
            //     var jsonResponse = getUserfromQuery('Nishanth');
            //         print(x);
            Navigator.of(context).pushNamed(
                "/Account" /* Name of the page from the routes used  */
                );
          },
          icon: Icon(Icons.settings),
          label: Text(
            "Authenticate",
            style: TextStyle(fontSize: 30),
          ),
          color: Colors.red,
        ),
      ),
    );
  }
}
