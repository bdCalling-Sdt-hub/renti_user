import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';

class RentRequestPaymentRepo{

  ApiService apiService;
  RentRequestPaymentRepo({required this.apiService});

  Future<ApiResponseModel> rentRequestPaymentResponse({required String productId,required String productPrice, required String productName}) async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.rentRequestPaymentEndPoint}$productId";

    String requestMethod = ApiResponseMethod.postMethod;
    Map<String, dynamic> params = {
      "product": {
        "name": "Test Product",
        "price": int.parse(productPrice)
      },
      "token": {
        "email": apiService.sharedPreferences.getString(SharedPreferenceHelper.userEmailKey),
        "id": "tok_visa"
      }
    };

    print(params);
    print(uri);
    print(requestMethod);

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);

    return responseModel;
  }
}