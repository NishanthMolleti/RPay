import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:flutter_application_1/screen/SearchPage.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/screen/ConfirmPayment.dart';

class TransactionComplete extends StatelessWidget {
  const TransactionComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            onPressed: () {
              Navigator.of(context).pushNamed(
                  "/HomePage" /* Name of the page from the routes used  */);
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
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Transaction Complete",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "Transaction Number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: Text(
                    "${jsonres["transaction_number"]}",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child:
                    Text("${jsonres["time"]}", style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Text(
                  "\$${jsonres["amount"]} USD",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text("is paid from your Rpay",
                    style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "balance to",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "$contact",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
