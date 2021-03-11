class GroupPriceModel {
  final int quant;
  final InfoPrices infos;

  GroupPriceModel(this.quant, this.infos);
}

class InfoPrices {
  final String url;
  final String store;
  final double price;

  InfoPrices(this.url, this.store, this.price);
}
