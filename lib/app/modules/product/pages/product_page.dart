import 'package:buscamed/app/modules/product/controllers/product_controller.dart';
import 'package:buscamed/app/modules/product/models/group_price_model.dart';
import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductPage extends StatefulWidget {
  final id;
  final mainPrice;

  ProductPage({this.id, this.mainPrice});

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
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderComponent(
            action: () => Modular.to.pop(),
            title: 'Detalhes',
          ),
          Observer(builder: (_) {
            if (productController.products == null ||
                productController.loading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:
                            ImageProduct(productController.products.img_small),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          PricesProduct(productController.prices),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          }),
        ],
      )),
    );
  }

  Image ImageProduct(String urlImage) {
    return urlImage != null && urlImage.contains("https")
        ? Image.network(
            urlImage,
            height: 150,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Image.asset(
                "assets/sem-image.png",
                height: 150,
              );
            },
          )
        : Image.asset(
            "assets/sem-image.png",
            height: 150,
          );
  }

  Widget PricesProduct(List<GroupPriceModel> prices) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: GroupedListView<dynamic, String>(
        shrinkWrap: true,
        elements: prices,
        separator: Divider(),
        groupBy: (price) => price.quant.toString(),
        groupSeparatorBuilder: (dynamic price) => SeparatorUnit(price),
        itemBuilder: (context, dynamic price) => RowPrice(price),
        order: GroupedListOrder.ASC,
      ),
    );
  }

  Widget RowPrice(GroupPriceModel groupPriceModel) {
    final infoProductPrice = groupPriceModel.infos;
    final bool bestPrice =
        infoProductPrice.price.toString() == widget.mainPrice;
    final formatNumber = new NumberFormat("#,##0.00", "pt-Br");

    return InkWell(
      onTap: () async => await canLaunch(infoProductPrice.url)
          ? await launch(infoProductPrice.url)
          : throw 'Could not launch ${infoProductPrice.url}',
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${infoProductPrice.store}",
              style: TextStyle(
                fontWeight: bestPrice ? FontWeight.bold : FontWeight.normal,
                color: bestPrice ? Colors.blueAccent : Colors.black,
              ),
            ),
            Text(
              "R\$ ${formatNumber.format(infoProductPrice.price)}",
              style: TextStyle(
                color: bestPrice ? Colors.blueAccent : Colors.black,
                fontWeight: bestPrice ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SeparatorUnit(String number) {
    String text =
        int.tryParse(number) == 1 ? '$number Unidade' : '$number Unidades';
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        color: ThemeColors.input_blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
