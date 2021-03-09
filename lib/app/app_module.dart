import 'package:buscamed/app/modules/home/home_page.dart';
import 'package:buscamed/app/modules/home/repositories/home_repository.dart';
import 'package:buscamed/app/modules/login/pages/login_page.dart';
import 'package:buscamed/app/modules/product/controllers/product_controller.dart';
import 'package:buscamed/app/modules/product/pages/product_page.dart';
import 'package:buscamed/app/pages/splash_page.dart';
import 'package:buscamed/app/shared/cepSearch/search_address_repository.dart';
import 'package:buscamed/app/shared/repositories/BaseRepository.dart';
import 'package:buscamed/app/shared/repositories/auth_repository.dart';
import 'package:buscamed/app/shared/service/shared_local_storage_service.dart';
import 'package:buscamed/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart.dart';
import 'modules/home/controllers/home_controller.dart';
import 'modules/login/controllers/auth_controller.dart';
import 'modules/login/pages/forget_pass_page.dart';
import 'modules/product/repositories/product_repository.dart';
import 'modules/user/controllers/user_controller.dart';
import 'modules/user/page/user_form_page.dart';
import 'modules/user/page/user_info_page.dart';
import 'modules/user/repositories/user_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
        Bind((i) =>
            BaseRepository(i.get<Dio>(), i.get<SharedLocalStorageService>())),
        Bind((i) => SearchAddressRepository(i.get<Dio>())),
        Bind((i) => AuthRepository(i.get<BaseRepository>())),
        Bind((i) => HomeRepository(i.get<BaseRepository>())),
        Bind((i) => ProductRepository(i.get<BaseRepository>())),
        Bind((i) => SharedLocalStorageService()),
        Bind((i) => UserRepository(i.get<BaseRepository>())),
        Bind((i) => UserController(
            i.get<UserRepository>(),
            i.get<SharedLocalStorageService>(),
            i.get<SearchAddressRepository>())),
        Bind((i) => AuthController(i.get<AuthRepository>(),
            i.get<SharedLocalStorageService>(), i.get<UserController>())),
        Bind(
          (i) =>
              HomeController(i.get<UserRepository>(), i.get<HomeRepository>()),
        ),
        Bind(
          (i) => ProductController(i.get<ProductRepository>()),
        )
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/splash', child: (_, __) => SplashScreenPage()),
        ModularRouter('/home', child: (_, __) => HomePage()),
        ModularRouter('/forget-pass', child: (_, __) => ForgetPasswordPage()),
        ModularRouter('/user-form', child: (_, __) => UserFormPage()),
        ModularRouter('/user-form', child: (_, __) => UserFormPage()),
        ModularRouter('/user', child: (_, __) => UserInfoPage()),
        ModularRouter('/client-form', child: (_, __) => HomePage()),
        ModularRouter('/login', child: (_, __) => LoginPage()),
        ModularRouter('/product/:id/:mainPrice',
            child: (_, args) => ProductPage(
                id: args.params['id'], mainPrice: args.params["mainPrice"])),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
