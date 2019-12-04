import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_event.dart';
import 'package:nesteo_app/blocs/boxsender_bloc/boxsender.dart';
import 'package:nesteo_app/blocs/dropdown_bloc/dropdown_bloc.dart';
import 'package:nesteo_app/blocs/inspectionsender_bloc/inspectionsender_bloc.dart';
import 'package:nesteo_app/blocs/mapcontrol_bloc/mapcontrol.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/blocs/snackbar_bloc/snackbar.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/blocs/inspectiondata_bloc/inspectiondata.dart';
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
      // This MultiBlocProvider provides the PageControlBloc to the Widget tree
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            builder: (BuildContext context) => AuthenticationBloc(),
          ),
          BlocProvider<BoxDataBloc>(
            builder: (BuildContext context) =>
                BoxDataBloc(BlocProvider.of<AuthenticationBloc>(context)),
          ),
          BlocProvider<PageControlBloc>(
            builder: (BuildContext context) => PageControlBloc(),
          ),
          BlocProvider<MapControlBloc>(
            builder: (BuildContext context) => MapControlBloc(
                BlocProvider.of<BoxDataBloc>(context),
                BlocProvider.of<PageControlBloc>(context),
                context),
          ),
          BlocProvider<SnackbarBloc>(
            builder: (BuildContext context) => SnackbarBloc(),
          ),
          BlocProvider<InspectionDataBloc>(
            builder: (BuildContext context) => InspectionDataBloc(
                BlocProvider.of<AuthenticationBloc>(context)),
          ),
          BlocProvider<BoxSenderBloc>(
            builder: (BuildContext context) => BoxSenderBloc(),
          ),
          BlocProvider<InspectionSenderBloc>(
            builder: (BuildContext context) => InspectionSenderBloc(),
          ),
          BlocProvider<DropdownBloc>(
            builder: (BuildContext context) => DropdownBloc(),
          ),
        ],
        child: BlocBuilder<PageControlBloc, PageControlState>(
          condition: (previousState, state) =>
              state.navigationBarEnabled != previousState.navigationBarEnabled,
          builder: (context, navigationBarState) {
            BlocProvider.of<AuthenticationBloc>(context)
                .add(CheckExistingAuthenticationEvent());
            if (navigationBarState.navigationBarEnabled) {
              return FramedScreen();
            }
            if (!navigationBarState.navigationBarEnabled) {
              return FullScreen();
            }
            return null;
          },
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
    var lang = 'de';
    // This condition changes language based on device
    if (isSupported(locale)) lang = locale.languageCode;
    final loc = LocaleBase();
    await loc.load(idMap[lang]);
    return loc;
  }

  @override
  bool shouldReload(LocDelegate old) => false;
}
