import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grisoftwarechallange/constants/constants.dart';
import 'package:grisoftwarechallange/controller/mainscreen_controller.dart';

Container urlCard(
    BuildContext context, String shortLink, String longLink, int index) {
  MainScreenController mainScreenController = Get.put(MainScreenController());
  return Container(
      height: MediaQuery.of(context).size.height * 1 / 4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        longLink,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        mainScreenController.deleteFromList(index);
                      },
                      child: SvgPicture.asset("assets/del.svg",
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.contain,
                          semanticsLabel: 'Illustration'),
                    ),
                  ],
                ),
              ))),
          Container(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
              width: MediaQuery.of(context).size.width),
          Expanded(
              flex: 3,
              child: Obx(() => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(shortLink,
                            style: TextStyle(
                              color: Constants.buttonColor,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: shortLink))
                                .then((value) {
                              mainScreenController.changeButtonState(index);
                              mainScreenController.urlModelList.refresh();
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 1 / 20,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(mainScreenController
                                  .urlModelList[index].uniqueColor),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Center(
                                child: Text(
                              mainScreenController
                                  .urlModelList[index].uniqueText,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ],
      ));
}
