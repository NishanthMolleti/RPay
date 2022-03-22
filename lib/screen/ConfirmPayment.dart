import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/EnterAmount.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:flutter_application_1/screen/SearchPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var jsonres;
sendPostRequest() async {
  Map data = {
    "sender": "18891A05D6",
    "receiver": "18891A05D0",
    "amount": "1000"
  };

  var url = 'http://localhost:8080/walletengine/transfer/';
  http.post(Uri.parse(url), body: data).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  });
  return "";
}

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 50)),
            Text(
              "Pay \$",
              style: TextStyle(fontSize: 50),
            ),
            Text(
              res.toString(),
              style: TextStyle(fontSize: 50),
            ),
            Text(
              " to " + contact.toString() + " ?",
              style: TextStyle(fontSize: 50),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    //post request here
                    print("pressed");
                    String a = '''{
                      "status": 1,
                      "transaction_number":
                          "92a7dd44-8ef1-414b-8bf8-7fa13f9988d2_22032022_112027",
                      "time": "2022-03-22 11:20:27",
                      "amount": 1000,
                      "sender": "18891A05D6",
                      "receiver": "18891A05D0"
                    }''';
                    jsonres = json.decode(a);
                    print(jsonres["status"]);

                    //print(sendPostRequest());
                    Navigator.of(context).pushNamed(
                        "/TransactionComplete" /* Name of the page from the routes used  */
                        );
                  },
                  backgroundColor: Colors.red,
                  extendedTextStyle: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  label: Text("Pay"),
                ),
              ],
            )
/*          Container(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      "/TransactionComplete" /* Name of the page from the routes used  */
                      );
                },
                backgroundColor: Colors.red,
                extendedTextStyle: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                label: Text("Pay"),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
