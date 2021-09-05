import 'dart:convert';

import 'package:get/get.dart';
import 'package:grisoftwarechallange/controller/mainscreen_controller.dart';
import 'package:http/http.dart' as http;

MainScreenController mainScreenController = Get.put(MainScreenController());

Future<void> getData(String url) async {
  final response = await http
      .post(Uri.parse("https://api.shrtco.de/v2/shorten"), body: {'url': url});

  var result = jsonDecode(response.body);
  print(result);
  mainScreenController.shortUrl.value = result["result"]["full_short_link"];
}
