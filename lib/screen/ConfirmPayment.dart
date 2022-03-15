import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/EnterAmount.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
//          "/Users/ar-molleti.nishanth/Desktop/project/flutter_application_1/Rakuten_Pay_logo.png",
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
              " to User ?",
              style: TextStyle(fontSize: 50),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
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
