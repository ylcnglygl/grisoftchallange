import 'package:flutter/material.dart';
import 'package:grisoftwarechallange/widgets/illustration_widget.dart';
import 'package:grisoftwarechallange/widgets/logo_widget.dart';
import 'package:grisoftwarechallange/widgets/text_widget.dart';

Column mainView() {
  return Column(
    children: [
      Expanded(flex: 1, child: logoWidget()),
      Expanded(
        flex: 2,
        child: illustrationWidget(),
      ),
      Expanded(
        flex: 1,
        child: textWidget(),
      ),
    ],
  );
}
