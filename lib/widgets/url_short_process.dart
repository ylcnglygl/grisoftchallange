import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grisoftwarechallange/constants/constants.dart';
import 'package:grisoftwarechallange/controller/mainscreen_controller.dart';
import 'package:grisoftwarechallange/services/api_service.dart';

Container urlShortProcess(BuildContext context) {
  MainScreenController _mainScreenController = Get.put(MainScreenController());
  return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Constants.cardBackgroundColor,
      ),
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 1 / 2,
            bottom: MediaQuery.of(context).size.height * 1 / 15,
            child: SvgPicture.asset("assets/shape.svg",
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
                semanticsLabel: 'Illustration'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: _mainScreenController.textEditingController,
                  // validator: (v) {
                  //   v!.isEmpty
                  //       ? _mainScreenController.isNull.value = true
                  //       : false;
                  // },

                  textAlign: TextAlign.center,
                  decoration:
                      _mainScreenController.textInputDecoration.copyWith(
                    enabledBorder: OutlineInputBorder(
                        borderSide: _mainScreenController.isNull.value
                            ? BorderSide(color: Colors.red, width: 5.0)
                            : BorderSide(
                                color: Constants.cardBackgroundColor,
                                width: 1.0)),
                    hintText: _mainScreenController.isNull.value
                        ? 'Please add a link here'
                        : 'Shorten a link here ...',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _mainScreenController.isNull.value
                            ? Colors.red
                            : Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (val) {},
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: GestureDetector(
                    onTap: () {
                      Uri.parse(_mainScreenController
                                  .textEditingController.text)
                              .isAbsolute
                          ? _mainScreenController.isNull.value = false
                          : _mainScreenController.isNull.value = true;

                      _mainScreenController.isNull.value
                          ? null
                          : _mainScreenController.changePage.value = true;

                      _mainScreenController.isNull.value
                          ? null
                          : _mainScreenController
                              .getLinkData(_mainScreenController
                                  .textEditingController.text)
                              .then((value) {
                              _mainScreenController.addToList(
                                  _mainScreenController
                                      .textEditingController.text,
                                  _mainScreenController.shortUrl.value,
                                  0xff2ACFCF,
                                  "COPY!",
                                  false);
                              _mainScreenController.textEditingController.text =
                                  "";
                            });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1 / 17,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Constants.buttonColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Center(
                          child: Text(
                        "SHORTEN IT!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  )),
            ],
          ),
        ],
      ));
}
