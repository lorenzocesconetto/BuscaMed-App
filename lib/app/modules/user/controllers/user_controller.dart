import 'package:buscamed/app/modules/user/models/user_model.dart';
import 'package:buscamed/app/modules/user/repositories/user_repository.dart';
import 'package:buscamed/app/shared/cepSearch/CepModel.dart';
import 'package:buscamed/app/shared/cepSearch/search_address_repository.dart';
import 'package:buscamed/app/shared/service/shared_local_storage_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  final UserRepository repository;
  final SharedLocalStorageService localStorage;
  final SearchAddressRepository searchAddressRepository;

  _UserController(
      this.repository, this.localStorage, this.searchAddressRepository);

  @observable
  UserModel _user;

  @observable
  bool _loadingStatus = false;

  @action
  getUser(String uuid) async {
    _loadingStatus = true;
    dynamic user = await repository.getUser(uuid);
    this._user = UserModel.fromJson(user);
    _loadingStatus = false;
  }

  @action
  getUserLogin() async {
    _loadingStatus = true;
    var token = await localStorage.get("auth_token");
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    await this.getUser(decodedToken["sub"]);
    _loadingStatus = false;
  }

  @action
  createUser(UserModel newUser) async {
    _loadingStatus = true;
    dynamic user = await repository.createUser(newUser);
    _loadingStatus = false;
    if (user != null) {
      this._user = UserModel.fromJson(user);
      return true;
    } else {
      return false;
    }
  }

  @action
  editUser(UserModel newUser) async {
    _loadingStatus = true;
    dynamic user = await repository.editUser(this._user.uuid, newUser);
    _loadingStatus = false;
    if (user != null) {
      this._user = UserModel.fromJson(user);
      return true;
    } else {
      return false;
    }
  }

  @action
  deleteUser(String uuid) async {
    _loadingStatus = true;
    dynamic user = await repository.deleteUser(uuid);
    _loadingStatus = false;
  }

  @action
  getInfoCep(String cep) async {
    _loadingStatus = true;
    CepModel addressInfo = await searchAddressRepository.getInfoByCep(cep);
    _loadingStatus = false;
    return addressInfo;
  }

  @computed
  bool get loading => _loadingStatus;

  @computed
  UserModel get user => _user;
}
