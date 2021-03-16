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

  int _page = 1;
  int _pageNext = 1;
  ScrollController _scrollProductController;

  @override
  void initState() {
    super.initState();
    homeController.getHome();
    homeController.cleanSuggest();

    _scrollProductController = new ScrollController();
  }

  // void _scrollListener() {
  //   if (_scrollProductController.position.extentAfter <= 0.5) {
  //     if (_page != _pageNext &&
  //         HomeController.productStore.getNextPage() != null) {
  //       setState(() => _page++);
  //       syncCategory();
  //     }
  //   }
  // }
  //
  // syncCategory() async {
  //   await homeController.getProducts(
  //     page: _pageNext,
  //     keepResult: true,
  //   );
  //   setState(() => _pageNext++);
  // }

  backOnTop() {
    _scrollProductController.animateTo(0,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.8;

    return Scaffold(
      backgroundColor: ThemeColors.gray,
      body: SafeArea(
          child: Observer(
        builder: (_) =>
            CustomScrollView(controller: _scrollProductController, slivers: [
          HomeHeaderComponent(scrollTop: () => backOnTop()),
          SliverToBoxAdapter(
            child: Visibility(
              visible: homeController.loading,
              child: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          homeController.sugests == null
              ? SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 320.0,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ProductCardComponent(
                        id: homeController.products.items[index].id,
                        name: homeController.products.items[index].name,
                        producer: homeController.products.items[index].producer,
                        best_price:
                            homeController.products.items[index].best_price,
                        img_small:
                            homeController.products.items[index].img_small,
                        active_principle: homeController
                            .products.items[index].active_principle,
                      );
                    },
                    childCount: homeController.products.items.length,
                    addRepaintBoundaries: true,
                    addAutomaticKeepAlives: true,
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return listSugest(homeController.sugests[index]);
                  },
                  childCount: homeController.sugests.length,
                )),
        ]),
      )),
    );
  }

  Widget listSugest(String suggest) {
    return InkWell(
      onTap: () => selectSuggest(suggest),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(suggest.toLowerCase()),
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }

  selectSuggest(String suggest) {
    homeController.getSearch(searchName: suggest);
    backOnTop();
  }
}
