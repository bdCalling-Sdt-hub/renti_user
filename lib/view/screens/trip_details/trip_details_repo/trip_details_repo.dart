import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class TripDetailsRepo{

  ApiService apiService;
  TripDetailsRepo({required this.apiService});

  Future<ApiResponseModel> fetchData({required String rentID}) async{

    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.rentDetailsEndPont}/$rentID";
    print("Url: $url");

    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);

    return responseModel;
  }

/*  Future<ApiResponseModel> makePaymentRepo({required String rentID,required String productPrice,required String productName}) async{

    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.rentRequestPaymentEndPoint}/$rentID";
    print("Url: $url");
    String requestMethod = ApiResponseMethod.postMethod;
    Map<String, dynamic> params = {
      "product": {
        "name": productName,
        "price": productPrice
      },
      "token": {
        "email": apiService.sharedPreferences.getString(SharedPreferenceHelper.email),
        "id": "tok_visa"
      }
    };


    ApiResponseModel responseModel = await apiService.request(url, requestMethod, params, passHeader: true);

    return responseModel;
  }*/
}