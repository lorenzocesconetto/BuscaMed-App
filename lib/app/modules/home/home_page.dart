import 'package:buscamed/app/modules/home/component/hearder_component.dart';
import 'package:buscamed/app/modules/product/component/product_card.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.gray,
      body: SafeArea(
          child: CustomScrollView(slivers: [
        HomeHeaderComponent(),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 350.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: .0,
            childAspectRatio: 0.6,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ProductCardComponent();
            },
            childCount: 50,
          ),
        )
      ])),
    );
  }
}
