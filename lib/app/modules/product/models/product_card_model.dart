import 'dart:convert';

ProductCardModel userModelFromJson(String str) =>
    ProductCardModel.fromJson(json.decode(str));

String userModelToJson(ProductCardModel data) => json.encode(data.toJson());

class ProductCardModel {
  int id;
  String name;
  String img_small;
  String producer;
  String active_principle;
  double best_price;

  ProductCardModel(
      {this.id,
      this.name,
      this.img_small,
      this.producer,
      this.active_principle,
      this.best_price});

  factory ProductCardModel.fromJson(Map<String, dynamic> json) =>
      ProductCardModel(
          id: json["id"],
          name: json["name"],
          img_small: json["img_small"],
          producer: json["producer"],
          active_principle: json["active_principle"],
          best_price: json["best_price"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img_small": img_small,
      };
}
