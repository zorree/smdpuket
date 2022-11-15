import 'package:flutter/material.dart';

class Content extends StatelessWidget{
  final String text1;
  final String text2;
  final double fontSize;
  final Color color;
  final Color bgColor;
  Content({this.text1="text1", this.text2="text2", this.fontSize=30.0, this.color=Colors.white, this.bgColor=Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return Container(
                color: Colors.blue[900],
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                       flex: 5,
                       child: Container(
                         color: bgColor,
                         margin: const EdgeInsets.all(0),
                         padding: const EdgeInsets.all(0),
                         child: Center(
                           child: Text(text1,
                             style: TextStyle(
                                 fontFamily: 'Loma',
                                 color: color,
                                 fontSize: fontSize,
                                 fontWeight: FontWeight.w700,
                                 )
                            ),
                         ),
                      ),
                    ),
                    Expanded(
                       flex: 5,
                       child: Container(
                         color: bgColor,
                         margin: const EdgeInsets.all(0),
                         padding: const EdgeInsets.all(0),
                         child: Text(text2,
                           style: TextStyle(
                               fontFamily: 'Loma',
                               color:color,
                               fontSize: fontSize,
                               fontWeight: FontWeight.w700)
                               ),
                      ),
                    ),
                  ],
                ),
                );
  }
}