import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants/urls.dart';
import 'package:flutter_test_app/services/local.dart';
import 'package:flutter_test_app/services/response.dart';

class ApiHelper {
  late Dio client;
  final String baseUrls;

  ApiHelper(this.baseUrls) {
    client = Dio();
    client.options.baseUrl = baseUrls;  // Ensure the baseUrl is set correctly
  }

  // GET Request
  Future<HTTPResponse?> getRequest(String endpoint) async {
    var header = {
      "Authorization": LocalService.accessToken != null
          ? "Bearer ${LocalService.accessToken}"
          : "",
    };
    client.options.headers = header;

    try {
      final response = await client.get(AppUrls.baseurl + endpoint);
      if (response.statusCode == 200) {
        debugPrint('Error: ${response.statusCode}');
        return response.data;    
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // POST Request
  Future<HTTPResponse?> postRequest(String endpoint, dynamic data) async {
    var header = {
      "Authorization": LocalService.accessToken != null
          ? "Bearer ${LocalService.accessToken}"
          : "",
    };
    client.options.headers = header;

    try {
      final response = await client.post(AppUrls.baseurl + endpoint, data: data); // Fixed to use the correct endpoint
      if (response.statusCode == 200) {
        debugPrint('Error: ${response.statusCode}');
        return response.data;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

