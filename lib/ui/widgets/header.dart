import 'package:flutter/material.dart';
import 'package:VachiraDash/model/configuration.dart';

import '../crud_form.dart';

class Header extends StatelessWidget{
  final String text1;
  final String text2;
  final double fontSize;
  final Color color;
  final Color bgColor;
  final Configuration configuration;
  Header({this.text1="text1",this.text2="text2",this.fontSize=40.0, this.color=Colors.blueGrey,this.bgColor=Colors.blueGrey,this.configuration});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[500],
      child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        width: 100,
                        height: 100,
                        child: Center(
                            child: Image(
                                image: AssetImage('assets/images/logo.png'),
                                width: 100.0,
                                height: 100.0))),
                  ],
                ),
                 Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: 0, left: 0, right: 50, bottom: 0),
                        child: Text(text1,
                            style: TextStyle(
                                fontFamily: 'DBAiry',
                                color:Colors.blueGrey[900],
                                fontSize: fontSize,
                                //fontWeight: FontWeight.w700
                                )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width ,
                        margin: EdgeInsets.only(
                          top: 0, left: 50, right: 100, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("คิว",
                                style: TextStyle(
                                    fontFamily: 'DBAiry',
                                    color:Colors.black,
                                    fontSize: fontSize+fontSize,
                                    fontWeight: FontWeight.w900)),
                            Text("รอเรียก",
                                style: TextStyle(
                                    fontFamily: 'DBAiry',
                                    color:Colors.red,
                                    fontSize: fontSize+fontSize,
                                    fontWeight: FontWeight.w900)),
                            Text("รับยา",
                                style: TextStyle(
                                    fontFamily: 'DBAiry',
                                    color:Colors.black,
                                    fontSize: fontSize+fontSize,
                                    fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ),
                      /* Container(
                        child: 
                          Text(text2,
                             style: TextStyle(
                              fontFamily: 'DBAiry',
                              color:Colors.blueGrey[900],
                              fontSize: fontSize,
                              //fontWeight: FontWeight.w700
                              )
                          ),
                        ), */
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 100,
                  child: Center(
                      child: IconButton(
                          icon: Icon(Icons.settings),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (BuildContext context) => CrudForm(configuration: configuration,),
                            ));
                          })),
                ),

              ],
            ),
    );
  }
}