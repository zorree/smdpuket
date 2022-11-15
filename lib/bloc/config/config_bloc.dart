import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:VachiraDash/model/configuration.dart';
import 'config_event.dart';
import 'config_state.dart';
export 'config_event.dart';
export 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  @override
  ConfigState get initialState => ConfigEmpty();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    yield ConfigLoading();
    if (event is ReadConfig){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String message = prefs.getString('message') ?? '';
      String caption1 = prefs.getString('caption1') ?? 'คิวรับยา';
      String caption2 = prefs.getString('caption2') ?? 'คิวรับยา';
      double headerFontSize = prefs.getDouble('headerFontSize') ?? 28.0;
      double bodyFontSize = prefs.getDouble('bodyFontSize') ?? 24.0;
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
      Configuration configuration = 
      Configuration(
        message:message,caption1: caption1,caption2: caption2,
        headerFontSize:headerFontSize,bodyFontSize:bodyFontSize,
        col1AType:col1AType,col1AOffset:col1AOffset,col1ACount:col1ACount,
        col1BType:col1BType,col1BOffset:col1BOffset,col1BCount:col1BCount,
        col2AType:col2AType,col2AOffset:col2AOffset,col2ACount:col2ACount,
        col2BType:col2BType,col2BOffset:col2BOffset,col2BCount:col2BCount
    );
        yield ConfigLoaded(configuration:configuration);
    }    
  }
}
