class DetailsModel {
  final num price;
  final String productName;
  final String productDescription;
  final List imagesList;
  final int productId;
  final String image;
  final num oldPrice;
  final num discount;

  DetailsModel({
    required this.price,
    required this.productName,
    required this.productDescription,
    required this.imagesList,
    required this.productId,
    required this.image,
    required this.oldPrice,
    required this.discount,
  });
}
