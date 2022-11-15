import 'package:flutter/material.dart';

import 'widgets.dart';

class ContentHeader extends StatelessWidget{
  final String caption1;
  final String caption2;
  final double fontSize;
  ContentHeader({this.caption1="คิวรับยา",this.caption2="คิวรับยา",this.fontSize=26.0});
  @override
  Widget build(BuildContext context) {
    return Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: ContentShadow(text1:caption1,text2:"สถานะ",fontSize: fontSize,bgColor: Colors.lightBlue,),
            ),
            Expanded(
              flex: 5,
              child: ContentShadow(text1:caption2,text2:"สถานะ",fontSize: fontSize,bgColor: Colors.lightBlue,),
            ),
          ],
       );
  }
}