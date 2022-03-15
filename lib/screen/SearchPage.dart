import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/EnterAmount.dart';
import 'package:flutter_application_1/screen/Navbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
//          "/Users/ar-molleti.nishanth/Desktop/project/flutter_application_1/Rakuten_Pay_logo.png",
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search for User',
                  hintText: 'Enter User Name / Rakuten Pay ID',
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 175.0,
              height: 55.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text('Find Account'),
                onPressed: () {},
              ),
            ),
            FloatingActionButton.extended(
              foregroundColor: Colors.white,
              label: Text("Pay Contact "),
              icon: Icon(Icons.payment),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                //        print("pressed"); //what should be done on pressing .
                Navigator.of(context).pushNamed(
                    //  "/Testing" /* Name of the page from the routes used  */
                    "/EnterAmount");
              },
            ),
            Text(
              "OR\n",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
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
    );
  }
}
