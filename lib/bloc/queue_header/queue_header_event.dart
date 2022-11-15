part of 'queue_header_bloc.dart';

abstract class QueueHeaderEvent extends Equatable {
  const QueueHeaderEvent();
  @override
  List<Object> get props => [];
}

class LoadQueueHeader extends QueueHeaderEvent {}
