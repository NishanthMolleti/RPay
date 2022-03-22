import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:flutter_application_1/screen/Account.dart';
import 'package:flutter_application_1/screen/HttpScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

import 'Rusers.dart';

String loginUser = "";
String x = "";
dynamic uname = "";
dynamic uid = "";
int balance = 0;
dynamic getUserfromInfo(contact) async {
  var url = "localhost:8080";
  final response =
      await http.get(Uri.http(url, "walletengine/user/" + contact));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    balance = jsonResponse["balance"];
    uname = jsonResponse["name"];
    uid = jsonResponse["user_login_id"];

    print("async call " + uname + uid + balance.toString());
    return jsonResponse;
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Container(
                width: 200,
                height: 75,
                child: Image.asset(
                  "assets/images/RakutenPay.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'User ID',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                onChanged: (value) {
                  loginUser = value;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 30, right: 30),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                width: 150,
                height: 50,
                child: FloatingActionButton.extended(
                  foregroundColor: Colors.white,
                  label: Text("Login"), //remove the variable
                  icon: Icon(Icons.login),

                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    var j = getUserfromInfo(loginUser);
                    //                  sleep(const Duration(seconds: 1));
                    for (int i = 0; i < 9000000000; i++) {}

                    print("jsakldf" + uname + uid + balance.toString());
                    Navigator.of(context).pushNamed(
                        "/Account" /* Name of the page from the routes used  */
                        );
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Account(
                              loginUserName: 'test',
                              loginUserBalance: '999',
                            )));
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
