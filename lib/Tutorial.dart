import 'package:DhofaryUniversity/Constant.dart';
import 'package:DhofaryUniversity/Data.dart';
import 'package:DhofaryUniversity/Slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'MainPage.dart';




class TutorialPage extends StatefulWidget {
  Data data;

  TutorialPage(this.data);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage(widget.data)),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.network(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: getPageView(),
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      onSkip:() => _onIntroEnd(context) ,
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  getPageView() {
    List<PageViewModel> list = [];
    for(var i=0;i<widget.data.tutorialsList.length;i++){
      list.add(new PageViewModel(
        title: LANGUAGE==0?widget.data.tutorialsList.elementAt(i).message:widget.data.tutorialsList.elementAt(i).messageArabic,
        body:LANGUAGE==0?widget.data.tutorialsList.elementAt(i).body:widget.data.tutorialsList.elementAt(i).bodyArabic,
        image: _buildImage(widget.data.tutorialsList.elementAt(i).image),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.orange),
          bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
      ));
    }
   return list;
  }
}

