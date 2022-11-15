part of 'queue_bloc.dart';

abstract class QueueEvent extends Equatable {
  const QueueEvent();
  @override
  List<Object> get props => [];
}
class FetchQueue extends QueueEvent {}