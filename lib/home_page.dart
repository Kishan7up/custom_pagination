import 'package:custom_pagination/SearchUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/pagination_controller.dart';

class HomePage extends StatelessWidget {
  final PaginationController _controller = Get.put(PaginationController());
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Customer"),
          actions: [
            GestureDetector(
                onTap: () {
                  print("HHHHHHEELLLLLLPPPPPPPP");
                  Get.to(SearchUser());
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.search,
                  ),
                ))
          ],
        ),
        body: Obx(() => ListView.builder(
              itemCount: _controller.users.length + 1,
              itemBuilder: (context, index) {
                /* final user = _controller.users[index];
                  print("USERVALUEETTTTTTTTTTTTtTTTTT" + user.name.toString());*/
                if (index == _controller.users.length) {
                  if (_controller.users.length < 10) {
                    _isVisible = false;
                  } else {
                    _isVisible = true;
                  }

                  return Visibility(
                    visible: _isVisible,
                    child: Center(
                        child: new Opacity(
                            opacity: true ? 1.0 : 00,
                            child: new CircularProgressIndicator())),
                  );

                  //_buildProgressIndicator(_controller.isLoadingVertical);
                } else {
                  return ListTile(
                    //leading: Text("1"),
                    title: Text(_controller.users[index].productname),
                    //subtitle: Text(user.username),
                  );
                }
              },
              controller: _controller.sc,
            )),
      ),
    );
  }
}

/*
  AppBar(  title: Text("Hello Appbar"),  leading: GestureDetector(      onTap: () { /* Write listener code here */ },      child: Icon(        Icons.menu,  // add custom icons also      ),  ),  actions: <Widget>[    Padding(      padding: EdgeInsets.only(right: 20.0),      child: GestureDetector(        onTap: () {},        child: Icon(          Icons.search,          size: 26.0,        ),      )    ),    Padding(      padding: EdgeInsets.only(right: 20.0),      child: GestureDetector(        onTap: () {},        child: Icon(            Icons.more_vert        ),      )    ),  ],),


  */
