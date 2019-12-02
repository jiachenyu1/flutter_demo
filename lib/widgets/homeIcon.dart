import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget{
    HomeIcon({Key key, this.url, this.text}) : super(key: key);

    final String url;
    final String text;

    @override
    Widget build(BuildContext context){

        return Container(
            child: (
                Column(
                    children: <Widget>[
                        Image.asset(this.url),
                        Text(this.text)
                    ],
                )
            ),
        );
    }
}