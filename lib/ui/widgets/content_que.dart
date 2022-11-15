import 'package:flutter/material.dart';
import 'package:VachiraDash/model/que_display.dart';

import 'widgets.dart';

class ContentQue extends StatelessWidget{
  final List<QueDisplay> queCol1As;
  final List<QueDisplay> queCol1Bs;
  final List<QueDisplay> queCol2As;
  final List<QueDisplay> queCol2Bs;
  final double fontSize;
  ContentQue({this.queCol1As,this.queCol1Bs,this.queCol2As,this.queCol2Bs, this.fontSize=30.0});

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
  @override
  Widget build(BuildContext context) {
    List<QueDisplay> queCol1s = queCol1As + queCol1Bs;
    List<QueDisplay> queCol2s = queCol2As + queCol2Bs;
    return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: queCol1s.length,
                itemBuilder: (BuildContext context, int index) 
                {
                return 
                  Content(
                    text1:queCol1s[index].rxq!=''?queCol1s[index].rxq:queCol1s[index].visitq,
                    text2:queCol1s[index].orderState.state_description,
                    color:hexToColor(queCol1s[index].orderState.state_color),
                    bgColor:hexToColor(queCol1s[index].orderState.state_bgcolor),
                    fontSize: fontSize,
                    );
                }

              ),
            ),
            Expanded(
              flex: 5,
              child:ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: queCol2s.length,
                  itemBuilder: (BuildContext context, int index) 
                  {
                  return 
                    Content(
                      text1:queCol2s[index].rxq!=''?queCol2s[index].rxq:queCol2s[index].visitq,
                      text2:queCol2s[index].orderState.state_description,
                      color:hexToColor(queCol2s[index].orderState.state_color),
                      bgColor:hexToColor(queCol2s[index].orderState.state_bgcolor),
                      fontSize: fontSize,
                      );
                  }

                ),
            ),
          ],
       );
  }
}