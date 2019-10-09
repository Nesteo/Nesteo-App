import 'package:equatable/equatable.dart';

abstract class FrameControlState extends Equatable {
  const FrameControlState();
}

class FrameEnabledState extends FrameControlState {
  @override
  List<Object> get props => [];
}

class FrameDisabledState extends FrameControlState {
  @override
  List<Object> get props => [];
}
