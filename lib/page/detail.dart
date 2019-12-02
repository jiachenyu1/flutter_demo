import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    print(this.title);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0, brightness: Brightness.light, title: Text(this.title)),
      body: Container(
        width: 100,
        height: 100,
        color: Color.fromRGBO(0, 0, 0, 1),
        child: (Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 20,
                height: 20,
                color: Color.fromRGBO(100, 100, 100, 1),
              ),
              Container(
                width: 20,
                height: 20,
                color: Color.fromRGBO(150, 150, 150, 1),
              ),
            ])),
      ),
    );
  }
}
