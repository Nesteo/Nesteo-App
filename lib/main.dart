import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol.dart';
import 'package:nesteo_app/blocs/mapcontrol_bloc/mapcontrol.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/frames.dart';
import 'package:nesteo_app/generated/locale_base.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nesteo',
      localizationsDelegates: [
        const LocDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('de', ''),
      ],
      // This MultiBlocProvider provides the PageControlBloc and the OnlineModeBloc to the Widget tree
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PageControlBloc>(
            builder: (BuildContext context) => PageControlBloc(),
          ),
          BlocProvider<OnlineModeBloc>(
            builder: (BuildContext context) => OnlineModeBloc(),
          ),
          BlocProvider<FrameControlBloc>(
            builder: (BuildContext context) => FrameControlBloc(),
          ),
          BlocProvider<MapControlBloc>(
            builder: (BuildContext context) => MapControlBloc(),
          )
        ],
        child: BlocBuilder<OnlineModeBloc, OnlineModeState>(
          builder: (context, onlineState) =>
              BlocBuilder<FrameControlBloc, FrameControlState>(
            condition: (previousState, currentState) =>
                currentState.runtimeType != previousState.runtimeType,
            builder: (context, frameState) {
              if (frameState is FrameEnabledState) {
                return FramedScreen();
              }
              if (frameState is FrameDisabledState) {
                return FullScreen();
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

class LocDelegate extends LocalizationsDelegate<LocaleBase> {
  const LocDelegate();
  final idMap = const {'de': 'locales/DE_DE.json', 'en': 'locales/EN_US.json'};

  @override
  bool isSupported(Locale locale) => ['en', 'de'].contains(locale.languageCode);

  @override
  Future<LocaleBase> load(Locale locale) async {
    var lang = 'en';
    // This condition changes language based on device
    if (isSupported(locale)) lang = locale.languageCode;
    final loc = LocaleBase();
    await loc.load(idMap[lang]);
    return loc;
  }

  @override
  bool shouldReload(LocDelegate old) => false;
}
