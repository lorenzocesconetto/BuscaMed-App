// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_HomeController.loading'))
      .value;
  Computed<dynamic> _$errorComputed;

  @override
  dynamic get error => (_$errorComputed ??=
          Computed<dynamic>(() => super.error, name: '_HomeController.error'))
      .value;

  final _$_loadingStatusAtom = Atom(name: '_HomeController._loadingStatus');

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

  final _$_errorAtom = Atom(name: '_HomeController._error');

  @override
  String get _error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  set _error(String value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  final _$productsAtom = Atom(name: '_HomeController.products');

  @override
  PageProductModel get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(PageProductModel value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$getHomeAsyncAction = AsyncAction('_HomeController.getHome');

  @override
  Future getHome() {
    return _$getHomeAsyncAction.run(() => super.getHome());
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic setLoading(dynamic value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(dynamic value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setError');
    try {
      return super.setError(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
loading: ${loading},
error: ${error}
    ''';
  }
}
