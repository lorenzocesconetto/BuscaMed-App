// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductController on _ProductController, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_ProductController.loading'))
      .value;

  final _$_loadingStatusAtom = Atom(name: '_ProductController._loadingStatus');

  @override
  bool get _loadingStatus {
    _$_loadingStatusAtom.reportRead();
    return super._loadingStatus;
  }

  @override
  set _loadingStatus(bool value) {
    _$_loadingStatusAtom.reportWrite(value, super._loadingStatus, () {
      super._loadingStatus = value;
    });
  }

  final _$productsAtom = Atom(name: '_ProductController.products');

  @override
  ProductModel get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ProductModel value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$pricesAtom = Atom(name: '_ProductController.prices');

  @override
  List<GroupPriceModel> get prices {
    _$pricesAtom.reportRead();
    return super.prices;
  }

  @override
  set prices(List<GroupPriceModel> value) {
    _$pricesAtom.reportWrite(value, super.prices, () {
      super.prices = value;
    });
  }

  final _$getProductAsyncAction = AsyncAction('_ProductController.getProduct');

  @override
  Future getProduct(String id) {
    return _$getProductAsyncAction.run(() => super.getProduct(id));
  }

  final _$_ProductControllerActionController =
      ActionController(name: '_ProductController');

  @override
  dynamic cleanProduct() {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.cleanProduct');
    try {
      return super.cleanProduct();
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
prices: ${prices},
loading: ${loading}
    ''';
  }
}
