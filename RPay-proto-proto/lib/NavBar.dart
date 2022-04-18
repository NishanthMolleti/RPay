// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Row(
            //change to row again
            children: <Widget>[
              Row(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(primary: Colors.black),
                      child: Icon(
                        Icons.arrow_back,
                      )),
                ],
              ),
              new Spacer(),
              Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(primary: Colors.black),
                        child: Icon(Icons.notifications_none_outlined),
                      ),
                    ]),
              ),
            ],
          ),

          //Add other functionalities here
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 15, right: 15, bottom: 7),
            child: Row(
              children: <Widget>[
                Text(
                  "Prepaid Debit - ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "\$1,203.23",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0, right: 15, bottom: 7, top: 7),
            child: Row(
              children: <Widget>[
                Text(
                  "Installments - ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "\$1000.00",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "Send Money",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Divider(
              color: Colors.grey,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "Cash Back - ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "\$87.35",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
            child: Row(
              children: const <Widget>[
                Text(
                  "Rakuten Points - ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "147P",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Divider(
              color: Colors.grey,
            ),
          ),
          //       Spacer(),
          // Center(
          //   child: Container(
          //     alignment: Alignment.bottomCenter,
          //     child: Column(
          //       //   mainAxisAlignment: MainAxisAlignment.end,
          //       //     crossAxisAlignment: CrossAxisAlignment.end,
          //       children: <Widget>[
          //         Text("gjh"),
          //         Text("hgj"),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 300,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Support ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Logout ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
