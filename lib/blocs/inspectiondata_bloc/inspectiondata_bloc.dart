import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nesteo_app/backend/repositories/inspections_repository.dart';
import 'package:nesteo_app/model/inspection.dart';
import './inspectiondata.dart';

class InspectionDataBloc extends Bloc<InspectionDataEvent, InspectionDataState> {
  @override
  InspectionDataState get initialState => InitialInspectionDataState();

  InspectionsRepository _inspectionRepo = InspectionsRepository();
  List<Inspection> inspectionList = new List<Inspection>();
            
  Inspection inspection = new Inspection();
  int inspectionId = 0;

  @override
  Stream<InspectionDataState> mapEventToState(InspectionDataEvent event) async* {
    if (event is GetInspectionEvent) {
      if (this.currentState is! InitialInspectionDataState) {
        yield InspectionChangingState();
      }
      // print(InspectionId);
      inspection = await _inspectionRepo.getInspectionById(inspectionId);
      yield InspectionReadyState();
    }
    if (event is GetAllInspectionEvent) {
      if (this.currentState is! InitialInspectionDataState) {
        yield InspectionChangingState();
      }
      inspectionList = await _inspectionRepo.getAllInspections();
      // print(nestingBoxes.length);
      yield InspectionReadyState();
    }
  }
}
