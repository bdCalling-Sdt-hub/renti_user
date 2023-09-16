import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_method.dart';
import 'package:http/http.dart' as http;
import 'package:renti_user/core/global/api_authorization_response_model.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetxService{

  SharedPreferences sharedPreferences;
  ApiClient({required this.sharedPreferences});

  Future<ApiResponseModel> request(
      String uri,
      String method,
      Map<String, dynamic>? params,
      {bool passHeader=false,
        bool isOnlyAcceptType=false,}) async {

    Uri url=Uri.parse(uri);
    http.Response response;

    try {

      if (method == ApiResponseMethod.postMethod) {
        if(passHeader){
          initToken();
          response = await http.post(
              url,
              body: params,
              headers: {
                "Accept": "application/json",
                "Authorization": "$tokenType $token"
          });
        }
        else{
          response = await http.post(
            url,
            body: params
          );
        }
      }
      if (method == ApiResponseMethod.deleteMethod) {
        response = await http.delete(url);
      }
      if (method == ApiResponseMethod.updateMethod) {
        response = await http.patch(url);
      }
      else {

        if(passHeader){
          initToken();
          response = await http.get(
              url,headers: {
            "Accept": "application/json",
            "Authorization": "$tokenType $token"
          });

        }else{
          response = await http.get(
            url,
          );
        }
      }

      print(url.toString());
      print(response.body);


      if (response.statusCode == 200) {
        try{
          ApiAuthorizationResponseModel authorizationResponseModel = ApiAuthorizationResponseModel.fromJson(jsonDecode(response.body));
          if(authorizationResponseModel.message == 'Unauthenticated' ){
            sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
            sharedPreferences.remove(SharedPreferenceHelper.token);
            Get.offAllNamed(AppRoute.signInScreen);
          }
        }catch(e){
          e.toString();
        }

        return ApiResponseModel(200, 'Success', response.body);
      }
      else if (response.statusCode == 401) {
        sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
        Get.offAllNamed(AppRoute. signInScreen);
        return ApiResponseModel(401, "Unauthorized".tr, response.body);
      } else if (response.statusCode == 500) {
        return ApiResponseModel(500, "Internal Server Error".tr, response.body);
      } else {
        return ApiResponseModel(499, "Something went wrong".tr, response.body);
      }
    } on SocketException {
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request".tr, '');
    } catch (e) {
      return ApiResponseModel(499, "Client Closed Request".tr, '');
    }
  }

  String token = '';
  String tokenType = '';

  initToken() {
    if (sharedPreferences.containsKey(SharedPreferenceHelper.accessTokenKey)) {
      String? t = sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey);
      String? tType = sharedPreferences.getString(SharedPreferenceHelper.accessTokenType);
      token = t ?? '';
      tokenType = tType ?? 'Bearer';
    } else {
      token = '';
      tokenType = 'Bearer';
    }
  }
}