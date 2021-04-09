import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:shopx/features/card/data/CartModel.dart';
import 'package:shopx/features/card/presentation/pages/Activites.dart';
import 'package:shopx/features/shop/data/Product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopx/features/shop/data/ProductCart.dart';

class ViewProduct extends StatelessWidget {
  final Product product;

   static int num = 0;

  const ViewProduct({this.product});



  @override
  Widget build(BuildContext context) {
    print(product.price);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [




              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: h * 0.30,
                  width: w,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: MaterialButton(
                              color: AppColors.RedAccent,
                              child: Text("Add to Cart".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                              onPressed: (){
                                print(num);
                                print(product.toString());
                                CartModel.addProductCart(ProductCart(product: product,count: num,isCheck: true));
                                CartModel.getAll();

                              }


                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),

                      Container(
                        height: 50,
                        width: 100,

                        decoration: BoxDecoration(

                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            " ${product.price.toString()} \$",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 125,left: 8),
                    child: Text(
                      "description:".tr(),
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(product.description),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: AppColors.RedAccent,
                                borderRadius: (BorderRadius.all(
                                  Radius.circular(25),
                                ))),
                            child: counter(context),
                          ),
                          Expanded(child: myWidget(context)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    ));
  }

  Widget myWidget(BuildContext context) {
    bool isLike = true;

    return StatefulBuilder(builder: (context, StateSetter setState) {
      return IconButton(
        color: Colors.redAccent,
        onPressed: () {
          setState(() {
            isLike = !isLike;
            if(isLike==false){
              CartModel.addProductCart(ProductCart(product: product,count: num,isCheck: true));
              CartModel.getAll();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyActivites()));
            }
          });
        },
        icon: isLike ? Icon(Icons.star_border) : Icon(Icons.star),
        iconSize: 30,
      );
    });
  }
}

Widget counter(BuildContext context) {
  return StatefulBuilder(builder: (context, StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            setState(
              () {
                ViewProduct.num++;
              },
            );
          },
        ),
        Text(
          "${ViewProduct.num}",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        IconButton(
          icon: Icon(
            Icons.remove,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              if (ViewProduct.num > 0) ViewProduct.num--;
            });
          },
        ),
      ],
    );
  });
}
