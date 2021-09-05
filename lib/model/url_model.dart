import 'package:flutter/material.dart';

class UrlModel {
  String longUrl;
  String shortUrl;
  bool coppied = false;
  int uniqueColor = 0xff2ACFCF;
  String uniqueText = "COPY!";

  UrlModel(
      @required this.longUrl,
      @required this.shortUrl,
      @required this.uniqueColor,
      @required this.uniqueText,
      @required this.coppied);
}
