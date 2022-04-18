import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterAmount extends StatelessWidget {
  const EnterAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Container(
          width: double.infinity,
          //       color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: const Text(
                  "Top up",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      backgroundColor: Colors.transparent),
                ),
              ),
              const SizedBox(
                width: 30,
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bluesky.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                style: TextStyle(fontSize: 30, color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  fillColor: Colors.white,
                  //        filled: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.white,
                  enabled: true,
                  //     labelStyle:

                  //         hintText: 'Enter User Name / Rakuten Pay ID',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
