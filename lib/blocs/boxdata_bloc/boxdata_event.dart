import 'dart:io';

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

class GetAllBoxPreviewEvent extends BoxDataEvent {
  @override
  List<Object> get props => null;
}

class AddImageEvent extends BoxDataEvent {
  final File image;
  final String id;

  AddImageEvent(this.id, this.image) : super();

  @override
  List<Object> get props => null;
}

class ChangeBoxTypeEvent extends BoxDataEvent {
  final NestingBoxesApiService nestingBoxesApi;

  ChangeBoxTypeEvent({@required this.nestingBoxesApi}) : super();

  @override
  List<Object> get props => null;
}

class SortBoxEvent extends BoxDataEvent {
  @override
  List<Object> get props => [];
}

class ChangeSortDirectionEvent extends BoxDataEvent {
  @override
  List<Object> get props => [];
}

class ChangeSortTypeEvent extends BoxDataEvent {
  @override
  List<Object> get props => [];
}
