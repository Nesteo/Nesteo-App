import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OnlineModeEvent extends Equatable {
  OnlineModeEvent([List props = const <dynamic>[]]);
}

class OfflineEvent extends OnlineModeEvent {
  @override
  List<Object> get props => [];
}

class OnlineEvent extends OnlineModeEvent {
  @override
  List<Object> get props => [];
}
