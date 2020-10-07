import 'package:DhofaryUniversity/AboutScreen.dart';
import 'package:DhofaryUniversity/Data.dart';
import 'package:DhofaryUniversity/Language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Constant.dart';
import 'Slider.dart';
import 'Slider.dart';


class HomePage extends StatelessWidget {
  final appTitle = 'Dashboard';
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
    return WillPopScope(
      onWillPop:()=> _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title), backgroundColor: Color(int.parse("0xFF1C5E20")),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () => _showPopupMenu(context)
              ,
            )
          ],
        ),
        body: CarouselWithIndicatorDemo(this.data),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.

            child: Column(

              children: <Widget>[
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/splash.png", width: 500, fit: BoxFit.fitWidth,),

                )
                ,
                Expanded(
                  child: new ListView.builder
                    (

                      itemCount: data.menuList.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return new ListTile(
                            title: Row(
                              children: <Widget>[
                                Image.network(BASE_URL + data.menuList
                                    .elementAt(index)
                                    .icon, width: 40, height: 40,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(LANGUAGE==0?data.menuList
                                      .elementAt(index)
                                      .title:data.menuList
                                      .elementAt(index)
                                      .arabicTitle, style: TextStyle(fontSize: 17),),
                                )
                              ],
                            ),
                            onTap: () {
                              _launchURL(data.menuList
                                  .elementAt(index).redirectUrl);
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
  _showPopupMenu(context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
      //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('About US'), value: '1'),
        PopupMenuItem<String>(
            child: const Text('Language'), value: '2'),

      ],
      elevation: 8.0,
    )
        .then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AboutScreen(data)));
      } else if (itemSelected == "2") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Language(data)));
        //code here
      } else {
        //code here
      }
    });
  }

  Future<bool> _onWillPop(context) async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Center(child: new Text('Confirm Exit')),
        content: Container(
          height: 85,
          child: Column(
            children: <Widget>[
              new Text('Do you want to exit an App'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 0),
                child: Row(

                  children: <Widget>[
                    Container(
                      width:130,
                      child: Center(
                        child: new FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: new Text('No',),
                        ),
                      ),
                    ),
                    Container(
                      color:  Color(int.parse("0xFF3980F6")),
                      width:130,
                      child: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: new FlatButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: new Text('Yes',style: TextStyle(color: Colors.white),),

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
//        content: new Text('Do you want to exit an App'),
      ),
    )) ;
  }
}
