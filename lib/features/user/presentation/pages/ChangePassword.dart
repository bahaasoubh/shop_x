import 'package:flutter/material.dart';
import 'package:shopx/core/constants/AppAssets.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopx/features/shop/presentation/pages/ViewAllProducts.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isSeen = true;
  bool isSeen2 = true;
  bool isSeen3 = true;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h,
                width: w,
                child: Stack(
                  children: [
                    Container(
                      height: h * 0.55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.ChangePassword),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
                        height: h * 0.5,
                        width: w,
                        decoration: BoxDecoration(
                            color: AppColors.White,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: h * 0.02),
                              child: Text(
                                'Change Password'.tr(),
                                style: TextStyle(
                                    color: AppColors.Black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            TextFormField(
                              obscureText: isSeen3,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.Red,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColors.Red,
                                ),
                                hintText: 'Old Password'.tr(),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSeen3 = !isSeen3;
                                    });
                                  },
                                  child: isSeen3
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: AppColors.Red,
                                        )
                                      : Icon(
                                          Icons.remove_red_eye,
                                          color: AppColors.Red,
                                        ),
                                ),
                              ),
                            ),
                            TextFormField(
                              obscureText: isSeen,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.Red,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColors.Red,
                                ),
                                hintText: 'New Password'.tr(),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSeen = !isSeen;
                                    });
                                  },
                                  child: isSeen
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: AppColors.Red,
                                        )
                                      : Icon(
                                          Icons.remove_red_eye,
                                          color: AppColors.Red,
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.02),
                            TextFormField(
                              obscureText: isSeen2,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.Red,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColors.Red,
                                ),
                                hintText: 'Confirm New Password'.tr(),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSeen2 = !isSeen2;
                                    });
                                  },
                                  child: isSeen2
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: AppColors.Red,
                                        )
                                      : Icon(
                                          Icons.remove_red_eye,
                                          color: AppColors.Red,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: w * 0.15,
                        width: w * 0.15,
                        decoration: BoxDecoration(
                            color: AppColors.Red, shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewAllProducts()));
                          },
                          icon: Icon(
                            Icons.arrow_forward_outlined,
                            color: AppColors.White,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
