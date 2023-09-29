import 'dart:convert';

import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/view/screens/rent_request_payment/rent_request_model/rent_request_model.dart';

class RentRequestRepo {
  ApiService apiService;
  RentRequestRepo({required this.apiService});

  Future<ApiResponseModel> rentRequestRepo() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.rentRequestEndPont}6513adeadf18a894ef8627f5";

    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, dynamic> params = {
      "product": {
        "name": "Test Product",
        "price": 10000
      },
      "token": {
        "email": "farvez1@gmail.com",
        "id": "tok_visa"
      }
    };

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);
    print("Srabon "+responseModel.responseJson);
    print("Srabon "+uri);
    print("Srabon "+responseModel.statusCode.toString());
    return responseModel;
  }
}