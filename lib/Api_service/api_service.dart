import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:taskapp/model/Data_model.dart';
import 'package:http/http.dart' as http;

class ApiService extends ChangeNotifier{

  Future<List<Data>> getVideoData() async {
    String baseUrl= "https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test";
    //String token = access_token;
    final response = await http.get(
        Uri.parse(baseUrl),
        headers: <String,String>{
          'Content-Type' : 'application/json',
          'Accept': 'application/json',
          //'Authorization' : 'Bearer $token',
        }
    );
    if(response.statusCode == 200){
      List<dynamic> data = jsonDecode(response.body)["data"];
      debugPrint(data.toString());
      return data.map((dynamic item) => Data.fromJson(item)).toList();
    }else{
      throw Exception("Failed to load data");
    }
  }
}