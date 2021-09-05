import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grisoftwarechallange/controller/mainscreen_controller.dart';
import 'package:grisoftwarechallange/widgets/title_widget.dart';
import 'package:grisoftwarechallange/widgets/url_card.dart';

Column detailView() {
  MainScreenController _mainScreenController = Get.put(MainScreenController());
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(flex: 1, child: titleWidget()),
      Expanded(
        flex: 20,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
                itemCount: _mainScreenController.urlModelList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: urlCard(
                        context,
                        _mainScreenController.urlModelList[index].shortUrl,
                        _mainScreenController.urlModelList[index].longUrl,
                        index),
                  );
                })),
      )
    ],
  );
}
