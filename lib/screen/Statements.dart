import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/Account.dart';
import 'package:flutter_application_1/screen/Navbar.dart';

class Statements extends StatefulWidget {
  const Statements({
    Key? key,
  }) : super(key: key);
  // final String title;
  @override
  State<Statements> createState() => _StatementsState();
}

class _StatementsState extends State<Statements> {
  String _dropdownValue = "2022";
  List<String> dropDownOptions = [
    "2022",
    "2021",
    "2020",
    "2019",
  ];

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
      Navigator.of(context).pushNamed("/StatementMonth");
    }
  }

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
            onPressed: () async {
              await getBalance();
              //       bal = NumberFormat.decimalPattern('en_us').format(balance);
              Navigator.of(context).pushNamed(
                  "/Account" /* Name of the page from the routes used  */);
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
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "Statements",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Year: $_dropdownValue",
                      style: TextStyle(fontSize: 20),
                    ),
                    DropdownButton(
                      items: dropDownOptions
                          .map<DropdownMenuItem<String>>((String mascot) {
                        return DropdownMenuItem<String>(
                            child: Text(mascot), value: mascot);
                      }).toList(),
                      value: _dropdownValue,
                      onChanged: dropdownCallback,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
