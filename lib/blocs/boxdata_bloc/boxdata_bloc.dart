import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nesteo_app/backend/repositories/nestingboxes_repository.dart';
import 'package:nesteo_app/backend/services/nestingboxes/nestingboxes_api_service.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import './boxdata.dart';

class BoxDataBloc extends Bloc<BoxDataEvent, BoxDataState> {

  @override
  BoxDataState get initialState => InitialBoxDataState();

  NestingBoxesRepository _nestingBoxRepo = NestingBoxesRepository();
  List<NestingBox> nestingBoxes = new List<NestingBox>();
  NestingBox nestingBox = new NestingBox();
  String boxId = "F000001";


  @override
  Stream<BoxDataState> mapEventToState(
    BoxDataEvent event
  ) async* {
     // NestingBoxesApiService nestingBoxApi = NestingBoxesApiService.create();
    print(event.toString());
    if (event is GetBoxEvent) {
      if (this.currentState is! InitialBoxDataState) {
        yield BoxChangingState();
      }
      List<NestingBox> nestingBoxes =
            await _nestingBoxRepo.getAllNestingBoxes();
      print(nestingBoxes.length);
      nestingBox = await _nestingBoxRepo.getNestingBoxById(boxId);
      print(nestingBox.toString());
      yield BoxReadyState();
    }
  }
}