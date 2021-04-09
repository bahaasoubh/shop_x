import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:shopx/features/shop/presentation/pages/ViewAllProducts.dart';
import 'package:easy_localization/easy_localization.dart';
class MyPurchases extends StatefulWidget {

  @override
  _MyPurchasesState createState() => _MyPurchasesState();

}

class _MyPurchasesState extends State<MyPurchases>  {

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Red,

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
Center(

  child:  Image.network("https://c.tenor.com/gq664hSqBJcAAAAC/good-choice-good-things.gif"),
),

          Align(
            alignment: Alignment.bottomCenter,
            child:  SizedBox(
              width: 300,
              height: 70,
              child: MaterialButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ViewAllProducts()));
                },
                color: AppColors.RedAccent,
                child: Text("Keep Shopping".tr(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            )
          )
          ],

        ),
      ),
    );

  }

}

