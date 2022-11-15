import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:VachiraDash/model/configuration.dart';

abstract class ConfigState extends Equatable { 
  const ConfigState();

  @override
  List<Object> get props => [];
}

class ConfigEmpty extends ConfigState {}
class ConfigLoading extends ConfigState {}
class ConfigLoaded extends ConfigState{
  final Configuration configuration;

  const ConfigLoaded({@required this.configuration}) : assert(configuration != null);

  @override
  List<Object> get props => [configuration];
}

class ConfigError extends ConfigState {}

