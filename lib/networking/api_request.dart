import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vouchee/model/cart.dart';
import 'package:vouchee/model/category.dart';
import 'package:vouchee/model/modal.dart';
import 'package:vouchee/model/near_voucher.dart';
import 'package:vouchee/model/voucher.dart';

class GetAllVouchers {
  final String apiUrl =
      'https://api.vouchee.shop/api/v1/voucher/get_all_voucher';

  Future<List<Voucher>> fetchVouchers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<dynamic> results = jsonData['results'];

        // Check the structure of results

        return results.map((voucher) => Voucher.fromJson(voucher)).toList();
      } else {
        throw Exception('Không tải được sản phẩm');
      }
    } catch (e) {
      print(e);
      throw Exception('Không tải được sản phẩm: $e');
    }
  }
}

class GetAllModals {
  final String apiUrl = 'https://api.vouchee.shop/api/v1/modal/get_all_modal';

  Future<List<Modal>> fetchModal() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<dynamic> results = jsonData['results'];
        // Check the structure of results

        return results.map((modal) => Modal.fromJson(modal)).toList();
      } else {
        throw Exception('Không tải được sản phẩm');
      }
    } catch (e) {
      print(e);
      throw Exception('Không tải được sản phẩm: $e');
    }
  }
}

class GetAllCategory {
  final String apiUrl =
      'https://api.vouchee.shop/api/v1/category/get_all_category';

  Future<List<Category>> fetchCategory() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> results = jsonData['results'];
      // return jsonData.map((json) => Category.fromJson(json)).toList();
      return results.map((category) => Category.fromJson(category)).toList();
    } else {
      throw Exception('Không tải được sản phẩm');
    }
  }
}

class GetNearVoucher {
  final String apiUrl =
      'https://api.vouchee.shop/api/v1/voucher/get_nearest_vouchers';

  Future<List<NearVoucher>> fetchNearVouchers(
      {required double lat, required double lon}) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?lon=$lon&lat=$lat'));
      print('Fetching vouchers from: $apiUrl?lon=$lon&lat=$lat');

      if (response.statusCode == 200) {
        // List<dynamic> results = jsonData['results'];
        // return results.map((voucher) => Voucher.fromJson(voucher)).toList();
        final List<dynamic> jsonData = json.decode(response.body)['results'];
        print(response.body);
        return jsonData.map((json) => NearVoucher.fromJson(json)).toList();
      } else {
        throw Exception('Không tải được sản phẩm');
      }
    } catch (e) {
      throw Exception('Không tải được sản phẩm');
    }
  }
}

// class GetToken {
//   final String apiUrl =
//       'https://api.vouchee.shop/api/v1/auth/login_with_google_token?token=';

//   Future<List<Voucher>> fetchVouchers() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       List<dynamic> results = jsonData['results'];
//       return results.map((voucher) => Voucher.fromJson(voucher)).toList();
//     } else {
//       throw Exception('Không tải được sản phẩm');
//     }
//   }
// }

// class GetCartItems {
//   final String apiUrl = 'https://api.vouchee.shop/api/v1/cart/get_all_item';

//   Future<List<Cart>> fetchCart() async {
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       final List<dynamic> jsonData = json.decode(response.body);
//       print(response.body);
//       if (response.statusCode == 200) {
//         return jsonData.map((json) => Cart.fromJson(json)).toList();
//       } else {
//         throw Exception('Không tải được sản phẩm 1 ');
//       }
//     } catch (e) {
//       throw Exception('Không tải được sản phẩm 2');
//     }
//   }
// }

class GetCartItems {
  final String apiUrl = 'https://api.vouchee.shop/api/v1/cart/get_all_item';

  Future<List<Cart>> fetchCart() async {
    final url = Uri.parse(apiUrl);
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json', 'Authorization': auth},
    );
    try {
      // final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<dynamic> results = jsonData;

        // Check the structure of results
        // if (jsonData is Map<String, dynamic> && jsonData is List) {
        return results.map((cart) => Cart.fromJson(cart)).toList();
        // } else {
        //   throw Exception('Invalid JSON structure');
        // }
      } else {
        throw Exception('Không tải được sản phẩm');
      }
    } catch (e) {
      print(e);
      throw Exception('Không tải được sản phẩm: $e');
    }
  }
}

final String auth =
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjZXJ0c2VyaWFsbnVtYmVyIjoiZGVlZTk2MzgtZGEzNC00MjMwLWJlNzctMzQxMzdhYTVmY2ZmIiwiZW1haWwiOiJhZHZvdWNoZWVAZ21haWwuY29tIiwiYWN0b3J0IjoiQURNSU4gMSIsInJvbGUiOiJBRE1JTiIsIm5iZiI6MTczMDY0OTE3NSwiZXhwIjoxNzQ4NjQ5MTc1LCJpYXQiOjE3MzA2NDkxNzV9.LtxHdUnFkOe5Nz470wWn4DN4i36dXAoYDz8shDqVoRc'; // If your API requires auth

class CartService {
  final String baseUrl = 'https://api.vouchee.shop/api/v1/';

  Future<bool> addToCart(String voucherId, String id) async {
    final url = Uri.parse('$baseUrl/cart/add_item');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json', 'Authorization': auth},
        body: jsonEncode({
          'id': id,
          'voucherId': voucherId,
        }),
      );

      if (response.statusCode == 200) {
        return true; // Successfully added to cart
      } else {
        print('Failed to add to cart: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
