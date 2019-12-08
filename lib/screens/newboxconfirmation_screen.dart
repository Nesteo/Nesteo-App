import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nesteo_app/backend/repositories/nestingboxes_repository.dart';
import 'package:nesteo_app/blocs/boxsender_bloc/boxsender.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';

class NewBoxConfirmationScreen extends NesteoFullScreen {
  NewBoxConfirmationScreen(BuildContext context, BoxDataBloc boxDataBloc)
      : super(
          context,
          hasAppBar: true,
          appBarTitle: Text("Write this ID on your new box:"),
          appBarLeading: null,
          appBarActions: null,
          floatingActionButton: FloatingActionButton.extended(
            label: Text("Add Photo"),
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              var image = await ImagePicker.pickImage(
                  source: ImageSource.camera, imageQuality: 50);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.lightGreen,
                    title: new Text(
                      "Foto",
                      style: TextStyle(color: Colors.white),
                    ),
                    content:
                        (image != null) ? Image.file(image) : Text("Error"),
                    actions: <Widget>[
                      new FlatButton(
                          child: new Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      new FlatButton(
                        child: new Text(
                          "Okay",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (image != null) {
                            boxDataBloc.add(AddImageEvent(
                                boxDataBloc.nestingBox.id, image));
                            boxDataBloc.add(GetBoxEvent());
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.lightGreen,
      child: NewBoxConfirmationData(),
    );
  }
}

class NewBoxConfirmationData extends StatefulWidget {
  NewBoxConfirmationData({Key key}) : super(key: key);

  @override
  _NewBoxConfirmationDataState createState() => _NewBoxConfirmationDataState();
}

class _NewBoxConfirmationDataState extends State<NewBoxConfirmationData> {
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              BlocProvider.of<BoxSenderBloc>(context).lastNewBox.id,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            RaisedButton(
              onPressed: () {
                BlocProvider.of<BoxSenderBloc>(context).add(NewBoxDoneEvent());
                BlocProvider.of<PageControlBloc>(context)
                    .add(GoToBoxListEvent());
              },
              child: Text("Back to the List"),
            ),
          ],
        ),
      ),
    );
  }
}
