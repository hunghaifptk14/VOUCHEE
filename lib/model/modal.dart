// ignore_for_file: public_member_api_docs, sort_constructors_first
class Modal {
  final String id;
  final String voucherId;
  final String title;
  final double originalPrice;
  final double sellPrice;
  final double salePrice;
  final double percentDiscount;
  final String imageUrl;
  final double index;
  final String startDate;
  final String endDate;
  final num stock;

  Modal({
    required this.id,
    required this.voucherId,
    required this.title,
    required this.originalPrice,
    required this.sellPrice,
    required this.salePrice,
    required this.percentDiscount,
    required this.imageUrl,
    required this.index,
    required this.startDate,
    required this.endDate,
    required this.stock,
  });

  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'id': id,
      'voucherId': voucherId,
      'title': title,
      'originalPrice': originalPrice,
      'sellPrice': sellPrice,
      'salePrice': salePrice,
      'percentDiscount': percentDiscount,
      'imageUrl': imageUrl,
      'stock': stock,
    };
  }

  factory Modal.fromJson(Map<String, dynamic> json) {
    return Modal(
      id: json['id'],
      voucherId: json['voucherId'],
      title: json['title'],
      percentDiscount: (json['percentDiscount'] ?? 0).toDouble(),
      originalPrice: (json['originalPrice'] ?? 0).toDouble(),
      sellPrice: (json['sellPrice'] ?? 0).toDouble(),
      salePrice: (json['salePrice'] ?? 0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      stock: (json['stock'] ?? 0).toDouble(),
      index: (json['index'] ?? 0).toDouble(),
      endDate: json['endDate'] ?? '',
      startDate: json['startDate'] ?? '',
    );
  }
}
