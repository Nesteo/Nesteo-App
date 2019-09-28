import 'package:equatable/equatable.dart';

abstract class FrameControlEvent extends Equatable {
  const FrameControlEvent();
}

class EnableFrameEvent extends FrameControlEvent {}

class DisableFrameEvent extends FrameControlEvent {}
