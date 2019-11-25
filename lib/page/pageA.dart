import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  PageA({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    print(this.title);
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: AppBar(
//        elevation: 0,
//        brightness: Brightness.light,
//        title: Text(this.title)
//      ),
      body: Container(
        width: 100,
        height: 100,
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
    );
  }
}
