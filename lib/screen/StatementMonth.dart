import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/Navbar.dart';

class StatementMonth extends StatefulWidget {
  const StatementMonth({Key? key}) : super(key: key);

  @override
  State<StatementMonth> createState() => _StatementMonthState();
}

List<String> months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

class _StatementMonthState extends State<StatementMonth> {
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
          Center(
            child: TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 700,
            child: Scrollbar(
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: months.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Center(child: Text('${months[index]}')),
                  );
                  // return GestureDetector(
                  //   onTap: () {
                  //     AutocompleteOnSelected(option);
                  //   },
                  // );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
