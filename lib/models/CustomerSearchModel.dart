// To parse this JSON data, do
//
//     final productSearchModel = productSearchModelFromJson(jsonString);

import 'dart:convert';

List<CustomerSearchModel> customerSearchModelFromJson(String str) =>
    List<CustomerSearchModel>.from(
        json.decode(str).map((x) => CustomerSearchModel.fromJson(x)));

String productSearchModelToJson(List<CustomerSearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerSearchModel {
  CustomerSearchModel({
    this.label,
    //this.productname,
    // this.productalias,
    this.value,
    //  this.taxRate,
    //  this.unit,
    //  this.unitPrice,
    //  this.closingStk,
    //  this.addTaxPer,
    //  this.taxType,
    //  this.activeFlag,
  });

  String label;
  // String productname;
  // String productalias;
  int value;
//  int taxRate;
  // String unit;
  // int unitPrice;
  // int closingStk;
  // int addTaxPer;
  // int taxType;
//  bool activeFlag;

  factory CustomerSearchModel.fromJson(Map<String, dynamic> json) =>
      CustomerSearchModel(
        label: json["label"],
        //productname: json["productname"],
        //  productalias: json["productalias"],
        value: json["value"],
        //  taxRate: json["TaxRate"],
        //  unit: json["Unit"],
        //  unitPrice: json["UnitPrice"],
        // closingStk: json["ClosingSTK"],
        //  addTaxPer: json["AddTaxPer"],
        //  taxType: json["TaxType"],
        //  activeFlag: json["ActiveFlag"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        //"productname": productname,
        //  "productalias": productalias,
        "value": value,
        //   "TaxRate": taxRate,
        //   "Unit": unit,
        //  "UnitPrice": unitPrice,
        //  "ClosingSTK": closingStk,
        //  "AddTaxPer": addTaxPer,
        //  "TaxType": taxType,
        //  "ActiveFlag": activeFlag,
      };
}
