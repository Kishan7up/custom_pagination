import 'dart:convert';

List<ProductSearchModel> productSearchModelFromJson(String str) =>
    List<ProductSearchModel>.from(
        json.decode(str).map((x) => ProductSearchModel.fromJson(x)));

String productSearchModelToJson(List<ProductSearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductSearchModel {
  ProductSearchModel({
    //  this.label,
    this.productname,
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

  // String label;
  String productname;
  // String productalias;
  int value;
//  int taxRate;
  // String unit;
  // int unitPrice;
  // int closingStk;
  // int addTaxPer;
  // int taxType;
//  bool activeFlag;

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) =>
      ProductSearchModel(
        // label: json["label"],
        productname: json["CustomerName"],
        //  productalias: json["productalias"],
        value: json["CustomerID"],
        //  taxRate: json["TaxRate"],
        //  unit: json["Unit"],
        //  unitPrice: json["UnitPrice"],
        // closingStk: json["ClosingSTK"],
        //  addTaxPer: json["AddTaxPer"],
        //  taxType: json["TaxType"],
        //  activeFlag: json["ActiveFlag"],
      );

  Map<String, dynamic> toJson() => {
        //  "label": label,
        "CustomerName": productname,
        //  "productalias": productalias,
        "CustomerID": value,
        //   "TaxRate": taxRate,
        //   "Unit": unit,
        //  "UnitPrice": unitPrice,
        //  "ClosingSTK": closingStk,
        //  "AddTaxPer": addTaxPer,
        //  "TaxType": taxType,
        //  "ActiveFlag": activeFlag,
      };
}
