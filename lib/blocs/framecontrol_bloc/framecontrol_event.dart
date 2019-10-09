import 'package:equatable/equatable.dart';

abstract class FrameControlEvent extends Equatable {
  const FrameControlEvent();
}

class EnableFrameEvent extends FrameControlEvent {
  @override
  List<Object> get props => [];
}

class DisableFrameEvent extends FrameControlEvent {
  @override
  List<Object> get props => [];
}
