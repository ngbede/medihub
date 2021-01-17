import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:medihub/services/network.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> texts = [
    "Welcome To Medihub, A mobile medical diagnostic platform",
    "Get Real Time Medical Diagnostics Today for free",
    "We assign you to our catalog of great Medical Doctors for treatment"
  ];
  String url = "/symptoms";
  Map<String, String> querystring = {"language": "en-gb", "format": "json"};
  void printFile() async {
    dynamic json = await Network.getJson(querystring);
    print(json);
  }

  // @override
  // void initState() {
  //   printFile();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 42.0),
              child: Text(
                "About Us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/background.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "${texts[index]}",
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                loop: false,
                itemCount: 3,
                viewportFraction: 0.8,
                scale: 0.9,
                pagination: SwiperPagination(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
