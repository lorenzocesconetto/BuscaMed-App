import 'package:buscamed/app/modules/user/models/user_model.dart';
import 'package:buscamed/app/modules/user/repositories/user_repository.dart';
import 'package:buscamed/app/shared/cepSearch/CepModel.dart';
import 'package:buscamed/app/shared/cepSearch/search_address_repository.dart';
import 'package:buscamed/app/shared/service/shared_local_storage_service.dart';
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

  @observable
  String _errors;

  @action
  getUserLogin() async {
    _loadingStatus = true;
    dynamic user = await repository.getUser();
    if (user != null) {
      this._user = UserModel.fromJson(user);
    } else {
      _errors = 'Erro ao carregar usuário';
    }
    _loadingStatus = false;
  }

  @action
  createUser(UserModel newUser) async {
    _loadingStatus = true;
    dynamic user = await repository.createUser(newUser);
    _loadingStatus = false;
    if (user["success"] != null) {
      _errors = null;
      this._user = UserModel.fromJson(user);
      return true;
    } else {
      _errors = user['message']['email'] ?? 'Falha ao Criar usuário';
      return false;
    }
  }

  @action
  editUser(UserModel newUser) async {
    _loadingStatus = true;
    dynamic user = await repository.editUser(newUser);
    _loadingStatus = false;
    if (user != null) {
      _errors = null;
      await getUserLogin();
      return true;
    } else {
      _errors = "Erro ao Editar";
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
    if (addressInfo != null && addressInfo.cep != null) {
      _errors = null;
      return addressInfo;
    } else {
      _errors = 'Nenhum endereço encontrado com esse CEP';
      return null;
    }
  }

  @action
  cleanErrors() async {
    _errors = null;
  }

  @computed
  String get errors => _errors;

  @computed
  bool get loading => _loadingStatus;

  @computed
  UserModel get user => _user;
}
