import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';

abstract class BoxSenderEvent extends Equatable {
  const BoxSenderEvent();
}

class SendBoxEvent extends BoxSenderEvent {
  final AuthenticationBloc authBloc;
  final LatLng coordinates;
  final DateTime hangUpDate;
  final String regionString;
  final String regionIdPrefixString;
  final String ownerString;
  final String material;
  final String holeSize;
  final String comment;
  final String oldId;
  final String foreignId;

  SendBoxEvent({
    this.authBloc,
    this.coordinates,
    this.hangUpDate,
    this.regionString,
    this.regionIdPrefixString,
    this.ownerString,
    this.material,
    this.holeSize,
    this.comment,
    this.oldId,
    this.foreignId,
  }) : super();

  @override
  List<Object> get props => null;
}
