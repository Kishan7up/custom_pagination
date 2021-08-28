import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Inquiry_add_edit extends StatelessWidget {
  bool _isVisible = false;
  final TextEditingController txt_Inq_Date = TextEditingController();
  final TextEditingController txt_Customer = TextEditingController();

  final double _minValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inquiry Add/Edit"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 3, 5),
                        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                      print('change $date');
                      txt_Inq_Date.text = date.toString();
                    }, onConfirm: (date) {
                      print('confirm $date');
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  controller: txt_Inq_Date,
                  readOnly: true,
                  style: TextStyle(fontSize: 15.0),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: _minValue, horizontal: _minValue),
                      border: OutlineInputBorder()),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onTap: () {},
                  controller: txt_Customer,
                  readOnly: true,
                  style: TextStyle(fontSize: 15.0),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: _minValue, horizontal: _minValue),
                      border: OutlineInputBorder()),
                ),
              ),

              /* SizedBox(...),
              Container(...),
              Text(....)*/
            ],
          ),
        ),
      ),
    );
  }
}
