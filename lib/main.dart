import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopx/features/shop/presentation/pages/ViewAllProducts.dart';
import 'package:shopx/features/splash/presentation/pages/Splash.dart';
import 'package:sizer/sizer_util.dart';
import 'core/constants.dart';
import 'core/constants/AppIcons.dart';
import 'core/utils/SharedPreferences/SharedPreferencesHelper.dart';
import 'core/constants/AppColors.dart';
import 'core/constants/AppTheme.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();

  String lang= AppSharedPreferences.lang;
  if(lang == null)
  {
    AppSharedPreferences.lang =DEFAULT_LANG;
    lang = DEFAULT_LANG;
  }

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.Red,
    statusBarBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
        (val) {
      runApp( EasyLocalization(
          startLocale: Locale(lang),
          supportedLocales: [Locale(LANG_AR) ,Locale(LANG_EN),Locale(LANG_ES) ,Locale(LANG_FR)],
          path: 'assets/lang',
          saveLocale: true,
          fallbackLocale: Locale(LANG_AR),
          child: Shop()),
      );

    },
  );
}

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Spalsh(),
    );
  }
}
