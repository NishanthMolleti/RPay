import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/EnterAmount.dart';
import 'package:flutter_application_1/screen/HttpScreen.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:flutter_application_1/screen/QueryUsers.dart';
import 'package:http/http.dart' as http;

dynamic contact = '';
dynamic uname = "";
dynamic uid = "";
List<String> temp = [];
List<String> tempdata = [];
/* Future<List<String>>*/ dynamic getUserfromSearch(searchval) async {
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
  temp = a;
  tempdata = a;

  return users[0]["NAME"];
//    return temp;
}

class SearchPage extends StatelessWidget {
  List<User> newUsers = [];
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
                onChanged: (query) {
                  //               print(query);
                  /*Text(
                    li.toString(),
                  );  */
                  if (query.length > 0) {
                    getUserfromQuery(query);
                    print(li.length);
                    for (int i = 0; i < li.length; i++) {
                      print(li[i].name + " ");
                    }
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  labelText: 'Search for User',
                  hintText: 'Enter User Name / Rakuten Pay ID',
                ),
              ),
            ),
            /*
            ListView.builder(
              itemCount: li.length,
              itemBuilder: (context, index) {
                final user = li[index];
                return builduser(user);
              },
            ),*/
            //        Text(li.length.toString())

            Expanded(
                child: ListView.builder(
                    itemCount: li.length,
                    itemBuilder: ((context, index) {
                      final user = li[index];

                      return ListTile(
                        title:
                            Text(user.name + " " + user.account_id.toString()),
                      );
                    }))),

            FloatingActionButton.extended(
              foregroundColor: Colors.white,
              label: Text("Pay using QR "), //remove the variable
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
    );
  }
/*
  Widget builduser(User user) => ListTile(
        title: Text(user.name),
        subtitle: Text(user.account_id.toString()),
      );*/
}
