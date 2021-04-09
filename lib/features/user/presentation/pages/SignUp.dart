import 'package:flutter/material.dart';
import 'package:shopx/core/constants/AppAssets.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopx/features/shop/presentation/pages/ViewAllProducts.dart';
import 'package:shopx/features/user/presentation/pages/SignIn.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isSeen = false;
  bool isSeen2 = false;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: h,
            width: w,
            child: Stack(children: [
              Container(
                height: h * 0.40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.SignUp),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
                  height: h * 0.6,
                  width: w,
                  decoration: BoxDecoration(
                      color: AppColors.White,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.05),
                          child: Text(
                            'sign up'.tr().toString(),
                            style: TextStyle(
                              color: AppColors.Black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Full name'.tr().toString(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:AppColors.Red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextFormField(
                          obscureText: isSeen,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.Red,
                              ),
                            ),
                            hintText: 'Enter Password'.tr().toString(),
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
                                )),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextFormField(
                          obscureText: isSeen2,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.Red,
                              ),
                            ),
                            hintText: 'confirm password'.tr().toString(),
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
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'already have an account?'.tr().toString(),),
                            InkWell(
                                child: Text(
                                  'sign in'.tr().toString(),
                                  style: TextStyle(color: AppColors.Red),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ));
                                })
                          ],
                        )
                      ]),
                ),
              ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: w * 0.15,
                    width: w * 0.15,
                    decoration: BoxDecoration(
                      color: AppColors.Grey500,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                     onPressed: (){
                       Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                               builder: (context) => ViewAllProducts()));
                     },
                      icon:Icon(Icons.arrow_forward_outlined,
                      color: AppColors.White,
                    ),
                  ),),
                ),

            ]),
          ),
        ]),
      ),
    );
  }
}
