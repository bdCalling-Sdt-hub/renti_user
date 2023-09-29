import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class VerifyOtpRepo{
  ApiService apiService;
  VerifyOtpRepo({required this.apiService});

  Future<ApiResponseModel> verifyOtp({required String email, required String otp,}) async{

    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.userVerifyEndPont}";
    String responseMethod = ApiResponseMethod.postMethod;
    Map<String, dynamic> params = {
      "oneTimeCode" : otp,
      "email" : email,
    };

    ApiResponseModel responseModel = await apiService.request(url, responseMethod, params, passHeader: false);
    print("Srabon "+params.toString());
    print("Srabon "+url);
    print("Srabon "+responseModel.statusCode.toString());
    print("Srabon "+responseModel.responseJson);
    print("Srabon "+responseModel.message);
    return responseModel;
  }
}