import 'dart:developer';

import 'package:apitest/services/auth_service.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  ApiServices _apiServices = ApiServices();

  var _dataList = [];

  get dataList => _dataList;

  Future<void> getData() async {
    await _apiServices.getData().then((value) {
     // log(value.toString());
      _dataList.clear();
      for (var doc in value) {

        _dataList.add(doc);
      }
       log(dataList.toString());
    });

    notifyListeners();
  }
}
