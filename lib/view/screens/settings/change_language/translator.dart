
import 'package:get/get.dart';
import 'package:renti_user/view/screens/settings/change_language/language_name/english.dart';
import 'package:renti_user/view/screens/settings/change_language/language_name/french.dart';
import 'package:renti_user/view/screens/settings/change_language/language_name/spanish.dart';


class Language extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en_US" : english,
    "fr_CA" : french,
    "es_MX" : spanish
  };
}