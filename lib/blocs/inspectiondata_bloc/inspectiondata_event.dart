import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nesteo_app/backend/services/inspections/inspections_api_service.dart';

abstract class InspectionDataEvent extends Equatable {
  const InspectionDataEvent();
}

class GetInspectionEvent extends InspectionDataEvent {
  @override
  List<Object> get props => null;
}

class GetAllInspectionEvent extends InspectionDataEvent {

  @override
  List<Object> get props => null;
}

class ChangeInspectionTypeEvent extends InspectionDataEvent {
  final InspectionsApiService nestingBoxesApi;

  ChangeInspectionTypeEvent({@required this.nestingBoxesApi}) : super();

  @override
  List<Object> get props => null;
}