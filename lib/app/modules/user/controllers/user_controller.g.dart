// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserController, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_UserController.loading'))
      .value;
  Computed<UserModel> _$userComputed;

  @override
  UserModel get user => (_$userComputed ??=
          Computed<UserModel>(() => super.user, name: '_UserController.user'))
      .value;

  final _$_userAtom = Atom(name: '_UserController._user');

  @override
  UserModel get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(UserModel value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  final _$_loadingStatusAtom = Atom(name: '_UserController._loadingStatus');

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
loading: ${loading},
user: ${user}
    ''';
  }
}
