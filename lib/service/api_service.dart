import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_method.dart';
import 'package:http/http.dart' as http;
import 'package:renti_user/core/global/api_authorization_response_model.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';

class ApiClient extends GetxService{


  ApiClient();
  
  Future<ApiResponseModel> responseRequest(
    String uri, 
    String responseMethod,
    Map<String, dynamic>? params, 
    {bool passHeader = false, bool isOnlyAcceptType = false}) async{
    
    Uri url = Uri.parse(uri);
    http.Response response;

    try {
      if (responseMethod == ApiResponseMethod.postMethod) {
        if(passHeader){
          //initToken();
          if(isOnlyAcceptType){
            response = await http.post(url, body: params,headers: {
              "Accept": "application/json",
            });
          }
          else{
            response = await http.post(url, body: params,headers: {
              "Content-Type": "application/json",
              "Authorization": "$tokenType $token"
            });
          }
        }
        else{
          response = await http.post(url, body: params);
        }

      }
      else if (responseMethod == ApiResponseMethod.postMethod) {
        if(passHeader){
          // initToken();
          response = await http.post(
            url,
            body: params,
            headers: {
              "Content-Type": "application/json",
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
      else if (responseMethod == ApiResponseMethod.deleteMethod) {
        response = await http.delete(url);
      } else if (responseMethod == ApiResponseMethod.updateMethod) {
        response = await http.patch(url);
      } else {
        if(passHeader){
          //initToken();
          response = await http.get(
            url, headers: {
            "Content-Type": "application/json",
            "Authorization": "$tokenType $token"
          });
        }else{
          response = await http.get(
            url,
          );
        }
      }
      if (response.statusCode == 200) {
        try{
          ApiAuthorizationResponseModel model = ApiAuthorizationResponseModel.fromJson(jsonDecode(response.body));
          if(model.remark == 'unauthenticated') {
            Get.offAllNamed(AppRoute.signInScreen);
          }
        }catch(e){
          e.toString();
        }
        return ApiResponseModel(200, "Success", response.body);
      }
      else if (response.statusCode == 401) {
        Get.offAllNamed(AppRoute.signInScreen);
        return ApiResponseModel(401, "Unauthorized", response.body);
      } else if (response.statusCode == 500) {
        return ApiResponseModel(500, "Server Error", response.body);
      } else {
        return ApiResponseModel(499, "Something went wrong", response.body);
      }
    } on SocketException {
      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response", '');
    } catch (e) {
      return ApiResponseModel(499, "Something went wrong", '');
    }
  }

  String token='';
  String tokenType='';

  /*initToken() {
    if (sharedPreferences.containsKey(SharedPreferenceHelper.accessTokenKey)) {
      String? t =
      sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey);
      String? tType =
      sharedPreferences.getString(SharedPreferenceHelper.accessTokenType);
      token = t ?? '';
      tokenType = tType ?? 'Bearer';
    } else {
      token = '';
      tokenType = 'Bearer';
    }
  }*/
}