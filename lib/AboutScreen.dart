import 'dart:async';
import 'dart:convert';
import 'package:DhofaryUniversity/Constant.dart';
import 'package:DhofaryUniversity/Data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MainPage.dart';
import 'Tutorial.dart';


class AboutScreen extends StatefulWidget {
  Data data;

  AboutScreen(this.data) ;

    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".


    @override
    _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool checkStaus;


    @override
    void initState() {
        super.initState();


    }


    @override
    Widget build(BuildContext context) {
        // This method is rerun every time setState is called, for instance as done
        // by the _incrementCounter method above.
        //
        // The Flutter framework has been optimized to make rerunning build methods
        // fast, so that you can just rebuild anything that needs updating rather
        // than having to individually change instances of widgets.
        return WillPopScope(
          onWillPop:()=>_willPop(),
          child: Scaffold(
              appBar: AppBar(
                title: Text("About US"), backgroundColor: Color(int.parse("0xFF1C5E20")),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: ()  {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(widget.data)));

                },
                ),
              ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  child: Card(

                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Dhofar Univerity",style: TextStyle(fontSize: 22),)),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:16.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("About US",style: TextStyle(fontSize: 19),)),
                          ),

                      Align(
                        alignment: Alignment.centerLeft,child:Text("Dhofar Univerity(DU) is a private, not-for-profit insitution of highher education in Salalah, Sultanate of Oman, established by Ministerial Decree No. 5/2004, issued in January 2004")),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: GestureDetector(
                  onTap:()=> _launchURL("https://www.snapchat.com/dh_university"),

                  child: Container(
                    height: 60,
                    child: Card(

                      elevation: 8,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/snapchat.png",
                              fit: BoxFit.fitWidth,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Text("Follow us on Snapchat",style: TextStyle(fontSize: 14),),
                        ],
                      ),                ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: GestureDetector(
                  onTap:()=> _launchURL("https://www.instagram.com/dh_university"),
                  child: Container(

                    height: 60,
                    child: Card(

                      elevation: 8,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/instagram.png",
                              fit: BoxFit.fitWidth,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Text("Follow us on Instagram",style: TextStyle(fontSize: 14),),
                        ],
                      ),                ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: GestureDetector(
                  onTap:()=> _launchURL("https://www.twitter.com/dh_university"),

                  child: Container(
                    height: 60,
                    child: Card(

                      elevation: 8,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/twitter.png",
                              fit: BoxFit.fitWidth,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Text("Follow us on Twitter",style: TextStyle(fontSize: 14),),
                        ],
                      ),                ),
                  ),
                ),
              ),

            ],
          )
          ),
        );
    }
  _launchURL(var url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _willPop() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => HomePage(widget.data)));

  }
}