part of 'queue_header_bloc.dart';

abstract class QueueHeaderState extends Equatable {
  const QueueHeaderState();
}

class QueueHeaderInitial extends QueueHeaderState {
  @override
  List<Object> get props => [];
}

class QueueHeaderLoaded extends QueueHeaderState{
  final String headerStr;
  QueueHeaderLoaded({this.headerStr}) ;

  @override
  List<Object> get props => [headerStr];
}

class QueueHeaderFailure extends QueueHeaderState {
  final String errorMessage;
  QueueHeaderFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
