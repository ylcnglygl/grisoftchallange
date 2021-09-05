import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture illustrationWidget() {
  return SvgPicture.asset("assets/illustration.svg",
      allowDrawingOutsideViewBox: true,
      fit: BoxFit.contain,
      semanticsLabel: 'Illustration');
}
