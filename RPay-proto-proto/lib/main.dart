import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpay_proto/EnterAmount.dart';
import 'package:rpay_proto/NavBar.dart';
import 'package:rpay_proto/SecondScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(/*const */ MyApp());
}

dynamic uid = "18891A05D0";
//dynamic x = getBalance();
dynamic balance;
dynamic getBalance() async {
  var url = "10.0.2.2:8080";
  final response = await http.get(Uri.http(url, "walletengine/balance/" + uid));

  if (response.statusCode == 200) {
    balance = int.parse(response.body.toString());
    return '';
  }
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  var x = getBalance();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
          routes: <String, WidgetBuilder>{
            "/EnterAmount": (BuildContext context) => const EnterAmount(),
            "/SecondScreen": (BuildContext context) => const SecondScreen(),
          });
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppBar appbar = AppBar(
    // title: const Text('Transparent AppBar'),
    // leading: const BackButton(),
    actions: [
      Container(
        margin: const EdgeInsets.all(5.0),
        child: Column(children: const [
          Text(
            "Cash Back",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(" 87.35 ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))
        ]),
      ),
      const VerticalDivider(color: Colors.white),
      GestureDetector(
        onTap: (() => print("Hi")),
        child: Container(
          margin: const EdgeInsets.all(5.0),
          child: Column(children: const [
            Text(
              "Rakuten Points",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text("147 Points",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      ),
    ],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
    ),
    backgroundColor: Colors.transparent, // Colors.white.withOpacity(0.1),
    elevation: 0,
  );
  double topMargin = 0;
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    topMargin = appbar.preferredSize.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const Navbar(),
      appBar: appbar,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bluesky.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: topMargin * 1.7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                  itemCount: 2,
                  itemBuilder: (context, index, realIndex) {
                    return buildPage('data', index);
                  },
                  options: CarouselOptions(
                      height: 150,
                      onPageChanged: ((index, reason) => {
                            setState(() => {activeIndex = index})
                          }))),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(35)),
                        ),
                        context: context,
                        builder: (context) => topUp(context));
                  },
                  child: buildBalance()),
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: buildIndicator()),
              Expanded(
                child: SingleChildScrollView(child: buildPayments()),
              ),
              // SingleChildScrollView(child: buildPayments()),
            ],
          ),
        )
      ]),
    );
  }

  Widget buildBalance() {
    getBalance();
    if (activeIndex == 0) {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Text(
                "Prepaid Balance",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "\$ ${balance}",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 18, right: 18),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "TOP UP",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ));
    } else {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Shopping Power",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      " \$1000.00",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Pay monthly",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      " \$60.00",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 18, right: 18),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "DETAIL",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ));
    }
  }

  List<String> active = ["Apple Store ", "Bose Store "];
  List<String> ended = ["Apple Store ", "Macy's"];
  List<String> descList = ["description ", "description1"];

  var logo = "assets/images/applelogo.png";
  //List<String,String>= acti=[];

  Widget buildPayments() {
    if (activeIndex == 0) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Prepaid Balance",
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Text(
                      "July 2",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const Expanded(
                      child: DottedLine(
                    dashColor: Colors.white,
                  )),
                  Container(
                    child: const Text(
                      "  \$22.30",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      "Best Buy",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "  \$15.30",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      "Starbucks Mobile Order",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "  \$7.00",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Text(
                      "July 1",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const Expanded(
                      child: DottedLine(
                    dashColor: Colors.white,
                  )),
                  Container(
                    child: const Text(
                      "  \$71.05",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(),
            //icon can be included , wrap it under a row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      "iTunes",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "  \$9.80",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      "Macys.com",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "  \$50.25",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //      mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Installment Activity",
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Text(
                      "Active",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const Expanded(
                      child: DottedLine(
                    dashColor: Colors.white,
                  )),
                  Container(
                    child: const Text(
                      "  \$780.00",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: ((context, index) {
                //             return Container(
                //       height: 20,
                //     var width;
                double width = MediaQuery.of(context).size.width * 0.6;
                return GestureDetector(
                  onTap: () {
                    //           print(index);
                    showDialogFunc(context, logo, active[index], active[index]);
                  },
                  child: Card(
                    color: Colors.transparent,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset("assets/images/applelogo.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                active[index],
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: width,
                                child: const Text(
                                  "3/6",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        //               new Spacer(),
                        Text(
                          " \$30",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  // child: ListTile(
                  //   tileColor: Colors.transparent
                  //   leading: CircleAvatar(),
                  //   title: Text(
                  //     active[index],
                  //     style: const TextStyle(fontSize: 18, color: Colors.white),
                  //   ),
                  //   subtitle: const Text(
                  //     "3/6",
                  //     style: TextStyle(fontSize: 10, color: Colors.white),
                  //   ),
                  //   trailing: const Text(
                  //     "Monthly \$30",
                  //     style: TextStyle(fontSize: 18, color: Colors.white),
                  //   ),
                  // ),
                );
              }),
              //         itemCount: 2,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: <Widget>[
            //       Container(
            //         margin: const EdgeInsets.only(right: 5),
            //         child: const Text(
            //           "Active",
            //           textAlign: TextAlign.left,
            //           style: TextStyle(fontSize: 18, color: Colors.white),
            //         ),
            //       ),
            //       const Expanded(
            //           child: DottedLine(
            //         dashColor: Colors.white,
            //       )),
            //       Container(
            //         child: const Text(
            //           "  \$780.00",
            //           textAlign: TextAlign.right,
            //           style: TextStyle(fontSize: 18, color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            //  SizedBox(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: const <Widget>[
            //       Expanded(
            //         child: Text(
            //           "Apple Store",
            //           style: TextStyle(fontSize: 18, color: Colors.white),
            //         ),
            //       ),
            //       Expanded(
            //         child: Text(
            //           " Monthly \$30.00",
            //           textAlign: TextAlign.right,
            //           style: TextStyle(
            //             fontSize: 22,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: const <Widget>[
            //       Expanded(
            //         child: Text(
            //           "Bose Store",
            //           style: TextStyle(fontSize: 18, color: Colors.white),
            //         ),
            //       ),
            //       Expanded(
            //         child: Text(
            //           " Monthly \$30.00",
            //           textAlign: TextAlign.right,
            //           style: TextStyle(
            //             fontSize: 22,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 30, //height added here
                    margin: const EdgeInsets.only(right: 5),
                    child: const Text(
                      "Ended",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const Expanded(
                      child: DottedLine(
                    dashColor: Colors.white,
                  )),
                  Container(
                    child: const Text(
                      "  \$423.20",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: ((context, index) {
                //             return Container(
                //       height: 20,
                //     var width;
                double width = MediaQuery.of(context).size.width * 0.6;
                return GestureDetector(
                  onTap: () {
                    //           print(index);
                    showDialogFunc(context, logo, active[index], active[index]);
                  },
                  child: Card(
                    color: Colors.transparent,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset("assets/images/applelogo.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                active[index],
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: width,
                                child: const Text(
                                  "3/6",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        //                      new Spacer(),
                        Text(
                          " \$30",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  // child: ListTile(
                  //   tileColor: Colors.transparent
                  //   leading: CircleAvatar(),
                  //   title: Text(
                  //     active[index],
                  //     style: const TextStyle(fontSize: 18, color: Colors.white),
                  //   ),
                  //   subtitle: const Text(
                  //     "3/6",
                  //     style: TextStyle(fontSize: 10, color: Colors.white),
                  //   ),
                  //   trailing: const Text(
                  //     "Monthly \$30",
                  //     style: TextStyle(fontSize: 18, color: Colors.white),
                  //   ),
                  // ),
                );
              }),
              //         itemCount: 2,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: const <Widget>[
            //       Expanded(
            //         child: Text(
            //           "Apple Store",
            //           style: TextStyle(fontSize: 18, color: Colors.white),
            //         ),
            //       ),
            //       Expanded(
            //         child: Text(
            //           " Monthly \$30.00",
            //           textAlign: TextAlign.right,
            //           style: TextStyle(
            //             fontSize: 22,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: const <Widget>[
            //       Expanded(
            //         child: Text(
            //           "Macys.com",
            //           style: TextStyle(fontSize: 18, color: Colors.white),
            //         ),
            //       ),
            //       Expanded(
            //         child: Text(
            //           " Monthly \$30.00",
            //           textAlign: TextAlign.right,
            //           style: TextStyle(
            //             fontSize: 22,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: const <Widget>[
            //       Expanded(
            //         child: Text(
            //           "Best Buy",
            //           style: TextStyle(fontSize: 18, color: Colors.white),
            //         ),
            //       ),
            //       Expanded(
            //         child: Text(
            //           " Monthly \$15.30",
            //           textAlign: TextAlign.right,
            //           style: TextStyle(
            //             fontSize: 22,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // ListView(
            //   shrinkWrap: true,
            //   children: const <Widget>[
            //     Text(
            //       "Hello",
            //       style: TextStyle(fontSize: 14),
            //     )
            //   ],
            // ),
          ],
        ),
      );
    }
  }

  Widget buildTransaction() {
    if (activeIndex == 0) {
      return Container(
        child: const Center(
            child: Text(
          "Transaction 1",
          style: TextStyle(color: Colors.white),
        )),
      );
    } else {
      return Container(
        child: const Center(
            child: Text(
          "Transaction 2",
          style: TextStyle(color: Colors.white),
        )),
      );
    }
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 2,
        effect: const JumpingDotEffect(
            dotHeight: 8.0,
            dotWidth: 8.0,
            activeDotColor: Colors.white,
            dotColor: Colors.grey),
      );

  Widget buildPage(String a, int index) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              context: context,
              builder: (context) => buildSheet());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.withOpacity(0.5),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Expanded(
                child: Row(children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Center(
                      child: Image.asset(
                        "assets/images/whitebgRakuten-removebg-preview.ico",
                        height: 40,
                        width: 70,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "Prepaid",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ]),
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "TAP TO REVEAL",
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "circle",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
              ),
            ]),
          ),
        ),
      );
}

// showModalBottomSheet(
//                         isScrollControlled: true,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(35),
//                               bottom: Radius.circular(35)),
//                         ),
//                         context: context,
//                         builder: (context) => topUp());
//                   },

Widget topUp(context) => Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          child: const Text(
            "Somnath your card",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "Credit/Debit  card",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              //            Expanded(
              // child:
              TextButton(
                onPressed: () {
                  //            BuildContext context ;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnterAmount()),
                  );
                },
                child: Text(
                  "Bank",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                //           ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "PayPal",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "Cash Back",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
              Text(
                "\$87.35",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.blue, fontSize: 20),
              )
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        const SizedBox(
          height: 100,
        ),
      ]),
    );

Widget buildSheet() => Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          child: const Text(
            "Your card detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: const Text(
            "Tap text to copy to clipboard",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Card number",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "1234567890123456",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Expire on",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "12/24",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Scurity code",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "543",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Card holder",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "Saily Anderson",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Card holder",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "Saily Anderson",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: const Text(
            "Renew number",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
      ]),
    );
showDialogFunc(context, logo, title, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "assets/images/applelogo.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "transaction details here ",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

// Scaffold(
//         drawer: const Navbar(),
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent, // Colors.white.withOpacity(0.1),
//           elevation: 0,
//           title: const Text(
//             "Hello Transperent AppBar with Body",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("assets/images/bluesky.jpg"),
//                       fit: BoxFit.cover)),
//             ),
//             const Center(child: Text("hi"))
//           ],
//         ));