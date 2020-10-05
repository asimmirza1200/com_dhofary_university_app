import 'package:DhofaryUniversity/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Main_Page_Body.dart';


class HomePage extends StatelessWidget {
  final appTitle = 'Dhofar University';
  Data data;

  HomePage(this.data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: HomePageState(title: appTitle,data:this.data),
    );
  }
}

class HomePageState extends StatelessWidget {
  final String title;
  final Data data;

  HomePageState({Key key, this.title, Key key2, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Main_Page_Body(data),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

        child: Column (

          children: <Widget>[
          Container(
            child: DrawerHeader(
                child: Image.asset("assets/logo.png"),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
          )
            ,
            Expanded(
              child: new ListView.builder
                (

                  itemCount: data.menuList.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new ListTile(
                        title:Row(
                          children: <Widget>[
                            Image.network(data.menuList.elementAt(index).icon,width: 40,height: 40,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.menuList.elementAt(index).title,style: TextStyle(fontSize: 17),),
                            )
                          ],
                        ),
                        onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    }
                    );
                  }
              ),
            ),
          ],
        )
//        child: ListView(
//
//          // Important: Remove any padding from the ListView.
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            DrawerHeader(
//              child: Image.asset("assets/logo.png"),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//              ),
//            ),
//
//            ,
//          ],
//        ),
      ),
    );
  }
}

