import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:medihub/models/useraccount.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                child: Icon(
                  FluentIcons.person_20_filled,
                  color: Color(0XFFC0F9EC),
                  size: 50,
                ),
                backgroundColor: Colors.white,
                radius: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Welcome ${Provider.of<UserAccount>(context).getFirstName()}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.white.withOpacity(0.7), BlendMode.dstATop),
                    image: AssetImage("images/home_doc_nurse.jpg"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "${texts[index]}",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0XFF85ADFF),
                        fontWeight: FontWeight.bold),
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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Image.asset("images/surgeon.png"),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "Medihub is brought to you by a team of passionate developers who are working ever so hard to ensure the needs of the users are met. In case you experience any issues while using the app, do not hesitate to reach out to us by sending an mail to medihub@support.com. Please note any donations you may have is kindly received."),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
