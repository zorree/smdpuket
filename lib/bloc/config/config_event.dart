import 'package:equatable/equatable.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();
}

class ReadConfig extends ConfigEvent {
  @override
    List<Object> get props => null;
}