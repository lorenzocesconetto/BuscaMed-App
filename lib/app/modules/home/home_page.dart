import 'package:buscamed/app/modules/login/components/input_email_component.dart';
import 'package:buscamed/app/shared/components/logo_component.dart';
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
      body: SafeArea(
          child: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: false,
          pinned: true,
          expandedHeight: 150.0,
          collapsedHeight: 150,

          ///Properties of the App Bar when it is expanded
          flexibleSpace: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LogoComponent(
                      small: true,
                    ),
                    Text("Bem-vindo(a)!")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: EmailInputComponent()),
                    Text("Bem-vindo(a)!")
                  ],
                ),
              ],
            ),
          ),
          // FlexibleSpaceBar(
          //   centerTitle: true,
          //   title: Text(
          //     "SliverGrid Widget",
          //     style: TextStyle(
          //       color: Colors.black87,
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   background: Container(
          //     decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(
          //           color: Colors.black26,
          //           width: 1.0,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 50,
          ),
        )
      ])),
    );
  }
}
