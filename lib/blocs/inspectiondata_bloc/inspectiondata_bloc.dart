import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/backend/repositories/inspections_repository.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata_bloc.dart';
import 'package:nesteo_app/model/inspection.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import './inspectiondata.dart';

class InspectionDataBloc
    extends Bloc<InspectionDataEvent, InspectionDataState> {
  @override
  InspectionDataState get initialState => InitialInspectionDataState();
  int _sortOptionCounter = 0;
  int _ascDescCounter = 0;
  InspectionsRepository _inspectionRepo;
  List<Inspection> inspectionList = new List<Inspection>();

  String boxId = "";
  Inspection inspection = new Inspection();
  int inspectionId = 0;
  List<String> sortOptionNames = [
    "sortbyidasc",
    "sortbydatenasc"
  ]; //todo put output text for snackbar in screen
  String currentSortOption = "";

  InspectionDataBloc(AuthenticationBloc authBloc) : super() {
    _inspectionRepo = InspectionsRepository(authBloc);
  }

  @override
  Stream<InspectionDataState> mapEventToState(
      InspectionDataEvent event) async* {
    var sortOptions = [
      [sortByIdAsc, sortByIdDesc],
      [sortByDateAsc, sortByDateDesc]
    ];

    if (event is GetInspectionEvent) {
      if (this.state is! InitialInspectionDataState) {
        yield InspectionChangingState();
      }
      print(inspectionId);
      inspection = await _inspectionRepo.getInspectionById(inspectionId);
      yield InspectionReadyState();
    }
    if (event is GetAllInspectionEvent) {
      if (this.state is! InitialInspectionDataState) {
        yield InspectionChangingState();
      }
      inspectionList = await _inspectionRepo.getAllInspections();
      print(inspectionList.length);
      yield InspectionReadyState();
    }
    if (event is GetAllInspectionPreviewEvent) {
      if (this.state is! InitialInspectionDataState) {
        yield InspectionChangingState();
      }
      inspectionList = await _inspectionRepo.getAllInspectionPreviews();
      print(inspectionList.length);
      yield InspectionReadyState();
    }

    if (event is GetInspectionPreviewsByNestingBoxEvent) {
      if (this.state is! InitialInspectionDataState) {
        yield InspectionChangingState();
      }

      inspectionList =
          await _inspectionRepo.getInspectionPreviewsByNestingBoxId(boxId);
      print(inspectionList.length);
      yield InspectionReadyState();
    }

    if (event is SortInspectionEvent) {
      if (this.state is! InitialInspectionDataState) {
        yield InspectionChangingState();
      }

      inspectionList.sort((a, b) =>
          sortOptions[_sortOptionCounter % sortOptions[0].length]
              [_ascDescCounter % sortOptions[1].length](a, b));
      currentSortOption =
          sortOptionNames[_sortOptionCounter % sortOptionNames.length];
      yield InspectionReadyState();
    }

    if (event is ChangeSortDirectionEvent) {
      _ascDescCounter++;
      add(SortInspectionEvent());
    }
    if (event is ChangeSortTypeEvent) {
      _sortOptionCounter++;
      add(SortInspectionEvent());
    }
  }

  int sortByIdAsc(a, b) {
    return a.id.compareTo(b.id);
  }

  int sortByIdDesc(a, b) {
    return b.id.compareTo(a.id);
  }

  int sortByDateAsc(a, b) {
    return a.inspectionDate.compareTo(b.inspectionDate);
  }

  int sortByDateDesc(a, b) {
    return b.inspectionDate.compareTo(a.inspectionDate);
  }
}
