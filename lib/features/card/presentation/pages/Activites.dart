import 'package:flutter/material.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:shopx/core/constants/AppStyles.dart';
import 'package:shopx/features/card/data/CartModel.dart';
import 'package:shopx/features/shop/data/Product.dart';
import 'package:shopx/features/shop/data/ProductCart.dart';
import 'package:shopx/features/shop/presentation/pages/ViewAllProducts.dart';

class MyActivites extends StatefulWidget {

  @override
  _MyActivitesState createState() => _MyActivitesState();
}

class _MyActivitesState extends State<MyActivites> {
  Product product;
  List<ProductCart> products;
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ViewAllProducts()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: AppColors.Red,
        title: Text(
          "My Activities",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              height: h * 0.8,
              width: w,
              child: ListView.builder(
                  itemBuilder: (context, i) {
                    return Material(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 40.0,
                              backgroundImage:
                                  NetworkImage(products[i].product.image),
                            ),
                            subtitle: Text(
                              "${products[i].product.price.toString()}\$",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.RedAccent),
                            ),
                            title: Text(
                              products[i].product.title,style: TextStyle(fontSize: 13),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                 CartModel.changeStatus2(i);


                                });
                              },
                              icon: products[i].isCheck
                                  ? Icon(
                                      Icons.star_border,
                                    )
                                  : Icon(Icons.star),
                              color: AppColors.RedAccent,
                            ),
                          ),
                          Divider(
                            color: AppColors.PGrey,
                            height: 2.0,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: products.length),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    products = CartModel.product;
    super.initState();
  }
}
