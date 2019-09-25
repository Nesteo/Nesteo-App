import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransitionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
