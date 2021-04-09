import 'package:flutter/material.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:shopx/core/constants/AppStyles.dart';


class ChangeLang extends StatelessWidget {
  final Function onPress;
  final String country;
  final String flag;

  const ChangeLang(
      {@required this.onPress, @required this.country, @required this.flag});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    // var w =MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: h * 0.02),
      child: InkWell(
        splashColor: AppColors.Red,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Change Language",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: 320,
                          child: MaterialButton(
                            color:  AppColors.Red,
                            onPressed: onPress,
                            child: Text(
                              "Change",
                              style: TextStyle(color: Colors.white),
                            ),
                            splashColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    flag,
                  ),
                  radius: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  country,
                  style:AppStyles.kTextFlagStyle ,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}