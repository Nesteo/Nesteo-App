import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nesteo_app/backend/repositories/nestingboxes_repository.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

import 'package:nesteo_app/model/nestingbox.dart';
import './boxdata.dart';

class BoxDataBloc extends Bloc<BoxDataEvent, BoxDataState> {
  @override
  BoxDataState get initialState => InitialBoxDataState();
  int _sortOptionCounter = 0;
  NestingBoxesRepository _nestingBoxRepo = NestingBoxesRepository();
  List<NestingBox> nestingBoxList = new List<NestingBox>();
  NestingBox nestingBox = new NestingBox();
  String boxId = "";
  List<String> sortOptionNames = [
    "sortbyid",
    "sortbylastinspection"
  ]; //todo put output text for snackbar in screen
  String currentSortOption = "";

  @override
  Stream<BoxDataState> mapEventToState(BoxDataEvent event) async* {
    //List of Functions to use for sorting the List, accessed via a counter
    //that increments with every sort-button press and then modulo the length of the functions list,
    // to iterate through it again and again
    List<Function> sortOptions = [sortById, sortByLastInspected];

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
      nestingBoxList.sort(
          (a, b) => sortOptions[_sortOptionCounter % sortOptions.length](a, b));
      // print(nestingBoxes.length);
      yield BoxReadyState();
    }
    if (event is SortBoxEvent) {
      if (this.state is! InitialBoxDataState) {
        yield BoxChangingState();
      }
      _sortOptionCounter++;
      nestingBoxList.sort(
          (a, b) => sortOptions[_sortOptionCounter % sortOptions.length](a, b));
      currentSortOption =
          sortOptionNames[_sortOptionCounter % sortOptionNames.length];
      yield BoxReadyState();
    }
  }

  int sortByLastInspected(a, b) {
    return a.lastInspected.compareTo(b.lastInspected);
  }

  int sortById(a, b) {
    return a.id.compareTo(b.id);
  }
}
