import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/EnterAmount.dart';
import 'package:flutter_application_1/screen/HttpScreen.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:http/http.dart' as http;

dynamic contact = '';
dynamic uname = "";
dynamic uid = "";

class SearchPage extends StatelessWidget {
  // const SearchPage({Key? key}) : super(key: key);

  List<String> tempdata = [];
  Future<List<String>> getUserfromSearch(searchval) async {
    var url = "localhost:8080";
    final response =
        await http.get(Uri.http(url, "walletengine/user/query/" + searchval));

    dynamic d = json.decode(response.body);
    var users = d["Users"];
    //   print(users[1]["NAME"]);
    int l = users.length;
    //initialize a list
    List<String> a = [];
    for (int i = 0; i < l; i++) {
      a.add(users[i]["NAME"]);
    }
    tempdata = a;
    //   print(tempdata);
//    print(a);

    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
//          "/Users/ar-molleti.nishanth/Desktop/project/flutter_application_1/Rakuten_Pay_logo.png",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      //   COMMENTING TILL LINE 143 , PLEASE REVERT BACK IF IT DOESNT WORK AS EXPECTED
      body: Padding(
        //use padding if it doesnt work
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                onChanged: (value) {
                  contact = value;
                  //           print(value);
                  var searching = getUserfromSearch(value);
                  print(getUserfromSearch(value));
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search for User',
                  hintText: 'Enter User Name / Rakuten Pay ID',
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[],
            ),
            /*()          FloatingActionButton.extended(
              foregroundColor: Colors.white,
              label: Text("Pay Contact "),
              icon: Icon(Icons.payment),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                //        print("pressed"); //what should be done on pressing .
                // if
                Navigator.of(context).pushNamed(
                    //  "/Testing" /* Name of the page from the routes used  */
                    "/EnterAmount");
              },
            ),   */

            FloatingActionButton.extended(
              foregroundColor: Colors.white,
              label: Text("Pay using QR"),
              icon: Icon(Icons.payment),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.of(context).pushNamed(
                    "/EnterAmount" /* Name of the page from the routes used  */
                    ); //remove later //what should be done on pressing .// actual method is TransactionComplete
              },
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Message',
                  hintText: 'Why are you paying ?',
                ),
              ),
            ),
          ],
        ),
      ),

      /*     body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  onChanged: (value) {
                    contact = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search for User',
                    hintText: 'Enter User Name / Rakuten Pay ID',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),          */
    );
  }
}