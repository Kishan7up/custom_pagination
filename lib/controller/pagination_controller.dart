import 'package:custom_pagination/models/CustomerSearchModel.dart';
import 'package:custom_pagination/models/UserModel.dart';
import 'package:custom_pagination/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PaginationFilter.dart';

class PaginationController extends GetxController {
  final _users = <ProductSearchModel>[].obs;
  var customer_search_list = <CustomerSearchModel>[].obs;
  var qry = '';
  var isLoading = false.obs;
  var productnamefromlist2 = '';
  var productIDfromlist2 = '';
  final _paginationFilter = PaginationFilter().obs;
  final _sc = new ScrollController();

  List<ProductSearchModel> get users => _users.toList();
  int get limit => _paginationFilter.value.limit;

  int pageNumber = 1;
  ScrollController get sc => _sc;

  @override
  onInit() {
    /* ever(_paginationFilter,
        (_) => fetch_search_customer_details(1));*/
    fetch_search_customer_details(pageNumber);
    // fetch_search_details(qry);
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        _changePaginationFilter(pageNumber = pageNumber + 1);
      }
    });
    super.onInit();
  }

  void fetch_search_customer_details(int filter) async {
    try {
      /*  var customers =
          await RemoteServices.fetch_search_customer_details(filter);*/
      var customers =
          await RemoteServices.fetch_search_customer_details(filter);
      if (customers != null) {
        // ignore: deprecated_member_use
        //_users.value = customers;
        _users.addAll(customers);
      }
    } finally {}
  }

  void fetch_search_details(String query) async {
    try {
      isLoading(true);
      var customers = await RemoteServices.fetch_search_details(query);
      if (customers != null) {
        customer_search_list.value = customers;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetch_searched_one_Customer_details(String query) async {
    try {
      /*  var customers =
          await RemoteServices.fetch_search_customer_details(filter);*/
      var customers =
          await RemoteServices.fetch_searched_One_Customer_details(query);
      if (customers != null) {
        // ignore: deprecated_member_use
        _users.value = [];
        _users.value = customers;
        // _users.addAll(customers);
      }
    } finally {}
  }

  void changeTotalPerPage(var limitValue) {
    _users.clear();
    _changePaginationFilter(1);
  }

  void _changePaginationFilter(int page) {
    /* _paginationFilter.update((val) {
      val.page = page;
      val.limit = limit;
    });*/
    fetch_search_customer_details(page);
  }

  void productnamefromlist(String query) async {
    productnamefromlist2 = query;
    fetch_searched_one_Customer_details(query);
  }

  void productIDfromlist(String query) async {
    productIDfromlist2 = query;
  }

  //void loadNextPage() => _changePaginationFilter(pageNumber = pageNumber + 1);
}
