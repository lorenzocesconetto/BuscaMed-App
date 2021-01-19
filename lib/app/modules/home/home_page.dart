import 'package:buscamed/app/modules/product/component/product_card.dart';
import 'package:buscamed/app/shared/components/logo_component.dart';
import 'package:buscamed/app/shared/components/search_input_component.dart';
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
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          floating: false,
          pinned: true,
          elevation: 10,
          expandedHeight: 150,
          collapsedHeight: 150,
          flexibleSpace: Padding(
            padding: EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    LogoComponent(
                      small: true,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Bem-vindo(a)!",
                          style: TextStyle(
                              color: ThemeColors.text_gray,
                              fontFamily: 'Lato-Black'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 4.0,
                          ),
                          child: Text(
                            "Ver perfil",
                            style: TextStyle(
                                color: ThemeColors.input_blue,
                                fontFamily: 'Lato-Black'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: SearchInputComponent()),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Icon(
                        Icons.filter_list_outlined,
                        color: ThemeColors.input_blue,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 350.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.0,
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
