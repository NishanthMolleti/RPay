import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/HttpScreen.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:http/http.dart' as http;

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);
  dynamic getUserfromQuery(contact) async {
    var url = "localhost:8080";
    final response =
        await http.get(Uri.http(url, "walletengine/user/" + contact));
    //    await http.get(Uri.http(url, "walletengine/user/query/" + contact));

    if (response.statusCode == 200) {
      //   print("in status 200" + response.body);
      final jsonResponse = jsonDecode(response.body);
      x = jsonResponse['BALANCE'];
      print(jsonResponse['NAME']);
//    print(x.toString() + " balance here ");

      return jsonResponse;
    }
  }

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
          padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hi Nishanth,  ',
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
                    child: Text('\$ ${x.toString()} in RPay\n\n',
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
                      var jsonResponse = getUserfromQuery('Nishanth');
                      print(jsonResponse.body);
                      print(jsonResponse['BALANCE']);
                      print("pressed"); //what should be done on pressing .
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
