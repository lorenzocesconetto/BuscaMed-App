import 'package:buscamed/app/modules/home/component/hearder_component.dart';
import 'package:buscamed/app/modules/product/component/product_card.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();
  var _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    homeController.getHome();

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        //Começo
        if (_controller.position.pixels == 0) {
          print("atEdge ${_controller.position.atEdge}");
          print("final ${_controller.position.pixels}");
        } else {
          print("else ${_controller.position.atEdge}");
          print("final ${_controller.position.maxScrollExtent}");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.gray,
      body: SafeArea(
          child: Observer(
        builder: (_) => CustomScrollView(controller: _controller, slivers: [
          HomeHeaderComponent(),
          SliverToBoxAdapter(
            child: Visibility(
              visible: homeController.loading,
              child: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: .0,
              childAspectRatio: 0.6,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ProductCardComponent(
                  id: homeController.products.items[index].id,
                  name: homeController.products.items[index].name,
                  producer: homeController.products.items[index].producer,
                  best_price: homeController.products.items[index].best_price,
                  img_small: homeController.products.items[index].img_small,
                  active_principle:
                      homeController.products.items[index].active_principle,
                );
              },
              childCount: homeController.products.items.length,
              addRepaintBoundaries: true,
              addAutomaticKeepAlives: true,
            ),
          ),
        ]),
      )),
    );
  }
}
