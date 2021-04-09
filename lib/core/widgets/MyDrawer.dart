import 'package:flutter/material.dart';
import 'package:shopx/core/constants/AppAssets.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:shopx/core/widgets/MyListTile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopx/features/card/presentation/pages/Cart.dart';
import 'package:shopx/features/info/presentation/pages/About.dart';
import 'package:shopx/features/info/presentation/pages/Settings.dart';
import 'package:shopx/features/user/presentation/pages/SignIn.dart';
import 'package:shopx/features/card/presentation/pages/Activites.dart';


class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                        color: AppColors.RedAccent,
                        image: DecorationImage(
                            image: AssetImage(AppAssets.Logo),  fit: BoxFit.cover)),
                  ),
                  MyListTile(
                    myicon: IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: AppColors.RedAccent,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Settings()));
                      },
                    ),
                    text: 'Settings'.tr().toString(),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    },
                  ),
                  MyListTile(
                    myicon: IconButton(

                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Cart()));
                      },
                      icon: Icon(
                        Icons.shopping_cart_rounded,
                        color: AppColors.RedAccent,
                      ),
                    ),
                    text: 'My Cart'.tr().toString(),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Cart()));
                    },
                  ),
                  MyListTile(
                    myicon: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(
                        Icons.shopping_bag,
                        color: AppColors.RedAccent,
                      ),
                    ),
                    text: 'My Purchases'.tr().toString(),
                    onTap: () {},
                  ),
                  MyListTile(
                    myicon: IconButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyActivites()));
                      },
                      icon: Icon(
                        Icons.local_activity_rounded,
                        color: AppColors.RedAccent,
                      ),
                    ),
                    text: 'My Activities'.tr().toString(),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyActivites()));
                    },
                  ),
                  MyListTile(
                    myicon: IconButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => About()));
                      },
                      icon: Icon(
                        Icons.info,
                        color: AppColors.RedAccent,
                      ),
                    ),
                    text: 'About'.tr().toString(),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => About(),
                      ));
                    },
                  ),
                ],
              ),
              MyListTile(
                myicon: IconButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                  },
                  icon: Icon(
                    Icons.logout,
                    color:AppColors.RedAccent,
                  ),
                ),
                text: 'Log Out'.tr().toString(),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => SignIn(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
