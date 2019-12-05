import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../routes/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            '变形金刚',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          brightness: Brightness.light),
      body: ListView(
        children: <Widget>[
//          CarouselSlider(child:HomeIcon(url: 'images/there_order@2x.png', text: '现场拍6')),
          Image.asset('images/banner.png'),
          HomeIconWrap(
            title: '现场拍',
            children: <Widget>[
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍1'),
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍2'),
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍3'),
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍4'),
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍'),
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍'),
            ],
          ),
          HomeIconWrap(
            title: '现场拍',
            children: <Widget>[
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍3'),
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍4'),
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍'),
            ],
          ),
          HomeIconWrap(
            title: '现场拍',
            children: <Widget>[
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍6'),
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍7'),
              HomeIcon(url: 'images/there_order@2x.png', text: '现场拍'),
            ],
          ),
//        CarouselSlider(child: [SliderView(), SliderView(), SliderView()])
//          CarouselSlider(
//            viewportFraction: 0.8,
//              aspectRatio: 16/9,
//            height: ScreenUtil().setWidth(410),
//            items: [1,2,3,4,5].map((i) {
//              return Builder(
//                builder: (BuildContext context) {
//                  return SliderView();
//                },
//              );
//            }).toList(),
//          )
          CarouselSlider(
            height: 400.0,
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.amber
                      ),
                      child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class HomeIconWrap extends StatelessWidget {
  HomeIconWrap({Key key, this.title, this.children}) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: ScreenUtil().setWidth(20),
                    color: Color.fromRGBO(245, 245, 249, 1)))),
        padding: new EdgeInsets.only(bottom: ScreenUtil().setWidth(60)),
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: new EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  top: ScreenUtil().setWidth(45),
                  bottom: ScreenUtil().setWidth(70)),
              child: Text(
                this.title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Wrap(
              children: this.children,
              runSpacing: ScreenUtil().setWidth(60),
            )
          ],
        )));
  }
}

class HomeIcon extends StatelessWidget {
  HomeIcon({Key key, this.url, this.text}) : super(key: key);

  final String url;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil.screenWidthDp / 4,
        child: Column(
          children: <Widget>[
            Container(
              padding: new EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
              child: Image.asset(this.url),
              width: ScreenUtil().setWidth(128),
              height: ScreenUtil().setWidth(128),
            ),
            Text(
              this.text,
              style: TextStyle(
                color: Color.fromRGBO(178, 185, 195, 1),
                fontSize: ScreenUtil().setSp(26),
              ),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}

class SliderView extends StatelessWidget {
  SliderView({Key key, this.carName}) : super(key: key);

  final String carName;

  Widget renderButton(String text) {
    return Container(
      width: ScreenUtil().setWidth(256),
      height: ScreenUtil().setWidth(70),
      alignment: Alignment(0, 0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(36, 134, 214, 1),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(4))),
      child: GestureDetector(
        child: Text(
          text,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(30),
              color: Color.fromRGBO(255, 255, 255, 1)),
        ),
        onTap: () => {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textStyle1 = TextStyle(
        fontSize: ScreenUtil().setSp(26),
        color: Color.fromRGBO(163, 166, 167, 1));
    var textStyle2 = TextStyle(
        fontSize: ScreenUtil().setSp(26),
        color: Color.fromRGBO(67, 165, 242, 1));
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: new EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.only(
          top: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(30),
          left: ScreenUtil().setWidth(30),
          bottom: ScreenUtil().setWidth(30)),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                offset: Offset(0, 0),
                blurRadius: ScreenUtil().setWidth(12),
                spreadRadius: 0)
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(28)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(80),
                  height: ScreenUtil().setWidth(34),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 249, 1),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setWidth(4))),
                  alignment: Alignment(0, 0),
                  child: Text(
                    '流拍',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        color: Color.fromRGBO(99, 104, 106, 1)),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '未处理计时',
                      style: textStyle1,
                    ),
                    Text(
                      '23',
                      style: textStyle2,
                    ),
                    Text(
                      '时',
                      style: textStyle1,
                    ),
                    Text(
                      '59',
                      style: textStyle2,
                    ),
                    Text(
                      '分',
                      style: textStyle1,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
              child: Text(
            '大众 迈腾 2007款 1.8T 自动 豪华型... ',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Color.fromRGBO(41, 43, 47, 1)),
          )),
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
            child: Text(
              '京RT5677 | VIN：J21123498381',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(26),
                  color: Color.fromRGBO(163, 166, 167, 1)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(50)),
            child: Text(
              '请决定要退车还是申请再拍',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(26),
                  color: Color.fromRGBO(163, 166, 167, 1)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[renderButton('联系卖家'), renderButton('查看详情')],
          )
        ],
      ),
    );
  }
}
