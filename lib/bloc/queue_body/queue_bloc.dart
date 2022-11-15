import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:VachiraDash/model/configuration.dart';
import '../../api/api_repository.dart';
import '../../model/que_display.dart';

part 'queue_event.dart';
part 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> {
  final ApiRepository _apiRepository = ApiRepository();
  @override
  QueueState get initialState => QueueInitial();

  @override
  Stream<QueueState> mapEventToState(
    QueueEvent event,
  ) async* {
    //yield QueueLoading();
    if (event is FetchQueue){
      List<QueDisplay> queCol1As = [];
      List<QueDisplay> queCol1Bs = [];
      List<QueDisplay> queCol2As = [];
      List<QueDisplay> queCol2Bs = [];
      Configuration configuration = await getConfig();
      if (configuration.col1AType!='NotUsed'){
        if (getQueQuery(configuration.col1AType)!=null){
          queCol1As = await _apiRepository.fetchQueue(getQueQuery(configuration.col1AType), configuration.col1AOffset,configuration.col1ACount);
        }
      }
      if (configuration.col1BType!='NotUsed'){
        if (getQueQuery(configuration.col1BType)!=null){
          queCol1Bs = await _apiRepository.fetchQueue(getQueQuery(configuration.col1BType), configuration.col1BOffset,configuration.col1BCount);
        }
      }
      if (configuration.col2AType!='NotUsed'){
        if (getQueQuery(configuration.col2AType)!=null){
          queCol2As = await _apiRepository.fetchQueue(getQueQuery(configuration.col2AType), configuration.col2AOffset,configuration.col2ACount);
        }
      }
      if (configuration.col2BType!='NotUsed'){
        if (getQueQuery(configuration.col2BType)!=null){
          queCol2Bs = await _apiRepository.fetchQueue(getQueQuery(configuration.col2BType), configuration.col2BOffset,configuration.col2BCount);
        }
      }

      yield QueueLoaded(queCol1As:queCol1As,queCol1Bs:queCol1Bs,queCol2As:queCol2As,queCol2Bs:queCol2Bs);
    }
    
  }
  String getQueQuery(String type)  {
    String queQuery ;
      switch (type) {
        case 'Que-1' :
          queQuery = '1%';
          break;
        case 'Que-2' :
          queQuery = '2%';
          break;
        case 'Que-3' :
          queQuery = '3%';
          break;
        case 'Que-4' :
          queQuery = '4%';
          break;
        case 'Que-5' :
          queQuery = '5%';
          break;
        case 'Que-6' :
          queQuery = '6%';
          break;
        case 'Que-7' :
          queQuery = '7%';
          break;
        case 'Que-8' :
          queQuery = '8%';
          break;
        case 'Que-9' :
          queQuery = '9%';
          break;
        case 'Urgent-Que' :
          queQuery = '';
          break;
        default:
        queQuery = null;
      }
      return queQuery;
  }
  Future<Configuration> getConfig() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      double headerFontSize = prefs.getDouble('fontSize') ?? 28.0;
      double bodyFontSize = prefs.getDouble('fontSize') ?? 24.0;
      String col1AType = prefs.getString('col1AType') ?? 'Que-1';
      int col1AOffset = prefs.getInt('col1AOffset') ?? 1;
      int col1ACount = prefs.getInt('col1ACount') ?? 30;
      String col1BType = prefs.getString('col1BType') ?? 'Que-4';
      int col1BOffset = prefs.getInt('col1BOffset') ?? 1;
      int col1BCount = prefs.getInt('col1BCount') ?? 30;
      String col2AType = prefs.getString('col2AType') ?? 'Que-5';
      int col2AOffset = prefs.getInt('col2AOffset') ?? 1;
      int col2ACount = prefs.getInt('col2ACount') ?? 30;
      String col2BType = prefs.getString('col2BType') ?? 'Urgent-Que';
      int col2BOffset = prefs.getInt('col2BOffset') ?? 1;
      int col2BCount = prefs.getInt('col2BCount') ?? 30;
      Configuration configuration = Configuration(
      headerFontSize:headerFontSize,bodyFontSize:bodyFontSize,col1AType:col1AType,col1AOffset:col1AOffset,col1ACount:col1ACount,
    col1BType:col1BType,col1BOffset:col1BOffset,col1BCount:col1BCount,
    col2AType:col2AType,col2AOffset:col2AOffset,col2ACount:col2ACount,
    col2BType:col2BType,col2BOffset:col2BOffset,col2BCount:col2BCount
    );
      return configuration;
  }
}
