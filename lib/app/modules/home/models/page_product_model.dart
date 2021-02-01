import 'dart:convert';

import 'package:buscamed/app/modules/product/models/product_card_model.dart';

PageProductModel userModelFromJson(String str) =>
    PageProductModel.fromJson(json.decode(str));

String userModelToJson(PageProductModel data) => json.encode(data.toJson());

class PageProductModel {
  PageProductModel({
    this.page,
    this.total,
    this.items,
  });

  int page;
  int total;
  List<ProductCardModel> items;

  factory PageProductModel.fromJson(Map<String, dynamic> json) =>
      PageProductModel(
        page: json["page"],
        total: json["total"],
        items: List<ProductCardModel>.from(
            json["items"].map((x) => ProductCardModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "total": total,
        "items": items,
      };
}
