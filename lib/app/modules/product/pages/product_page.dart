import 'package:buscamed/app/modules/product/controllers/product_controller.dart';
import 'package:buscamed/app/modules/product/models/product_model.dart';
import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

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
      backgroundColor: Colors.white,
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ImageProduct(productController.products.img_small),
              ),
              Container(
                color: ThemeColors.background_product,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   productController.products.,
                      //   style: TextStyle(
                      //       fontSize: 12, color: ThemeColors.text_gray),
                      // ),
                      Text(
                        productController.products.name,
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
                      PricesProduct(productController.products.prices)
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
  return urlImage != null && urlImage.contains("https")
      ? Image.network(
          urlImage,
          height: 150,
        )
      : Image.asset(
          "assets/sem-image.png",
          height: 150,
        );
}

Widget PricesProduct(List<PriceModel> prices) {
  return SizedBox(
    height: 200,
    child: StickyGroupedListView<dynamic, String>(
      elements: prices,
      groupBy: (price) => price.promotion_qty,
      groupSeparatorBuilder: (dynamic price) =>
          Text("${price.promotion_qty} unidade"),
      itemBuilder: (context, dynamic price) => RowPrice(price),
      order: StickyGroupedListOrder.ASC,
    ),
  );
}

Widget RowPrice(PriceModel price) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${price.store}"),
        Text("R\$ ${price.price}"),
      ],
    ),
  );
}

Widget SeparatorRow(PriceModel price) {
  return Row(
    children: [
      Text("${price.store}"),
      Text("${price.price}"),
    ],
  );
}
