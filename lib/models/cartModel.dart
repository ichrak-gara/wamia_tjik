class Cart {
  final String? productId;
  final String? productName;
  final int? initialPrice;
  final String? image;

  Cart({
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.image
  });

  Cart.fromMap(Map<dynamic , dynamic>  res)
      : productId = res["productId"],
        productName = res["productName"],
        initialPrice = res["initialPrice"],
        image = res["image"];

  Map<String, Object?> toMap(){
    return {
      'productId' : productId,
      'productName' :productName,
      'initialPrice' : initialPrice,
      'image' : image,
    };
  }
}