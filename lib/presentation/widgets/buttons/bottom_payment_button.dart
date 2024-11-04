// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../intro/pages/cart/testcase/cart_provider.dart';

// class BottomPaymentButton extends StatelessWidget {
//   const BottomPaymentButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var cartProvider;
//     return Consumer<CartProvider>(builder: (context, cartProvider, child) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: cartProvider.items.map((item) {
//           return ListTile(
//             title: Text(item.product.name),
//             subtitle: Text('Số lượng: ${item.quantity}'),
//             trailing: Text(
//               // '${(item.product.price * item.quantity).toStringAsFixed(3)} đ',
//               '${(item.product.price * item.quantity)} đ',
//             ),
//           );
//         }).toList(),
//       );
//     });
//   }
// }
