import 'dart:async';

import 'package:buscamed/app/modules/home/controllers/home_controller.dart';
import 'package:buscamed/app/shared/components/logo_component.dart';
import 'package:buscamed/app/shared/components/search_input_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeHeaderComponent extends StatefulWidget {
  @override
  _HomeHeaderComponentState createState() => _HomeHeaderComponentState();
}

class _HomeHeaderComponentState extends State<HomeHeaderComponent> {
  final homeController = Modular.get<HomeController>();

  final searchTextController = TextEditingController();
  Timer _debounce;
  String searchProduct = '';

  @override
  void initState() {
    searchTextController.addListener(() => listeningSearchInput());
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  listeningSearchInput() {
    String search = searchTextController.value.text.trim();
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (searchProduct != search) {
        searchProduct = search;
        await homeController.getSearch(
            searchName: searchTextController.value.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                      child: GestureDetector(
                        onTap: () => Modular.to.pushNamed('/user'),
                        child: Text(
                          "Ver perfil",
                          style: TextStyle(
                              color: ThemeColors.input_blue,
                              fontFamily: 'Lato-Black'),
                        ),
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
                Expanded(
                    child: SearchInputComponent(
                  controller: searchTextController,
                )),
                // GestureDetector(
                //   onTap: () => _settingModalBottomSheet(context),
                //   child: Padding(
                //     padding: EdgeInsets.only(left: 16.0),
                //     child: Icon(
                //       Icons.filter_list_outlined,
                //       color: ThemeColors.input_blue,
                //     ),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(Icons.music_note),
                  title: new Text('Music'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}
