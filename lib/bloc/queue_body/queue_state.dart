part of 'queue_bloc.dart';

abstract class QueueState extends Equatable {
  const QueueState();
  @override
  List<Object> get props => [];
}

class QueueInitial extends QueueState {}

class QueueEmpty extends QueueState {}

class QueueLoading extends QueueState {}

class QueueLoaded extends QueueState {
  final List<QueDisplay> queCol1As;
  final List<QueDisplay> queCol1Bs;
  final List<QueDisplay> queCol2As;
  final List<QueDisplay> queCol2Bs;

  const QueueLoaded({this.queCol1As,this.queCol1Bs,this.queCol2As,this.queCol2Bs});
  @override
  List<Object> get props => [queCol1As,queCol1Bs,queCol2As,queCol2Bs];
}

class QueueFailure extends QueueState {
  final String errorMessage;
  QueueFailure(this.errorMessage);
}
