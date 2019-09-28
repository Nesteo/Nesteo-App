import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/screens/placeholder_screen.dart';
import 'package:nesteo_app/screens/screens.dart';

class FullScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);
    NesteoFullScreen screen;

    return Container(
      child: BlocBuilder<PageControlBloc, PageControlState>(
        builder: (context, state) {
          if (state is LoginScreenState) {
            screen = LoginScreen(context);
          }

          return Scaffold(
            appBar: (screen.hasAppBar)
                ? AppBar(
                    backgroundColor:
                        (onlineModeBloc.currentState is OnlineState)
                            ? Colors.green
                            : Colors.red,
                    title: screen.appBarTitle,
                    actions: screen.appBarActions,
                  )
                : null,
            body: screen,
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
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);
    NesteoFramedScreen screen;

    return Container(
      child: BlocBuilder<PageControlBloc, PageControlState>(
        builder: (context, state) {
          if (state is MapScreenState) {
            screen = PlaceholderMapScreen(context);
          }
          if (state is BoxListScreenState) {
            screen = PlaceholderListScreen(context);
          }
          if (state is ToMapScreenState) {
            screen = TransitionScreen(context);
          }
          if (state is ToBoxListScreenState) {
            screen = TransitionScreen(context);
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: (onlineModeBloc.currentState is OnlineState)
                  ? Colors.green
                  : Colors.red,
              title: screen.appBarTitle,
              actions: screen.appBarActions,
            ),
            body: screen,
            floatingActionButton: screen.floatingActionButton,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:
                  (state is MapScreenState || state is ToMapScreenState)
                      ? 0
                      : 1,
              selectedIconTheme: IconThemeData(size: 25),
              unselectedIconTheme: IconThemeData(size: 20),
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.white70,
              selectedItemColor: Colors.white,
              backgroundColor: (onlineModeBloc.currentState is OnlineState)
                  ? Colors.green
                  : Colors.red,
              onTap: (index) {
                if (index == 0) {
                  pageControlBloc.dispatch(GoToMapEvent());
                } else if (index == 1) {
                  pageControlBloc.dispatch(GoToBoxListEvent());
                }
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  title: Text('Map'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_numbered),
                  title: Text('List'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
