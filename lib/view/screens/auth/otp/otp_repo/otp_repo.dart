import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';

class OTPRepo{

  ApiService apiService;
  OTPRepo({required this.apiService});

  verifyEmail({required String email, required String otpCode}) async{

    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.verifyEmailEndPoint}";
    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> params = {
      "oneTimeCode": otpCode,
      "email": email
    };

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, params, passHeader: false);

    return responseModel;
  }
}