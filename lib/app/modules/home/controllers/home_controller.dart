import 'package:buscamed/app/modules/home/models/page_product_model.dart';
import 'package:buscamed/app/modules/home/repositories/home_repository.dart';
import 'package:buscamed/app/modules/user/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final UserRepository userRepository;
  final HomeRepository repository;

  _HomeController(this.userRepository, this.repository);

  @observable
  bool _loadingStatus = false;

  @computed
  bool get loading => _loadingStatus;

  @observable
  String _error;

  @observable
  PageProductModel products = new PageProductModel(items: []);

  @action
  getHome() async {
    _loadingStatus = true;
    dynamic jsonProduct = await repository.getHome();
    if (jsonProduct != null) {
      products = PageProductModel.fromJson(jsonProduct);
    }
    _loadingStatus = false;
  }

  Future<void> getSearch({String searchName}) async {
    if (searchName.isNotEmpty) {
      setLoading(true);
      setError(null);

      dynamic jsonProducts =
          await repository.searchProduct(searchName: searchName);
      if (jsonProducts != null) {
        products = PageProductModel.fromJson(jsonProducts);
      }
      setLoading(false);
    } else {
      await getHome();
    }
  }

  @computed
  get error => this._error;

  @action
  setLoading(value) => this._loadingStatus = value;

  @action
  setError(value) => this._error = value;
}
