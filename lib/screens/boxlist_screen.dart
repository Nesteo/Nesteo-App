import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class BoxListScreen extends NesteoFramedScreen {
  BoxListScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase).screenName.nestingBox),
          appBarLeading: null,
          appBarActions: <Widget>[
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // set up the sorting options
                    Widget sortOptionName = SimpleDialogOption(
                      child: const Text('Name'),
                      onPressed: () {},
                    );
                    Widget sortOptionDistance = SimpleDialogOption(
                      child: const Text('Distance'),
                      onPressed: () {},
                    );
                    Widget sortOptionId = SimpleDialogOption(
                      child: const Text('ID'),
                      onPressed: () {},
                    );

                    //sorting dialog widget
                    SimpleDialog sortDialog = SimpleDialog(
                      title: const Text("Sort List"),
                      children: <Widget>[
                        sortOptionDistance,
                        sortOptionName,
                        sortOptionId
                      ],
                    );
                    return sortDialog;
                  },
                );
              },
            ),
            OnlineModeButton(),
          ],
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Title Box $index'), //create testdata for listview
            isThreeLine: true,
            subtitle: Text('subtitle last inspection $index'),
            onTap: () {
              BlocProvider.of<PageControlBloc>(context)
                  .dispatch(GoToBoxInfoEvent());
              BlocProvider.of<FrameControlBloc>(context)
                  .dispatch(DisableFrameEvent());
            },
          );
        },
      ),
    );
  }
}
