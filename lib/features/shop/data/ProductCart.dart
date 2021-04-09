import 'package:shopx/features/shop/data/Product.dart';

class ProductCart{
  Product product;
  int count;
  bool isCheck;
  String price;

  ProductCart({this.product, this.count, this.isCheck,this.price});
}