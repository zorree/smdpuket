import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget{
  final String text;
  final double fontSize;
  HeaderText({this.text="",this.fontSize=30.0});
  @override
  Widget build(BuildContext context) {
    return 
      Container(
      color: Colors.yellow[500],
      height: 40,
      child: Center(
        child: Text( text,
                  style: TextStyle(
                    fontFamily: 'DBAiry',
                    fontSize: fontSize,
                    color: Colors.blueGrey[900],
                    //fontWeight: FontWeight.w700
                    ),
              ),
      ),
      );
  }
}