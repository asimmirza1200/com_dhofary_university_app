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


class Language extends StatefulWidget {
  Data data;

  Language(this.data) ;

    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".


    @override
    _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  bool checkStaus;

  var selected=0;


    @override
    void initState() {
        super.initState();
  selected=LANGUAGE;

    }
  _willPop() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => HomePage(widget.data)));

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
                title: Text("Select Language"), backgroundColor: Color(int.parse("0xFF1C5E20")),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: ()  {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => HomePage(widget.data)));

                  },
                ),
              ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset("assets/logo.png",width: 200,height: 200,)),

                            Align(
                                alignment: Alignment.center,
                                child: Text("Select Language",style: TextStyle(fontSize: 22),)),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,50.0,0,0),
                              child: Container(
                                color:  selected==0?Color(int.parse("0xFF1C5E20")):Color(int.parse("0xFFffffff")),
                                width:130,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: new FlatButton(
                                      onPressed: () {
                                        updateState(0);
                                      },
                                      child: new Text('English',style: TextStyle(color:  selected==0?Color(int.parse("0xFFffffff")):Color(int.parse("0xFF1C5E20"))),),

                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:20.0),
                              child: Container(
                                color:  selected==1?Color(int.parse("0xFF1C5E20")):Color(int.parse("0xFFffffff")),
                                width:130,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: new FlatButton(
                                      onPressed: () {
                                        updateState(1);
                                      },
                                      child: new Text('Arabic',style: TextStyle(color:  selected==1?Color(int.parse("0xFFffffff")):Color(int.parse("0xFF1C5E20")),
                                      ),),

                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0,50.0,0,0),
                child: Container(
                  color:  Color(int.parse("0xFF1C5E20")),
                  width:230,
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: new FlatButton(
                        onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setInt('language', selected);
                        LANGUAGE=selected;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => HomePage(widget.data)));

                        },
                        child: new Text('Save',style: TextStyle(color:  Color(int.parse("0xFFffffff"))),),

                      ),
                    ),
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

  updateState(int i) {{
    setState(() {
     selected=i;
    });
    }
  }


}