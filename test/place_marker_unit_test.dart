import 'package:test/test.dart';

import 'package:flutter/material.dart';

import 'package:playground/place_marker.dart';

void main() {
  test('Scaffold should be returned', () {
    var state = PlaceMarkerState();
    var widget = state.build(null);
    expect(widget is Scaffold, true);
  });
}