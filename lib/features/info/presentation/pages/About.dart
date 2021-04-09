import 'package:flutter/material.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:shopx/core/constants/AppIcons.dart';
import 'package:shopx/core/constants/AppStyles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:share/share.dart';
import 'package:shopx/core/widgets/MyDrawer.dart';
import 'package:shopx/features/shop/presentation/pages/ViewAllProducts.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
         onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllProducts())) ;
         },
         icon: Icon(Icons.arrow_back_rounded),
       ),
        backgroundColor: AppColors.Red,
        title: Text(
          "About".tr(),
          style: TextStyle(color: AppColors.White),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Card(
                margin:
                EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.02),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.03, vertical: h * 0.02),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.RedAccent,
                            radius: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: w * 0.04),
                            child: Text(
                              "User".tr(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.04, vertical: h * 0.02),
                      child: Row(
                        children: [
                          IconButton(icon: AppIcons.Info, onPressed: () {}),
                          Padding(
                            padding: EdgeInsets.only(left: w * 0.06),
                            child: Column(
                              children: [
                                Text(
                                  "Version".tr(),
                                  style: AppStyles.kCardTextStyle,
                                ),
                                Text(
                                  "1.0",
                                  style: TextStyle(color: AppColors.PGrey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.Grey,
                      thickness: 1.5,
                      indent: 27,
                      endIndent: 27,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.04, vertical: h * 0.02),
                      child: Row(
                        children: [
                          IconButton(icon: AppIcons.Share, onPressed: () {
                            final String url ="http//path my app on google play or app store ";
                            final RenderBox box =context.findRenderObject();
                            Share.share(url,sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
                          }),
                          Padding(
                            padding: EdgeInsets.only(left: w * 0.06),
                            child: Text(
                              "Share This App".tr(),
                              style: AppStyles.kCardTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.Grey,
                      thickness: 1.5,
                      indent: 27,
                      endIndent: 27,
                      height: 20,
                    ),
                 Contact(context),



                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
Widget Contact (BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  bool visibilityLang = false;
  bool visibilityTheme = false;
  bool iconLang = false;
  bool iconTheme = false;

  return StatefulBuilder(builder: (context, StateSetter setState) {
    void _changed(bool visibility, String field) {
      setState(() {
        if (field == "Lang") {
          visibilityLang = visibility;
          visibilityTheme = false;
          iconTheme = false;
        }
        if (field == "Theme") {
          visibilityTheme = visibility;
          visibilityLang = false;
          iconLang = false;
        }
      });
    }
    return Column(
        children: [

          InkWell(
            onTap: () {
              iconLang = !iconLang;
              visibilityLang
                  ? _changed(false, "Lang")
                  : _changed(true, "Lang");
            },

              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [

                   Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.25),
  child:   Text("Contact us".tr(),style: AppStyles.kCardTextStyle,),
),

                  IconButton(alignment: Alignment.centerRight,
                    onPressed: () {
                      iconLang = !iconLang;
                      visibilityLang
                          ? _changed(false, "Lang")
                          : _changed(true, "Lang");
                    },
                    icon: Icon(iconLang
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            ),



          visibilityLang
              ? Container(

            child: Column(
              children: [

                Padding(
padding: EdgeInsets.symmetric(
horizontal: w * 0.04, vertical: h * 0.02),
child:InkWell(
  onTap: (){
    launch("tel://011-3226747");
  },
    child:Row(
children: [
IconButton(icon: AppIcons.phone, onPressed: () {
launch("tel://011-3226747");
}),
Padding(
padding: EdgeInsets.only(left: w * 0.06),
child: Text(
"Telephone".tr(),
style: AppStyles.kCardTextStyle,
),
),



],
    )
),
),
                Divider(
                  thickness: 1.5,
                  height: 0,
                  endIndent: 30.0,
                  indent: 30.0,
                ),
    Padding(
    padding: EdgeInsets.symmetric(
    horizontal: w * 0.04, vertical: h * 0.02),child: InkWell(
      onTap: (){
        launch("tel://0934421262");
      },
      child: Row(
                  children: [
                    IconButton(icon: AppIcons.mobile, onPressed: () {
                      launch("tel://0934421262");

                    }),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.06),
                      child: Text(
                        "Mobile".tr(),
                        style: AppStyles.kCardTextStyle,
                      ),
                    ),
                  ],
                ),
    ),
    ),
                Divider(
                  thickness: 1.5,
                  height: 0,
                  endIndent: 30.0,
                  indent: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.04, vertical: h * 0.02),child: InkWell(
                  onTap: (){
                    launch("http://www.facebook.com/bhaa.sobh/");
                  },
                  child: Row(
                    children: [
                      IconButton(icon: AppIcons.facebook, onPressed: () {
                        launch("http://www.facebook.com/bhaa.sobh/");
                      }),
                      Padding(
                        padding: EdgeInsets.only(left: w * 0.06),
                        child: Text(
                          "Facebook",
                          style: AppStyles.kCardTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                ),

              ],),


          ) : Container(),
        ]
    );
  });
}

