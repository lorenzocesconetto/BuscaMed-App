import 'dart:convert';

ProductModel userModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String userModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String name;
  String img_small;
  List<PriceModel> prices;

  ProductModel({this.name, this.img_small, this.prices});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      name: json["name"],
      img_small: json["img_small"],
      prices: List<PriceModel>.from(
          json["prices"].map((x) => PriceModel.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "name": name,
        "img_small": img_small,
        "prices": prices,
      };
}

class PriceModel {
  String name;
  String store;
  String url;
  double price;
  double promotion_price;
  String promotion_qty;
  String description;
  String active_principle;
  String producer;

  PriceModel(
      {this.name,
      this.store,
      this.price,
      this.url,
      this.promotion_price,
      this.promotion_qty,
      this.description,
      this.active_principle,
      this.producer});

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        name: json["name"],
        store: json["store"],
        price: json["price"],
        url: json["url"],
        promotion_price: json["promotion_price"],
        promotion_qty:
            json["promotion_qty"] != 0 ? json["promotion_qty"].toString() : "1",
        description: json["description"],
        producer: json["producer"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "store": store,
        "price": price,
        "url": url,
        "promotion_price": promotion_price,
        "promotion_qty": promotion_qty,
        "description": description,
        "producer": producer,
      };

  @override
  String toString() {
    return 'PriceModel{name: $name, store: $store, price: $price, promotion_price: $promotion_price, promotion_qty: $promotion_qty, description: $description, active_principle: $active_principle, producer: $producer}';
  }
}
