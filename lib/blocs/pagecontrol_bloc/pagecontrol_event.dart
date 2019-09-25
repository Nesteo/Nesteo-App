import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageControlEvent extends Equatable {
  PageControlEvent([List props = const <dynamic>[]]) : super(props);
}
