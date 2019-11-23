import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/model/owner.dart';
import 'package:nesteo_app/model/region.dart';
import 'package:nesteo_app/model/species.dart';

abstract class InspectionSenderEvent extends Equatable {
  const InspectionSenderEvent();
}

class NewInspectionDoneEvent extends InspectionSenderEvent {
  @override
  List<Object> get props => null;
}

class SendInspectionEvent extends InspectionSenderEvent {
  final AuthenticationBloc authBloc;
  final NestingBox nestingBox;
  final String id;
  final DateTime inspectionDate;
  final String comment;
  final bool cleaned;
  final bool repaired;
  final String condition;
  final bool containsEggs;
  final int eggCount;
  final bool occupied;
  final int chickCount;
  final int ringedChickCount;
  final int ageInDays;
  final String femaleParent;
  final String maleParent;
  final Species species;
  final String speciesString;

  SendInspectionEvent(
      {this.id,
      this.nestingBox,
      this.authBloc,
      this.inspectionDate,
      this.comment,
      this.cleaned,
      this.repaired,
      this.condition,
      this.containsEggs,
      this.eggCount,
      this.occupied,
      this.chickCount,
      this.ringedChickCount,
      this.ageInDays,
      this.femaleParent,
      this.maleParent,
      this.species,
      this.speciesString})
      : super();

  @override
  List<Object> get props => null;
}
