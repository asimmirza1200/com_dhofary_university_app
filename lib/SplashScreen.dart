import 'dart:async';
import 'dart:convert';
import 'package:DhofaryUniversity/Data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'MainPage.dart';


class SplashScreen extends StatefulWidget {
    SplashScreen({Key key, this.title}) : super(key: key);

    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".

    final String title;

    @override
    _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
    void initState() {
        super.initState();

        fetchAlbum();

    }
    void fetchAlbum() async {
        final response = await http.get('http://192.168.18.148/dhofar_university/api/fetch_data.php');

        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            print(response.body);
            Timer(
                Duration(seconds: 1),
                    () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(Data.fromJson(jsonDecode(response.body))))));
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }
    @override
    Widget build(BuildContext context) {
        // This method is rerun every time setState is called, for instance as done
        // by the _incrementCounter method above.
        //
        // The Flutter framework has been optimized to make rerunning build methods
        // fast, so that you can just rebuild anything that needs updating rather
        // than having to individually change instances of widgets.
        return Scaffold(

        body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Image.asset("assets/logo.png"), // This trailing comma makes auto-formatting nicer for build methods.
        )
        );
    }
}