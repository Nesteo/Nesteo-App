import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/blocs/snackbar_bloc/snackbar.dart';
import 'package:nesteo_app/screens/screens.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';

import 'generated/locale_base.dart';

class FullScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NesteoFullScreen screen;

    return Container(
      child: BlocBuilder<PageControlBloc, PageControlState>(
        condition: (previousState, state) =>
            state.runtimeType != previousState.runtimeType,
        builder: (context, state) {
          if (state is LoginScreenState) {
            screen = LoginScreen(context);
          } else if (state is BoxInfoScreenState) {
            screen = BoxInfoScreen(context);
          } else if (state is NewBoxScreenState) {
            screen = NewBoxScreen(context);
          } else if (state is InspectionScreenState) {
            screen = InspectionScreen(context);
          } else if (state is NewInspectionScreenState) {
            screen = NewInspectionScreen(context);
          } else {
            screen = TransitionFullScreen(context);
          }

          return Scaffold(
            appBar: (screen.hasAppBar)
                ? AppBar(
                    backgroundColor: Colors.lightGreen,
                    title: screen.appBarTitle,
                    actions: screen.appBarActions,
                    leading: screen.appBarLeading,
                  )
                : null,
            body: Builder(
              builder: (BuildContext scaffoldContext) {
                BlocProvider.of<SnackbarBloc>(context).add(
                  SetScaffoldContextEvent(scaffoldContext: scaffoldContext),
                );
                return screen;
              },
            ),
            floatingActionButton: screen.floatingActionButton,
          );
        },
      ),
    );
  }
}

class FramedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    NesteoFramedScreen screen;

    return Container(
      child: BlocBuilder<PageControlBloc, PageControlState>(
        builder: (context, state) {
          if (state is MapScreenState) {
            screen = MapScreen(context);
          } else if (state is BoxListScreenState) {
            screen = BoxListScreen(context);
          } else {
            screen = TransitionFramedScreen(context);
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightGreen,
              title: screen.appBarTitle,
              actions: screen.appBarActions,
              leading: screen.appBarLeading,
            ),
            body: Builder(
              builder: (BuildContext scaffoldContext) {
                BlocProvider.of<SnackbarBloc>(context).add(
                  SetScaffoldContextEvent(scaffoldContext: scaffoldContext),
                );
                return screen;
              },
            ),
            floatingActionButton: screen.floatingActionButton,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: (state is MapScreenState) ? 0 : 1,
              selectedIconTheme: IconThemeData(size: 22),
              unselectedIconTheme: IconThemeData(size: 20),
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.white70,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.lightGreen,
              onTap: (index) {
                if (!(pageControlBloc.state is MapScreenState) && index == 0) {
                  pageControlBloc.add(GoToMapEvent());
                } else if (!(pageControlBloc.state is BoxListScreenState) &&
                    index == 1) {
                  pageControlBloc.add(GoToBoxListEvent());
                }
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  title: Text(Localizations.of<LocaleBase>(context, LocaleBase)
                      .screenName
                      .map),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_numbered),
                  title: Text(Localizations.of<LocaleBase>(context, LocaleBase)
                      .screenName
                      .list),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
