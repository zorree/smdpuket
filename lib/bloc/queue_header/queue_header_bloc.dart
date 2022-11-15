import 'dart:async';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:VachiraDash/api/api_repository.dart';

part 'queue_header_event.dart';
part 'queue_header_state.dart';

class QueueHeaderBloc extends Bloc<QueueHeaderEvent, QueueHeaderState> {
  final ApiRepository _apiRepository = ApiRepository();
  @override
  QueueHeaderState get initialState => QueueHeaderInitial();

  @override
  Stream<QueueHeaderState> mapEventToState(
    QueueHeaderEvent event,
  ) async* {
    yield QueueHeaderInitial();
    if (event is LoadQueueHeader){
      final DateTime now = DateTime.now();
      int enYear = int.parse(DateFormat('yyyy','th').format(now));
      int thYear = (enYear>2400)?enYear:enYear+543;
      String strDate = DateFormat('dd/MM/','th').format(now)+thYear.toString()+DateFormat(' HH:mm','th').format(now)+ ' น.';
      
      int waiting = await _apiRepository.fetchWaitingCount();
      //print("waiting="+waiting.toString());
      if (waiting == -1) {
        yield QueueHeaderFailure('Get waiting Fail.');
        return;
      }
      
      yield QueueHeaderLoaded(headerStr:strDate+" Waiting "+waiting.toString()+ " Queue/จำนวนคิวที่รอ "+waiting.toString()+" คิว");
    }
  }
}