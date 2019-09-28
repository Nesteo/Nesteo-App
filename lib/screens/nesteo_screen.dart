import 'package:flutter/material.dart';

// Every displayed screen should either inherit from Framed or FullScreen
abstract class NesteoScreen extends Container {
  final Widget floatingActionButton;
  final bool hasAppBar;
  final Text appBarTitle;
  final List<Widget> appBarActions;

  NesteoScreen(
    BuildContext context, {
    this.floatingActionButton,
    @required this.hasAppBar,
    this.appBarTitle,
    this.appBarActions,
  }) : super();
}

abstract class NesteoFramedScreen extends NesteoScreen {
  NesteoFramedScreen(BuildContext context,
      {@required appBarTitle, appBarActions, floatingActionButton})
      : super(
          context,
          floatingActionButton: floatingActionButton,
          hasAppBar: true,
          appBarTitle: appBarTitle,
          appBarActions: appBarActions,
        );
}

abstract class NesteoFullScreen extends NesteoScreen {
  NesteoFullScreen(BuildContext context,
      {floatingActionButton, @required hasAppBar, appBarTitle, appBarActions})
      : super(
          context,
          floatingActionButton: floatingActionButton,
          hasAppBar: hasAppBar,
          appBarTitle: appBarTitle,
          appBarActions: appBarActions,
        );
}
