import 'package:buscamed/app/modules/product/controllers/product_controller.dart';
import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatefulWidget {
  final id;

  ProductPage({this.id});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productController = Modular.get<ProductController>();

  @override
  void initState() {
    super.initState();
    productController.getProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background_product,
      body: SafeArea(child: SingleChildScrollView(child: Observer(
        builder: (_) {
          if (productController.products == null || productController.loading) {
            return CircularProgressIndicator();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderComponent(
                action: () => Modular.to.pop(),
                title: 'Detalhes',
              ),
              ImageProduct(productController.products.img_small),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MICROVLAR",
                        style: TextStyle(
                            fontSize: 12, color: ThemeColors.text_gray),
                      ),
                      Text(
                        "Microvlar com 63 drágeas",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("COMPARATIVO DE PREÇOS EM SUA REGIÃO"),
                      ),
                      Text(
                        "Abaixo segue uma listagem da disponibilidade deste medicamento e sua região. "
                        "Ao tocar em um de nossos parceiros, você será levado ao site oficial da drogaria.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 12,
                            textBaseline: TextBaseline.alphabetic),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ))),
    );
  }
}

Image ImageProduct(String urlImage) {
  return urlImage != null
      ? Image.asset(
          urlImage,
          height: 150,
        )
      : Image.asset(
          "assets/sem-image.png",
          height: 150,
        );
}
