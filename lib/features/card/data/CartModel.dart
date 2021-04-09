import 'package:shopx/features/shop/data/Product.dart';
import 'package:shopx/features/shop/data/ProductCart.dart';

class CartModel {
  static List<ProductCart> product = [];


  static addProductCart(ProductCart p) {
    print("addProductCart");
    product.add(p);
  }


  static getAll() {
    print("getAll");
    return product;
  }


  static changeStatus(int position) {
    print("changeStatus");
    product[position].isCheck =
    product[position].isCheck == true ? false : true;
  }

  static changeStatus2(int position) {
    print("changeStatus");
    product[position].isCheck =
    product[position].isCheck == true ? false : true;
  }
}
