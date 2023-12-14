import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pagination_assignment/core/api_routes.dart';
import 'package:pagination_assignment/core/app_enums.dart';
import 'package:pagination_assignment/core/network_service.dart';
import 'package:pagination_assignment/dashboard_pagination/data_model/lead_data_model/lead_data_model.dart';

class ListPaginationState extends ChangeNotifier {
  int _currentPageNumber = 1;
  final int _totalPages = 10;
  DataState _dataState = DataState.uninitialized;

  bool get _didLastLoad => _currentPageNumber >= _totalPages;

  DataState get dataState => _dataState;
  List<LeadDataModel> _dataList = [];

  List<LeadDataModel> get dataList => _dataList;

  void fetchData({bool isRefresh = false}) async {
    if (!isRefresh) {
      _dataState = (_dataState == DataState.uninitialized)
          ? DataState.initialFetching
          : DataState.moreFetching;
    } else {
      _currentPageNumber = 1;
      _dataState = DataState.refreshing;
    }
    notifyListeners();
    try {
      if (_didLastLoad) {
        _dataState = DataState.noMoreData;
      } else {
        dynamic list = await fetchLeadDetails();
        if (_dataState == DataState.refreshing) {
          _dataList.clear();
        }
        _dataList += list;
        _dataState = DataState.fetched;
        _currentPageNumber += 1;
      }
      notifyListeners();
    } catch (e) {
      Logger().e(e);
      _dataState = DataState.error;
      notifyListeners();
    }
  }

  Future<List<LeadDataModel>> fetchLeadDetails() async {
    String userId = "51d31396-8514-4edc-9897-81873fc79b4b";
    var response = await NetworkService.get(
        url:
            "${ApiRoutes.baseURL}${ApiRoutes.pagination}?page=$_currentPageNumber&size=10&userId=$userId&status=");
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      if (decodedData != null &&
          (decodedData is Map) &&
          decodedData['data'] != null &&
          (decodedData['data'] is List)
      ) {
        var list = (decodedData['data'] as List)
            .map((e) => LeadDataModel.fromMap(e))
            .toList();
        return list;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  void changeState(DataState value){
    _dataState = value;
    notifyListeners();
  }
}
