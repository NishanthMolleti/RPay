import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';

class Navbar extends StatelessWidget {
  // const Navbar({Key? key, IconThemeData iconTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
//      child: Text("Hii Drawer"),
        //    backgroundColor: Colors.red,
        child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("User Name"),
          accountEmail: Text("user@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
                /* child: Image.asset(
              "assets/images/RakutenPay.jpg",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ), */
                ),
          ),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
        ListTile(
          leading: Icon(Icons.qr_code),
          title: Text("My QR"),
          onTap: () {
            Navigator.of(context).pushNamed(
                "/qrcodepage" /* Name of the page from the routes used  */); //try to show my qr code ;
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          onTap: () {
            Navigator.of(context).pushNamed("/HomeScreen");
          },
        ),
      ],
    ));
  }
}
