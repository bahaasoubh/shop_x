import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shopx/core/api/ApiUrl.dart';
import 'package:shopx/features/shop/data/Product.dart';
import 'package:shopx/features/shop/data/ProductsResponseModel.dart';

class DioHelper {
  static Dio _dio;

  static Dio getdio() {
    if (_dio == null) {
      _dio = Dio();
    }
    return _dio;
  }
}

class Network {

  static Future<List<Product>> fetchProducts() async {
    Product products;

    Dio dio = DioHelper.getdio();
    Response response = await dio.get(
        ApiUrl.Products);
    print("dataaaaaaaaaaaaa ${response.data}");

    return (response.data as List)
        .map((x) => Product.fromJson(x))
        .toList();
    // return products;
  }

}
