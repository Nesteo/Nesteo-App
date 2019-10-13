import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nesteo_app/backend/services/nestingboxes/nestingboxes_api_service.dart';

abstract class BoxDataEvent extends Equatable {
  const BoxDataEvent();
}

class GetBoxEvent extends BoxDataEvent {
  @override
  List<Object> get props => null;
}

class GetAllBoxEvent extends BoxDataEvent {

  @override
  List<Object> get props => null;
}

class ChangeBoxTypeEvent extends BoxDataEvent {
  final NestingBoxesApiService nestingBoxesApi;

  ChangeBoxTypeEvent({@required this.nestingBoxesApi}) : super();

  @override
  List<Object> get props => null;
}
