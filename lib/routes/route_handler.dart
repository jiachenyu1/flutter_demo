import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../page/detail.dart';

var detailsHandler = new Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
        String title = params['title'].first;
        print('index>details goodsID is ${title}');
        return Detail();
    }
);