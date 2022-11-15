import 'package:flutter/material.dart';
import 'marquee_flutter.dart';

class MarqueeText extends StatelessWidget{
  final String text;
  final double fontSize;
  MarqueeText({this.text="",this.fontSize=30.0});
  @override
  Widget build(BuildContext context) {
    return 
      Container(
      color: Colors.grey[300],
      height: 40,
      child: MarqueeWidget(
              text: text,
              textStyle: 
                TextStyle(
                  fontFamily: 'DBAiry',
                  fontSize: fontSize+10,
                  color: Colors.blueGrey[900],
                  //fontWeight: FontWeight.w700
                  ),
              scrollAxis: Axis.horizontal,
              ratioOfBlankToScreen: 0.75,
            ),
      );
  }
}