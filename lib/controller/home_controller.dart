import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:abybaby_assignment/model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var resData;
  List<Datum> resListData = [];
  var i = 1.obs;

  var languageValue = "English".obs;
  Future getData() async {
    http.Response response;
    try {
      response = await http
          .get(Uri.parse("https://kv.businessenquiry.co.in/api/category"));
      if (response.statusCode == 200) {
        resData = CatagoryModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        resListData = resData.data;

        print(resListData.toList());
        return resListData;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
