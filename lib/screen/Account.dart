import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';

import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

dynamic getBalance() async {
  var url = "localhost:8080";
  final response = await http.get(Uri.http(url, "walletengine/balance/" + uid));

  if (response.statusCode == 200) {
    balance = int.parse(response.body.toString());
    print(balance);
    return "";
  }
}

class Account extends StatelessWidget {
  //const Account({Key? key}) : super(key: key);
  //var j = getUserfromInfo(loginUser);
  String loginUserName = "", loginUserBalance = "";
  Account(
      {Key? key, required this.loginUserName, required this.loginUserBalance})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: [
            TextButton(
              child: Text("Back"),
              onPressed: () async {
                await getBalance();
                Navigator.of(context).pushNamed(
                    "/Account" /* Name of the page from the routes used  */);
              },
            ),
          ],
          backgroundColor: primaryColor,
          title: Image.asset(
            "assets/images/RakutenPay.jpg",
            fit: BoxFit.cover,
            height: 30,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hi ${uname} ,  ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text('\$ ${balance} in RPay\n\n',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton.extended(
                    foregroundColor: Colors.white,
                    label: Text("Scan QR"),
                    icon: Icon(Icons.qr_code),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      print(
                          "opening camera"); //what should be done on pressing .
                    },
                  ),
                  FloatingActionButton.extended(
                    foregroundColor: Colors.white,
                    label: Text("Pay/Recieve"),
                    icon: Icon(Icons.payments),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          "/SearchPage" /* Name of the page from the routes used  */); // what should be done on pressing .
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
