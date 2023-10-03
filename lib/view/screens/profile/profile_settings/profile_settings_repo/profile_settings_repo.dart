import 'dart:convert';
import 'dart:io';

import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:renti_user/view/screens/profile/profile_settings/profile_setting_model/profile_setting_model.dart';

class ProfileSettingsRepo{

  ApiService apiService;
  ProfileSettingsRepo({required this.apiService});

  Future<ProfileSettingsModel> updateUser({required String username, required String email, required String phoneNumber, required String address, /*required File imageFile*/}) async{

    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.profileUpdateEndPoint}/${apiService.sharedPreferences.getString(SharedPreferenceHelper.userIdKey)}";

    var request = http.MultipartRequest("POST", Uri.parse(url));

    Map<String, String> params = {
      "fullName": username,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
    };
    
    request.headers.addAll({'Authorization' : 'Bearer ${apiService.token}'});
    /*request.files.add(http.MultipartFile(
        'image',
        imageFile.readAsBytes().asStream(),
        imageFile.lengthSync(),
        filename: imageFile.path.split("/").last
    ));*/
    request.fields.addAll(params);

    http.StreamedResponse response = await request.send();
    String jsonResponse = await response.stream.bytesToString();

    ProfileSettingsModel profileSettingsModel = ProfileSettingsModel.fromJson(jsonDecode(jsonResponse));

    return profileSettingsModel;
  }
}