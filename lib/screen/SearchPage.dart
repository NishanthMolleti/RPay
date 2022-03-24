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
String receiverUid = "";
String receiverName = "";
// CREATING A STATEFUL WIDGET HERE 







//SUGGESTIVE SEARCH CODE ENDS HERE 

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
      
      body: Padding(
       
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                onChanged: (query) async {
                  contact = query;
                  if (query.length > 0) {
                    await getUserfromQuery(query.toString());
                    print(li.length); 
                    if (li.length > 0) {
                      receiverName = li[0].name;
                      receiverUid = li[0].userLoginId;
                    }
                    print(receiverUid);
                  }
                },

                /*
                onTap: (query) {
                  
                }, */
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  labelText: 'Search for User',
                  hintText: 'Enter User Name / Rakuten Pay ID',
                ),
              ),
            ),
            /*
            Expanded(
                child: ListView.builder(
                    itemCount: li.length,
                    itemBuilder: ((context, index) {
                      final user = li[index];

                      return ListTile(
                        title: Text(user.name + " " + user.userLoginId),
                      );
                    }))), */
            FloatingActionButton.extended(
              foregroundColor: Colors.white,
              label: Text(" Pay "), //remove the variable
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
      ); */
}
