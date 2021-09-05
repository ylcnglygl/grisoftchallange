import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grisoftwarechallange/constants/constants.dart';
import 'package:grisoftwarechallange/model/url_model.dart';
import 'package:grisoftwarechallange/services/api_service.dart';

class MainScreenController extends GetxController {
  InputDecoration textInputDecoration = InputDecoration();
  TextEditingController textEditingController = TextEditingController();
  RxBool isNull = false.obs;
  RxBool changePage = false.obs;
  RxList<UrlModel> urlModelList = RxList();
  RxString longUrl = "".obs;
  RxString shortUrl = "".obs;
  RxString buttonText = "COPY!".obs;
  RxBool coppied = false.obs;
  RxBool isData = true.obs;

  void addToList(String longUrl, String shortUrl, int uniqueColor,
      String uniqueText, bool coppied) {
    urlModelList
        .add(UrlModel(longUrl, shortUrl, uniqueColor, uniqueText, coppied));
  }

  void deleteFromList(int index) {
    urlModelList.removeAt(index);
  }

  Future<void> getLinkData(String url) async {
    isData.value = false;
    await getData(url).then((value) {
      isData.value = true;
    });
  }

  void changeButtonState(int index) {
    if (urlModelList[index].coppied == false) {
      urlModelList[index].uniqueColor = 0xff3B3054;
      urlModelList[index].uniqueText = "COPIED!";
      urlModelList[index].coppied = true;
    } else {
      urlModelList[index].uniqueColor = 0xff2ACFCF;

      urlModelList[index].uniqueText = "COPY!";
      urlModelList[index].coppied = false;
    }
    print(urlModelList[index].uniqueText);
  }
}

enum FetchingData { BEGIN, CONTINUE, END }
