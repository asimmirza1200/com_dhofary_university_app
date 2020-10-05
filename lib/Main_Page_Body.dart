import 'package:DhofaryUniversity/Data.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'Slider.dart';

class Main_Page_Body extends StatefulWidget {
  Data data;

  Main_Page_Body(this.data);

  @override
  _Main_Page_BodyState createState() => _Main_Page_BodyState(this.data);
}

class _Main_Page_BodyState extends State<Main_Page_Body> {

  List<String> listHeader = ['HEADER1','HEADER2','HEADER3','HEADER4','HEADER5','HEADER6','HEADER7','HEADER8','HEADER9','HEADER10',];
  List<String> listTitle = ['title1','title2','title3','title4',];

  Data data;

  _Main_Page_BodyState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
//              CarouselWithIndicatorDemo(),
              gridHeader(),
            ],
          ),
        ),
      ),
    );
  }


  Widget gridHeader(){
    return new ListView.builder(itemCount: data.mainPageList.length,itemBuilder: (context, index) {
      return new StickyHeader(
        header: new Container(
          height: 60.0,
          color: Color(int.parse("0xFF"+data.mainPageList.elementAt(index).color)),
          padding: new EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.centerLeft,
          child: new Text(data.mainPageList.elementAt(index).catTitle,
            style: const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
        content: Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data.mainPageList.elementAt(index).itemArray.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,),
            itemBuilder: (contxt, index){
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      data.mainPageList.elementAt(index).itemArray.elementAt(index).icon,
                      fit: BoxFit.fitWidth,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(data.mainPageList.elementAt(index).itemArray.elementAt(index).title),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
      shrinkWrap: true,
    );
  }
}