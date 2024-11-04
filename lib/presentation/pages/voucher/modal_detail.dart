// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vouchee/core/configs/theme/app_color.dart';
import 'package:vouchee/model/modal.dart';

import 'package:vouchee/networking/api_request.dart';
import 'package:vouchee/presentation/widgets/buttons/basic_button.dart';

class ModalsDetailPage extends StatefulWidget {
  final Modal modal;
  const ModalsDetailPage({
    super.key,
    required this.modal,
  });

  @override
  State<ModalsDetailPage> createState() => _ModalsDetailPageState();
}

class _ModalsDetailPageState extends State<ModalsDetailPage> {
  final CartService cartService = CartService();
  late Future<List<Modal>> futureModal;
  final GetAllModals apiService = GetAllModals();

  @override
  void initState() {
    super.initState();
    futureModal = apiService.fetchModal(); // Fetch data on init
  }

  int quantity = 1;
  // List<CartItem> cart = [];
  void incrementCount() {
    setState(() {
      quantity++;
    });
  }

  void decrementCount() {
    if (quantity > 1) {
      setState(() {
        quantity--; // Decrement Voucher count
      });
    }
  }

  Future<void> _addToCart(String voucherId, String id) async {
    bool success = await cartService.addToCart(voucherId, id);
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added to cart successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add to cart')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('modals detail'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: widget.modal.imageUrl.isNotEmpty
                    ? Image.network(
                        widget.modal.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 140,
                      )
                    : Placeholder(fallbackHeight: 250, fallbackWidth: 100),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.modal.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${widget.modal.sellPrice.toInt()} đ',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Ngày hết hạn: ',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.grey,
                          ),
                        ),
                        Text(
                          widget.modal.endDate.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    // Text(widget.voucher.description.toString()),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Số lượng còn lại:',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.grey,
                            )),
                        SizedBox(
                          width: 4,
                        ),
                        // ...widget.modal.address.map((address) => Text(
                        //       '📌 ${address.name} ',
                        //       style: TextStyle(fontSize: 14),
                        //     )),
                        Text(
                          widget.modal.stock.toInt().toString(),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                _addToCart(widget.modal.id, 'your_user_id');
                              },
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  side: const BorderSide(
                                    width: 2.0,
                                    color: AppColor.primary,
                                  )),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: Text(
                                  'Thêm vào giỏ',
                                  style: TextStyle(
                                      color: AppColor.secondary, fontSize: 12),
                                ),
                              )),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: AppColor.secondary, width: 2),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  iconSize: 18,
                                  onPressed: decrementCount,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 25,
                                alignment: Alignment.center,
                                child: Text(
                                  '$quantity',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: AppColor.secondary, width: 2),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 18,
                                  onPressed: incrementCount,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    BasicButton(
                      onPressed: () {
                        // Provider.of<CartProvider>(context, listen: false)
                        //     .addToCart(widget.voucher);
                      },
                      textColor: AppColor.white,
                      title: "Mua ngay",
                      font: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
