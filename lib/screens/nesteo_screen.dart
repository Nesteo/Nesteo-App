import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol_bloc.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol_event.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

// Every displayed screen should either inherit from Framed or FullScreen
abstract class NesteoScreen extends Container {
  final Widget floatingActionButton;
  final bool hasAppBar;
  final Text appBarTitle;
  final List<Widget> appBarActions;
  final Widget appBarLeading;

  NesteoScreen(
    BuildContext context, {
    this.floatingActionButton,
    @required this.hasAppBar,
    this.appBarTitle,
    this.appBarLeading,
    this.appBarActions,
  }) : super();
}

abstract class NesteoFramedScreen extends NesteoScreen {
  NesteoFramedScreen(BuildContext context,
      {@required appBarTitle,
      appBarActions,
      appBarLeading,
      floatingActionButton})
      : super(
          context,
          floatingActionButton: floatingActionButton,
          hasAppBar: true,
          appBarTitle: appBarTitle,
          appBarActions: appBarActions,
          appBarLeading: appBarLeading,
        );
}

abstract class NesteoFullScreen extends NesteoScreen {
  NesteoFullScreen(BuildContext context,
      {floatingActionButton,
      @required hasAppBar,
      appBarTitle,
      appBarLeading,
      appBarActions})
      : super(
          context,
          floatingActionButton: floatingActionButton,
          hasAppBar: hasAppBar,
          appBarTitle: appBarTitle,
          appBarActions: appBarActions,
          appBarLeading: appBarLeading,
        );
}

class OnlineModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          (BlocProvider.of<OnlineModeBloc>(context).currentState is OnlineState)
              ? Icon(Icons.signal_wifi_off)
              : Icon(Icons.signal_wifi_4_bar),
      onPressed: () {
        OnlineModeBloc mode = BlocProvider.of<OnlineModeBloc>(context);
        if (mode.currentState is OnlineState) {
          mode.dispatch(OfflineEvent());
        }
        if (mode.currentState is OfflineState) {
          mode.dispatch(OnlineEvent());
        }
      },
    );
  }
}

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        BlocProvider.of<PageControlBloc>(context).dispatch(GoToBoxListEvent());
        BlocProvider.of<FrameControlBloc>(context).dispatch(EnableFrameEvent());
      },
    );
  }
}
