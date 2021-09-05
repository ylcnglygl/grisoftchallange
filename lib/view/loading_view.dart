import 'package:flutter/material.dart';
import 'package:grisoftwarechallange/constants/constants.dart';

Center loadingView() {
  return Center(
      child: CircularProgressIndicator(
    color: Constants.buttonColor,
  ));
}
