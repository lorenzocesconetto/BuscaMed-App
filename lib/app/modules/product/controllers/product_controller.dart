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

  @action
  getProduct(String id) async {
    _loadingStatus = true;
    dynamic jsonProduct = await repository.getProduct(id);
    if (jsonProduct != null) {
      products = ProductModel.fromJson(jsonProduct);
    }
    _loadingStatus = false;
  }
}
