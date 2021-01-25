// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthController, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_AuthController.loading'))
      .value;

  final _$auth_tokenAtom = Atom(name: '_AuthController.auth_token');

  @override
  bool get auth_token {
    _$auth_tokenAtom.reportRead();
    return super.auth_token;
  }

  @override
  set auth_token(bool value) {
    _$auth_tokenAtom.reportWrite(value, super.auth_token, () {
      super.auth_token = value;
    });
  }

  final _$_loadingStatusAtom = Atom(name: '_AuthController._loadingStatus');

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

  final _$erroAtom = Atom(name: '_AuthController.erro');

  @override
  bool get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(bool value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthController.login');

  @override
  Future login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  final _$forgetPasswordAsyncAction =
      AsyncAction('_AuthController.forgetPassword');

  @override
  Future forgetPassword(String username) {
    return _$forgetPasswordAsyncAction
        .run(() => super.forgetPassword(username));
  }

  final _$logoutAsyncAction = AsyncAction('_AuthController.logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$getIsAuthAsyncAction = AsyncAction('_AuthController.getIsAuth');

  @override
  Future getIsAuth() {
    return _$getIsAuthAsyncAction.run(() => super.getIsAuth());
  }

  @override
  String toString() {
    return '''
auth_token: ${auth_token},
erro: ${erro},
loading: ${loading}
    ''';
  }
}
