import 'dart:convert';

import 'package:custom_pagination/const/Utils.dart';
import 'package:custom_pagination/models/CustomerSearchModel.dart';
import 'package:custom_pagination/models/UserModel.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<ProductSearchModel>> fetch_search_customer_details(
      int pagenumber) async {
    await Future.delayed(Duration(seconds: 1));

    var url = URLs.host + "Customer/" + pagenumber.toString() + "-" + "10";

    //TODO Request Parameter
    Map<String, String> body = {
      /* CustomerConst.WORD: query,*/
      /* CustomerConst.COMPANY_ID: '10'*/
      "LoginUserID": "admin",
      "CompanyId": "1007"
    };

    //TODO API BODY / HEADERS / Emcoding Type
    final response = await http.post((Uri.parse(url)),
        //body: body,
        body: body,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"));

    /* var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));*/
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body); //response.body;
      print("RRRRRRRRTTTTTTTTTTTTTTTT" + jsonString.toString());
      return productSearchModelFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<CustomerSearchModel>> fetch_search_details(query) async {
    await Future.delayed(Duration(seconds: 1));

    var url = URLs.host + "Customer/Search";

    //TODO Request Parameter
    Map<String, String> body = {
      "CompanyId": "1007",
      "word": query,
      "LoginUserID": "admin"
    };

    //TODO API BODY / HEADERS / Emcoding Type
    final response = await http.post((Uri.parse(url)),
        //body: body,
        body: body,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"));

    /* var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));*/
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body); //response.body;

      return customerSearchModelFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<ProductSearchModel>> fetch_searched_One_Customer_details(
      query) async {
    await Future.delayed(Duration(seconds: 1));

    var url = URLs.host + "Customer/Search";

    //TODO Request Parameter
    Map<String, String> body = {
      "CompanyId": "1007",
      "word": query,
      "needALL": "1",
      "LoginUserID": "admin"
    };

    //TODO API BODY / HEADERS / Emcoding Type
    final response = await http.post((Uri.parse(url)),
        //body: body,
        body: body,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"));

    /* var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));*/
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body); //response.body;

      return productSearchModelFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
