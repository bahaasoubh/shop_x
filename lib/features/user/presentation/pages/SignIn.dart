import 'package:flutter/material.dart';
import 'package:shopx/core/constants/AppAssets.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopx/features/shop/presentation/pages/ViewAllProducts.dart';
import 'package:shopx/features/user/presentation/pages/ForgetPassword.dart';
import 'package:shopx/features/user/presentation/pages/SignUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSeen = true;

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
              child:  Stack(
                  children: [
                    Container(
                      height: h * 0.53,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.SingIn),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
                        height: h * 0.537,
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
                              padding: EdgeInsets.symmetric(vertical: h * 0.05),
                              child: Text(
                                'sign in'.tr().toString(),
                                style: TextStyle(
                                    color: AppColors.Black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.Red,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: AppColors.Red,
                                  ),
                                  hintText: 'Name'.tr().toString(),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.Grey300))),
                            ),
                            SizedBox(height: h * 0.03),
                            TextFormField(
                              obscureText: isSeen,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:AppColors.Red,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color:AppColors.Red,
                                ),
                                hintText: 'password'.tr().toString(),
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
                                    color:AppColors.Red,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    'forget password'.tr().toString(),
                                    style: TextStyle(color: AppColors.Red),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => ForgotPassword(),
                                      ),
                                    );
                                  },
                                ),
                                InkWell(
                                  child: Text(
                                    'sign up'.tr().toString(),
                                    style: TextStyle(
                                        color:AppColors.Black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => Signup()));
                                  },
                                )
                              ],
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
                            color:AppColors.Grey, shape: BoxShape.circle),
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewAllProducts()));
                          },
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color:AppColors.White,
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
