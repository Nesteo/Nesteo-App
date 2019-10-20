import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class BoxListScreen extends NesteoFramedScreen {
  BoxListScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase)
              .screenName
              .nestingBox),
          appBarLeading: null,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<PageControlBloc>(context).add(GoToNewBoxEvent());
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.lightGreen,
          ),
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
          ],
        );

  @override
  Widget build(BuildContext context) {
    BoxDataBloc boxDataBloc = BlocProvider.of<BoxDataBloc>(context);
    boxDataBloc.add(GetAllBoxPreviewEvent());
    return BlocBuilder<BoxDataBloc, BoxDataState>(
      builder: (context, state) {
        if (state is InitialBoxDataState) {
          boxDataBloc.add(GetAllBoxPreviewEvent());
          return CircularProgressIndicator();
        }
        if (state is BoxReadyState) {
          // print(boxDataBloc.nestingBoxList);
          // print(boxDataBloc.nestingBoxList.length);

          return Container(
            child: ListView.builder(
              itemCount: boxDataBloc.nestingBoxList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(boxDataBloc
                      .nestingBoxList[index].id), //create testdata for listview
                  isThreeLine: true,
                  subtitle: Text(boxDataBloc.nestingBoxList[index].region.name),
                  onTap: () {
                    // Set the box Id to this selection and add get box for the info page
                    boxDataBloc.boxId = boxDataBloc.nestingBoxList[index].id;
                    BlocProvider.of<BoxDataBloc>(context).add(GetBoxEvent());
                    BlocProvider.of<PageControlBloc>(context)
                        .add(GoToBoxInfoEvent());
                  },
                );
              },
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
