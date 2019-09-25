import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PagecontrolEvent extends Equatable {
  PagecontrolEvent([List props = const <dynamic>[]]) : super(props);
}
