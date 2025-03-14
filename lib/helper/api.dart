import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required url,@required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('there is problem ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required url, @required dynamic body, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url),
            body: body,
            headers: headers
        );
    if (response.statusCode == 200) {
      Map<String,dynamic>data=jsonDecode(response.body);
      return data;
    } else {
      throw Exception('there is problem ${response.statusCode}');
    }

  }
  Future<dynamic> put(
      {required url, @required dynamic body, @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type':'application/x-www-form-urlencoded'
    });
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url=$url/n body =$body');
    http.Response response =
    await http.put(Uri.parse(url),
        body: body,
        headers: headers
    );
    if (response.statusCode == 200) {
      Map<String,dynamic>data=jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('there is problem ${response.statusCode}');
    }

  }

}
