import 'package:shopx/core/utils/SharedPreferences/SharedPreferencesProvider.dart';

class AppSharedPreferences{

  //todo move these to constants
  static const KEY_ACCESS_TOKEN = "PREF_KEY_ACCESS_TOKEN";
  static const KEY_LANG = "PREF_KEY_LANG";

  static bool initialized;
  static SharedPreferencesProvider _pref;
  static init()async{
    _pref = await SharedPreferencesProvider.getInstance();

  }

  //accessToken
  static String get  accessToken  => _pref.read( KEY_ACCESS_TOKEN );

  static set accessToken(String accessToken) =>_pref.save(KEY_ACCESS_TOKEN, accessToken);

  static bool get hasAccessToken => _pref.contains(KEY_ACCESS_TOKEN);

  //language
  static String get  lang  => _pref.read( KEY_LANG );

  static set lang(String lang) =>_pref.save(KEY_LANG, lang);

}
