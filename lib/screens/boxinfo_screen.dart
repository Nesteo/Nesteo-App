import 'package:flutter/material.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class BoxInfoScreen extends NesteoFullScreen {
  BoxInfoScreen(BuildContext context)
      : super(context,
            hasAppBar: true,
            appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase)
                .screenName
                .boxInfo),
            appBarActions: null,
            appBarLeading: GoBackButton());

  @override
  Widget build(BuildContext context) {
    BoxDataBloc boxDataBloc = BlocProvider.of<BoxDataBloc>(context);

    Widget imageSection = Container(
      child: Image.asset('images/testImage.jpg',
          width: 600, height: 240, fit: BoxFit.fitWidth),
    );

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: BlocBuilder<BoxDataBloc, BoxDataState>(
        builder: (context, state) {
          if (state is InitialBoxDataState) {
            boxDataBloc.add(GetBoxEvent());
            return CircularProgressIndicator();
          }
          if (state is BoxReadyState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  boxDataBloc.nestingBox.id,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  boxDataBloc.nestingBox.region.name,
                )
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );

    final Widget descSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'hlorem ipsum',
        softWrap: true,
      ),
    );

    final Widget listSection = Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Inspection 1'),
            isThreeLine: true,
            subtitle: Text('inspection date'),
            onTap: () {
              BlocProvider.of<PageControlBloc>(context)
                  .add(GoToInspectionEvent());
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Inspection 2'),
            isThreeLine: true,
            subtitle: Text('inspection date'),
            onTap: () {
              BlocProvider.of<PageControlBloc>(context)
                  .add(GoToInspectionEvent());
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Inspection 3'),
            isThreeLine: true,
            subtitle: Text('inspection date'),
            onTap: () {
              BlocProvider.of<PageControlBloc>(context)
                  .add(GoToInspectionEvent());
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Inspection 5'),
            isThreeLine: true,
            subtitle: Text('inspection date'),
            onTap: () {
              BlocProvider.of<PageControlBloc>(context)
                  .add(GoToInspectionEvent());
            },
          ),
        ],
      ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Icon(icon, color: color),
            onTap: () {
              BlocProvider.of<PageControlBloc>(context)
                  .add(GoToNewInspectionEvent());
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(Colors.blue, Icons.add, 'New Inspection'),
          _buildButtonColumn(Colors.blue, Icons.add_a_photo, 'Add Photo'),
          _buildButtonColumn(Colors.blue, Icons.settings, 'Change Data')
        ],
      ),
    );

    return Container(
      // child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          imageSection,
          titleSection,
          buttonSection,
          //descSection,
          Expanded(
              child:
                  listSection) // SingleChildScrollView & listSection dont work together yet
        ],
      ),
    );
  }
}
