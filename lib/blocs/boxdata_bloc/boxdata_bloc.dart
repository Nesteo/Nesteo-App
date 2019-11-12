import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/backend/repositories/nestingboxes_repository.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

import 'package:nesteo_app/model/nestingbox.dart';
import './boxdata.dart';

class BoxDataBloc extends Bloc<BoxDataEvent, BoxDataState> {
  @override
  BoxDataState get initialState => InitialBoxDataState();
  int _sortOptionCounter = 0;
  int _ascDescCounter = 0;
  NestingBoxesRepository _nestingBoxRepo;

  List<NestingBox> nestingBoxList = new List<NestingBox>();
  NestingBox nestingBox = new NestingBox();
  String boxId = "";
  List<String> sortOptionNames = [
    "sortbyidasc",
    "sortbylastinspectionasc"
  ]; //todo put output text for snackbar in screen
  String currentSortOption = "";

  BoxDataBloc(AuthenticationBloc authBloc) : super() {
    _nestingBoxRepo = NestingBoxesRepository(authBloc);
  }

  @override
  Stream<BoxDataState> mapEventToState(BoxDataEvent event) async* {
    //List of Functions to use for sorting the List, accessed via a counter
    //that increments with every sort-button press and then modulo the length of the functions list,
    // to iterate through it again and again
    var sortOptions = [
      [sortByIdAsc, sortByIdDesc],
      [sortByLastInspectedAsc, sortByLastInspectedDesc]
    ];
    // NestingBoxesApiService nestingBoxApi = NestingBoxesApiService.create();
    // print(event.toString());
    if (event is GetBoxEvent) {
      if (this.state is! InitialBoxDataState) {
        yield BoxChangingState();
      }
      // print(boxId);
      nestingBox = await _nestingBoxRepo.getNestingBoxById(boxId);
      yield BoxReadyState();
    }
    if (event is GetAllBoxPreviewEvent) {
      if (this.state is! InitialBoxDataState) {
        yield BoxChangingState();
      }
      nestingBoxList = await _nestingBoxRepo.getAllNestingBoxPreviews();

      // print(nestingBoxes.length);
      yield BoxReadyState();
    }
    if (event is SortBoxEvent) {
      if (this.state is! InitialBoxDataState) {
        yield BoxChangingState();
      }

      nestingBoxList.sort((a, b) =>
          sortOptions[_sortOptionCounter % sortOptions[0].length]
              [_ascDescCounter % sortOptions[1].length](a, b));
      currentSortOption =
          sortOptionNames[_sortOptionCounter % sortOptionNames.length];
      yield BoxReadyState();
    }

    if (event is ChangeSortDirectionEvent) {
      _ascDescCounter++;
      add(SortBoxEvent());
    }
    if (event is ChangeSortTypeEvent) {
      _sortOptionCounter++;
      add(SortBoxEvent());
    }
  }

  int sortByLastInspectedAsc(a, b) {
    if (b.lastInspected == null || a.lastInspected == null) {
      print("last inspected is null");
      return 0;
    }
    return a.lastInspected.compareTo(b.lastInspected);
  }

  int sortByIdAsc(a, b) {
    if (a.id == null || b.id == null) {
      print("id is null");
      return 0;
    }
    return a.id.compareTo(b.id);
  }

  int sortByLastInspectedDesc(a, b) {
    if (b.lastInspected == null || a.lastInspected == null) {
      return 0;
    }
    return b.lastInspected.compareTo(a.lastInspected);
  }

  int sortByIdDesc(a, b) {
    if (a.id == null || b.id == null) {
      return 0;
    }
    return b.id.compareTo(a.id);
  }
}
