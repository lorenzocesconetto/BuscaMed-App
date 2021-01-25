// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserController, Store {
  final _$userAtom = Atom(name: '_UserController.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$loadingAtom = Atom(name: '_UserController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_UserController.getUser');

  @override
  Future getUser(String uuid) {
    return _$getUserAsyncAction.run(() => super.getUser(uuid));
  }

  final _$getUserLoginAsyncAction = AsyncAction('_UserController.getUserLogin');

  @override
  Future getUserLogin() {
    return _$getUserLoginAsyncAction.run(() => super.getUserLogin());
  }

  final _$createUserAsyncAction = AsyncAction('_UserController.createUser');

  @override
  Future createUser(UserModel newUser) {
    return _$createUserAsyncAction.run(() => super.createUser(newUser));
  }

  final _$editUserAsyncAction = AsyncAction('_UserController.editUser');

  @override
  Future editUser(UserModel newUser) {
    return _$editUserAsyncAction.run(() => super.editUser(newUser));
  }

  final _$deleteUserAsyncAction = AsyncAction('_UserController.deleteUser');

  @override
  Future deleteUser(String uuid) {
    return _$deleteUserAsyncAction.run(() => super.deleteUser(uuid));
  }

  final _$getInfoCepAsyncAction = AsyncAction('_UserController.getInfoCep');

  @override
  Future getInfoCep(String cep) {
    return _$getInfoCepAsyncAction.run(() => super.getInfoCep(cep));
  }

  @override
  String toString() {
    return '''
user: ${user},
loading: ${loading}
    ''';
  }
}
