import 'package:DhofaryUniversity/Data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'Constant.dart';

//final List<String> imgList = [
//  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//];
Data data2;
class CarouselWithIndicatorDemo extends StatefulWidget {
  Data data;

  CarouselWithIndicatorDemo( this.data);

  @override
  State<StatefulWidget> createState() {
    data2=this.data;
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;


  _CarouselWithIndicatorState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child:
        ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(height: 220.0,autoPlay: true,aspectRatio: 10),
                  items: data2.bannerList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width+50,
                          child: Card(
                            elevation: 2.0,
                            child:Image.network(BASE_URL+i.image)
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                new SizedBox(height: 20.0),
                new ListView.builder(
                  shrinkWrap: true,
                  itemCount: data2.mainPageList.length,
                  physics: PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return new Column(
                      children: <Widget>[
                        new Container(
                          height: 50.0,
                          color: Color(int.parse("0xFF"+data2.mainPageList.elementAt(index).color)),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              new Padding(
                                  padding: const EdgeInsets.only(left: 5.0)),
                              new Text(data2.mainPageList.elementAt(index).catTitle,
                                  style: new TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                            ],
                          ),
                        ),
                        Container(
                          child: GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            physics: PageScrollPhysics(),
                            children: List.generate(data2.mainPageList.elementAt(index).itemArray.length, (inde2x) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        BASE_URL+data2.mainPageList.elementAt(index).itemArray.elementAt(inde2x).icon,
                                        fit: BoxFit.fitWidth,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                      Text(data2.mainPageList.elementAt(index).itemArray.elementAt(inde2x).title.substring(0,data2.mainPageList.elementAt(index).itemArray.elementAt(inde2x).title.length>8?8:data2.mainPageList.elementAt(index).itemArray.elementAt(inde2x).title.length),style: TextStyle(fontSize: 14),),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        new SizedBox(height: 20.0),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        )
      ),
    );
  }

//  Widget gridHeader(){
//    return new ListView.builder(itemCount: data2.mainPageList.length,itemBuilder: (context, index) {
//      return new StickyHeader(
//
//        header: new Container(
//          height: 60.0,
//          color: Color(int.parse("0xFF"+data2.mainPageList.elementAt(index).color)),
//          padding: new EdgeInsets.symmetric(horizontal: 12.0),
//          alignment: Alignment.centerLeft,
//          child: new Text(data2.mainPageList.elementAt(index).catTitle,
//            style: const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
//          ),
//        ),
//        content: Container(
//          child: GridView.builder(
//            shrinkWrap: true,
//            physics: PageScrollPhysics(),
//            itemCount: data2.mainPageList.elementAt(index).itemArray.length,
//            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,),
//            itemBuilder: (contxt, indx){
//              return Column(
//                mainAxisSize: MainAxisSize.min,
//                children: [
//                  ClipRRect(
//                    borderRadius: BorderRadius.circular(50.0),
//                    child: Image.network(
//                      data2.mainPageList.elementAt(index).itemArray.elementAt(indx).icon,
//                      fit: BoxFit.fitWidth,
//                      height: 80,
//                      width: 80,
//                    ),
//                  ),
//                  SizedBox(
//                    width: 80,
//                    child: FittedBox(
//                      fit: BoxFit.fitWidth,
//                      child: Text(data2.mainPageList.elementAt(index).itemArray.elementAt(indx).title),
//                    ),
//                  ),
//                ],
//              );
//            },
//          ),
//        ),
//      );
//    },
//      shrinkWrap: true,
//    );
//  }

//  final List<Widget> imageSliders = data2.bannerList.map((item) => Container(
//    child: Container(
//      margin: EdgeInsets.all(5.0),
//      child: ClipRRect(
//          borderRadius: BorderRadius.all(Radius.circular(5.0)),
//          child: Stack(
//            children: <Widget>[
//              Image.network(item.image, fit: BoxFit.cover, width: 1000.0),
//              Positioned(
//                bottom: 0.0,
//                left: 0.0,
//                right: 0.0,
//                child: Container(
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      colors: [
//                        Color.fromARGB(200, 0, 0, 0),
//                        Color.fromARGB(0, 0, 0, 0)
//                      ],
//                      begin: Alignment.bottomCenter,
//                      end: Alignment.topCenter,
//                    ),
//                  ),
//                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                  child: Text(
//                    'No. ${item.id} image',
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 20.0,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          )
//      ),
//    ),
//  )).toList();
}