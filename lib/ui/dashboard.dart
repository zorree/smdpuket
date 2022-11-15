import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:VachiraDash/bloc/blocs.dart';
import 'package:VachiraDash/model/configuration.dart';
import 'crud_form.dart';
import 'widgets/widgets.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //final CurrentdateBloc _currentdateBloc = CurrentdateBloc();
  final ConfigBloc _configBloc = ConfigBloc();
  final QueueHeaderBloc _queueHeaderBloc = QueueHeaderBloc();
  final QueueBloc _queueBloc = QueueBloc();

  @override
  void initState() {
    //_currentdateBloc.add(LoadDate());
    _configBloc.add(ReadConfig());
    _queueHeaderBloc.add(LoadQueueHeader());
    _queueBloc.add(FetchQueue());
    //Timer.periodic(
    //    Duration(seconds: 1), (Timer t) => _currentdateBloc.add(LoadDate()));
    Timer.periodic(
        Duration(seconds: 30), (Timer t) => _configBloc.add(ReadConfig()));
    Timer.periodic(
        Duration(seconds: 30), (Timer t) => _queueHeaderBloc.add(LoadQueueHeader()));
    Timer.periodic(
        Duration(seconds: 30), (Timer t) => _queueBloc.add(FetchQueue()));
    super.initState();
  }

  @override
  void dispose() {
    _configBloc.close();
    _queueHeaderBloc.close();
    _queueBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      /* appBar: AppBar(
        title: Text('Flutter Form BLoC Example'),
        elevation: 2,
      ), */
      body: MultiBlocProvider(
        providers: [
          //BlocProvider<CurrentdateBloc>(
          //  create: (context) => _currentdateBloc,
          //),
          BlocProvider<ConfigBloc>(
            create: (context) => _configBloc,
          ),
          BlocProvider<QueueHeaderBloc>(
            create: (context) => _queueHeaderBloc,
          ),
          BlocProvider<QueueBloc>(
            create: (context) => _queueBloc,
          ),
        ],
        child: BlocBuilder<ConfigBloc, ConfigState>(
            builder: (context, configstate) {
          if (configstate is ConfigLoaded) {
            return ListView(
              //padding: EdgeInsets.only(top: 50.0),
              children: <Widget>[
                Header(
                      text1: "กลุ่มงานเภสัชกรรม โรงพยาบาลวชิระภูเก็ต",
                      fontSize: configstate.configuration.headerFontSize,
                      configuration: configstate.configuration,
                ),
                BlocBuilder<QueueHeaderBloc, QueueHeaderState>(
                    builder: (context, queueHeaderState) {
                  if (queueHeaderState is QueueHeaderLoaded) {
                    return HeaderText(
					            text:queueHeaderState.headerStr,
                      fontSize: configstate.configuration.bodyFontSize,
                    );
                  } else if(queueHeaderState is QueueHeaderFailure) {
                    return HeaderText(
                      text: queueHeaderState.errorMessage,
                      fontSize: configstate.configuration.bodyFontSize,
                    );
                  }else {
                    return HeaderText(
                      text:"Network connection error try again later.",
                      fontSize: configstate.configuration.bodyFontSize,
                    );
                  }
                }),
                if (configstate.configuration.message.length>0)
                MarqueeText(
                      text: configstate.configuration.message,
                      fontSize: configstate.configuration.headerFontSize,
                ),
                ContentHeader(
                  caption1: configstate.configuration.caption1,
                  caption2: configstate.configuration.caption2,
                  fontSize: configstate.configuration.bodyFontSize,
                ),
                BlocBuilder<QueueBloc, QueueState>(
                    builder: (context, queState) {
                  if (queState is QueueLoaded) {
                    return ContentQue(
                      queCol1As: queState.queCol1As,
                      queCol1Bs: queState.queCol1Bs,
                      queCol2As: queState.queCol2As,
                      queCol2Bs: queState.queCol2Bs,
                      fontSize: configstate.configuration.bodyFontSize,
                    );
                  } else if(queState is QueueFailure){
                    return Text(queState.errorMessage);
                  } else {
                    return Text("Can not display queue data!!!");
                  }
                }),
              ],
            );
          } else {
            return Center(
                child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {
                      _opennewpage(CrudForm(
                        configuration: Configuration(
                            message: '',
                            caption1: 'คิวรับยา',
                            caption2: 'คิวรับยา',
                            headerFontSize: 28.0,
                            bodyFontSize: 24.0,
                            col1AType: 'Que-1',
                            col1AOffset: 1,
                            col1ACount: 30,
                            col1BType: 'Que-4',
                            col1BOffset: 1,
                            col1BCount: 30,
                            col2AType: 'Que-5',
                            col2AOffset: 1,
                            col2ACount: 30,
                            col2BType: 'Urgent-Que',
                            col2BOffset: 1,
                            col2BCount: 30),
                      ));
                    }));
          }
        }),
      ),
    );
  }

  _opennewpage(s) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => s,
    ));
  }
}
