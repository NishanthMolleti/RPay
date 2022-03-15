import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/Navbar.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

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
            //      crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, //put start in place of spaceEvenly
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Hi Nishanth, \n',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30,
                  )),
              Column(
                //    mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('\$ 3000 in RPay\n\n',
                      textAlign: TextAlign.end,
                      //    textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton.extended(
                    foregroundColor: Colors.white,
                    label: Text("Pay Contact "),
                    icon: Icon(Icons.payment),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          "/SearchPage" /* Name of the page from the routes used  */); // what should be done on pressing .
                    },
                  ),
                  FloatingActionButton.extended(
                    foregroundColor: Colors.white,
                    label: Text("Pay using QR"),
                    icon: Icon(Icons.payment),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      print("pressed"); //what should be done on pressing .
                    },
                  ),
                ],
              )
            ],
          ),
        ),

//        floatingActionButton: buildNavigateButton(),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  Widget buildNavigateButton1() => FloatingActionButton.extended(
        foregroundColor: Colors.white,
        label: Text("Pay using Contact Name"),
        icon: Icon(Icons.payment),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          print("pressed");
        },
      );
  Widget buildNavigateButton() => FloatingActionButton.extended(
        foregroundColor: Colors.white,
        label: Text("Pay using QR"),
        icon: Icon(Icons.payment),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          print("pressed");
        },
      );
}
