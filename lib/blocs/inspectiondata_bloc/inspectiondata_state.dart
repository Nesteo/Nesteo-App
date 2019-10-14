import 'package:equatable/equatable.dart';

abstract class InspectionDataState extends Equatable {
  const InspectionDataState();
}

class InitialInspectionDataState extends InspectionDataState {
  @override
  List<Object> get props => [];
}

class InspectionReadyState extends InspectionDataState {
  @override
  List<Object> get props => null;
}

class InspectionChangingState extends InspectionDataState {
  @override
  List<Object> get props => null;
}
