import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/pagination_controller.dart';
import 'home_page.dart';

class SearchUser extends StatelessWidget {
  var _searchEdit123 = new TextEditingController();
  final PaginationController customerSearchController =
      Get.put(PaginationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        body: new Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: new Column(children: <Widget>[
              /*  Obx(() {*/
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: TextField(
                  controller: _searchEdit123,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: new TextStyle(color: Colors.grey[300]),
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (text) {
                    //print('First text field: $text');
                    if (text.length > 3) {
                      customerSearchController.fetch_search_details(text);
                    }
                  },
                ),
              ),
              /*}),*/
              _listView(),
            ])));
  }

  Widget _listView() {
    return new Flexible(
      child: Obx(() {
        if (customerSearchController.isLoading.value == true)
          return Center(child: CircularProgressIndicator());
        else
          return Container(
              child: new ListView.builder(
                  itemCount: customerSearchController
                      .customer_search_list.length, //_socialListItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      color: Colors.cyan[50],
                      elevation: 5.0,
                      child: new Container(
                        margin: EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            //print("I was tapped!");
                            customerSearchController.productnamefromlist(
                                customerSearchController
                                    .customer_search_list[index].label);
                            /* customerSearchController.productIDfromlist(
                                customerSearchController
                                    .customer_search_list[index].value
                                    .toString());*/
                            //customerSearchController.fetch_searched_one_Customer_details();

                            Get.to(HomePage());
                          },
                          child: Text(
                              "${customerSearchController.customer_search_list[index].label}"),
                        ),
                        /*child: new Text(
                            "${customerSearchController.customer_search_list[index].productname}"),*/
                      ),
                    );
                  }));
      }),
    );
  }
}
