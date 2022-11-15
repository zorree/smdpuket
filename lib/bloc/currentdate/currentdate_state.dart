part of 'currentdate_bloc.dart';

class CurrentdateState {}

class CurrentdateInitial extends CurrentdateState {}

class CurrentdateLoaded extends CurrentdateState{
  final String strDate;
  CurrentdateLoaded({@required this.strDate}) : assert(strDate != null);
}
