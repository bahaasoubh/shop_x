import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:shopx/features/card/data/CartModel.dart';
import 'package:shopx/features/card/presentation/pages/My%20Purchases.dart';
import 'package:shopx/features/card/presentation/widgets/slidable.dart';
import 'package:shopx/features/shop/data/Product.dart';
import 'package:shopx/features/shop/data/ProductCart.dart';
import 'package:shopx/features/shop/presentation/pages/ViewAllProducts.dart';
import 'package:shopx/features/shop/presentation/pages/ViewProduct.dart';
import 'package:easy_localization/easy_localization.dart';

class Cart extends StatefulWidget {


  @override
  _CartState createState() => _CartState();

}

class _CartState extends State<Cart> {
  void dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    setState(() {
      products.removeAt(index);
    });

  }

  Product product;
  List<ProductCart> products;
  int count=0;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Red,
        title: Text("My Cart".tr()),
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
                    if(products[i].isCheck==true){
                      count++;
                    }else{
                      count=0;
                    }
                    return SlidableWidget(
                      onDismissed: (action) =>
                        dismissSlidableItem(context, i, action),
                      child: Material(
                        child: Column(
                          children: [
                            ListTile(

                                leading: CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage:
                                      NetworkImage(products[i].product.image),
                                ),
                                subtitle:
                                    Text("you Asked for ${ViewProduct.num} product/s",style:TextStyle(color: AppColors.RedAccent,fontWeight: FontWeight.bold,fontSize: 12),),
                                title: Text(products[i].product.title,style: TextStyle(fontSize: 11),),

                                trailing: Checkbox(
                                  activeColor: AppColors.Red,
                                  onChanged: (v) {
                                    setState(() {
                                      CartModel.changeStatus(i);
                                    });
                                  },
                                  value: products[i].isCheck,

                                ),
                            ),
                            Divider(
                              color: AppColors.PGrey,
                              height: 2.0,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: products.length),
            ),
            MaterialButton(
              onPressed: () {
_showMyDialog();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Text(
                "Buy Now".tr(),
                style: TextStyle(color: AppColors.White),
              ),
              color: AppColors.Red,
              minWidth: w * 0.8,
            )
          ],
        ),
      ),
    );
  }
  Future<void> _showMyDialog() async {


    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {


        return AlertDialog(

          actionsOverflowButtonSpacing: 40,
          title: Text('Are You sure'.tr()),
          content: SingleChildScrollView(
            child: ListBody(

              children: <Widget>[
                Text('You want buy this product'.tr()),

              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: AppColors.RedAccent,
              child: Text('Yes'.tr(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              onPressed: () {
              setState(() {
                if(count>=1){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyPurchases()));
                }

              });

              },
            ),


            MaterialButton(
              color: AppColors.RedAccent,
              child: Text('No'.tr(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

          ],
          actionsPadding: EdgeInsets.symmetric(horizontal: 35),
        );

      },

    );
  }

  @override
  void initState() {
    products = CartModel.product;
    super.initState();
  }
}
