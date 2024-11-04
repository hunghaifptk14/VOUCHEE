// import 'package:flutter/material.dart';
// import 'package:vouchee/core/configs/theme/app_color.dart';
// import 'package:vouchee/model/cart.dart';
// import 'package:vouchee/model/modal.dart';
// import 'package:vouchee/networking/api_request.dart';

// class CartList extends StatefulWidget {
//   const CartList({super.key});

//   @override
//   State<CartList> createState() => _CartListState();
// }

// class _CartListState extends State<CartList> {
//   late Future<List<Cart>> futureCart;
//   final GetCartItems apiService = GetCartItems();

//   @override
//   void initState() {
//     super.initState();
//     futureCart = apiService.fetchCart();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Cart>>(
//         future: futureCart,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No item found'));
//           }
         
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               Cart cart = snapshot.data![index];
//               return Card(
//                 margin: EdgeInsets.all(8),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(cart.sellers.,
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold)),
//                       SizedBox(height: 4),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: seller.modals.length,
//                         itemBuilder: (context, modalIndex) {
//                           Modal modal = seller.modals[modalIndex];
//                           return ListTile(
//                             title: Text(modal.title),
//                             subtitle: Text('Price: ${modal.salePrice}'),
//                             leading: Image.network(modal.imageUrl,
//                                 width: 50, height: 50, fit: BoxFit.cover),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         });
//   }
// }
