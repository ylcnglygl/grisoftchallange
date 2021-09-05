import 'package:flutter/material.dart';

Padding textWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    child: Column(
      children: const [
        Text(
          "Let's get started!",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Paste your first link into the field to shorten it",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}
