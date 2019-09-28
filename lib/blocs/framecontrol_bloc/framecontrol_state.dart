import 'package:equatable/equatable.dart';

abstract class FrameControlState extends Equatable {
  const FrameControlState();
}

class FrameEnabledState extends FrameControlState {}

class FrameDisabledState extends FrameControlState {}
