import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';

class NewBoxScreen extends NesteoFullScreen {
  NewBoxScreen(BuildContext context)
      : super(
          context,
          hasAppBar: true,
          appBarTitle: Text('Add a new Box'),
          appBarLeading: GoBackButton(),
          appBarActions: null,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('New Box Dialogue'),
      ),
    );
  }
}
