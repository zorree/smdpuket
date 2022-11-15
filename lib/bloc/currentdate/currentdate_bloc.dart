import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'currentdate_event.dart';
part 'currentdate_state.dart';

class CurrentdateBloc extends Bloc<CurrentdateEvent, CurrentdateState> {
  @override
  CurrentdateState get initialState => CurrentdateInitial();

  @override
  Stream<CurrentdateState> mapEventToState(
    CurrentdateEvent event,
  ) async* {
    yield CurrentdateInitial();
    if (event is LoadDate){
      final DateTime now = DateTime.now();
      int enYear = int.parse(DateFormat('yyyy','th').format(now));
      int thYear = (enYear>2400)?enYear:enYear+543;
      String strDate = DateFormat('dd/MM/','th').format(now)+thYear.toString()+DateFormat(' HH:mm:ss','th').format(now);
      yield CurrentdateLoaded(strDate: strDate);
    }
  }
}
