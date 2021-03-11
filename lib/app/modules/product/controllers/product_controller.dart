import 'package:buscamed/app/modules/product/models/group_price_model.dart';
import 'package:buscamed/app/modules/product/models/product_model.dart';
import 'package:buscamed/app/modules/product/repositories/product_repository.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = _ProductController with _$ProductController;

abstract class _ProductController with Store {
  final ProductRepository repository;

  _ProductController(this.repository);

  @observable
  bool _loadingStatus = false;

  @computed
  bool get loading => _loadingStatus;

  @observable
  ProductModel products;

  @observable
  List<GroupPriceModel> prices = [];

  @action
  getProduct(String id) async {
    _loadingStatus = true;
    dynamic jsonProduct = await repository.getProduct(id);
    if (jsonProduct != null) {
      products = ProductModel.fromJson(jsonProduct);
      prices = [];
      products.prices.forEach((price) {
        prices.add(new GroupPriceModel(
            1, new InfoPrices(price.url, price.store, price.price)));
        if (price.promotion_price != null && price.promotion_qty > 1) {
          prices.add(new GroupPriceModel(price.promotion_qty,
              new InfoPrices(price.url, price.store, price.promotion_price)));
        }
      });
    }
    _loadingStatus = false;
  }

  @action
  cleanProduct() {}
}
