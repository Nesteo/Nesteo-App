import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';

class InspectionScreen extends NesteoFramedScreen {
  InspectionScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text('Inspection Info'),
          appBarLeading: GoBackButton(),
          appBarActions: null,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Add Layout here'),
      ),
    );
  }
}
