import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/Account.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:intl/intl.dart';

class Statements extends StatelessWidget {
  const Statements({Key? key}) : super(key: key);

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
            child: const Text("Refresh"),
            onPressed: () {
              Navigator.of(context).pop(
                  /* Name of the page from the routes used  */);
            },
          ),
        ],
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 10),
        child: Text(
          "Statement",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
