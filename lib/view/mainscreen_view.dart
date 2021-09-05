import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grisoftwarechallange/constants/constants.dart';
import 'package:grisoftwarechallange/controller/mainscreen_controller.dart';
import 'package:grisoftwarechallange/view/detail_view.dart';
import 'package:grisoftwarechallange/view/loading_view.dart';
import 'package:grisoftwarechallange/view/main_view.dart';
import 'package:grisoftwarechallange/widgets/url_short_process.dart';

class MainScreen extends GetWidget {
  MainScreen({Key? key}) : super(key: key);

  MainScreenController _mainScreenController = Get.put(MainScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  flex: 3,
                  child: Obx(
                    () => _mainScreenController.isData.value
                        ? _mainScreenController.changePage.value
                            ? detailView()
                            : mainView()
                        : loadingView(),
                  )),
              Expanded(
                flex: 1,
                child: Obx(
                  () => urlShortProcess(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
