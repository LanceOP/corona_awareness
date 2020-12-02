import 'package:aware/models/models.dart';
import 'package:aware/repositories/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:aware/models/general_data_model.dart';
import 'repositories.dart';
import 'package:aware/models/topheadlinesnews/response_top_headlinews_news.dart';

class ApiRepository {
  final ApiClient apiClient;

  ApiRepository({@required this.apiClient});

  Future<Covid19> getAllData() async {
    return apiClient.getAllData();
  }

  fetchTotalData() async {
    return apiClient.fetchTotalData();
  }

  fetchChartData() async {
    return apiClient.fetchchartData();
  }

  fetchTestData() async {
    return apiClient.fetchTestData();
  }

  fetchStatesLength() async {
    return apiClient.fetchStatesLengthData();
  }

  fetchStatesDailyData() async {
    return apiClient.fetchStatesDailyData();
  }

  fetchStatesDailyDataLength() async {
    return apiClient.fetchStatesDailyDataLength();
  }

  fetchZoneData() async {
    return apiClient.fetchZoneData();
  }

  fetchZoneDataLength() async {
    return apiClient.fetchZoneDataLength();
  }

  final _apiProvider = ApiProvider();

  Future<ResponseTopHeadlinesNews> fetchTopHeadlinesNews() =>
      _apiProvider.getTopHeadlinesNews();
}
