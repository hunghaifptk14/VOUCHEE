import 'package:vouchee/model/modal.dart';

class Cart {
  final int totalQuantity;
  final int totalPrice;
  final int discountPrice;
  final int finalPrice;
  final List<Seller> sellers;

  Cart({
    required this.totalQuantity,
    required this.totalPrice,
    required this.discountPrice,
    required this.finalPrice,
    required this.sellers,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      totalQuantity: json['totalQuantity'] as int,
      totalPrice: json['totalPrice'] as int,
      discountPrice: json['discountPrice'] as int,
      finalPrice: json['finalPrice'] as int,
      sellers: (json['sellers'] as List<dynamic>)
          .map((seller) => Seller.fromJson(seller as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Seller {
  final String sellerId;
  final String sellerName;
  final String sellerImage;
  final List<Modal> modals; // Changed to List<Modal>

  Seller({
    required this.sellerId,
    required this.sellerName,
    required this.sellerImage,
    required this.modals,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      sellerId: json['sellerId'] as String,
      sellerName: json['sellerName'] as String,
      sellerImage: json['sellerImage'] as String,
      modals: (json['modals'] as List<dynamic>) // Parse modals as a list
          .map((modal) => Modal.fromJson(modal as Map<String, dynamic>))
          .toList(),
    );
  }
}
