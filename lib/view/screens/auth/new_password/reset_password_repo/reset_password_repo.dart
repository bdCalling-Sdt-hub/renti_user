import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class ResetPasswordRepo{

  ApiService apiService;
  ResetPasswordRepo({required this.apiService});

  Future<ApiResponseModel> resetPassword({required String password}) async{

    String url = "${ApiUrlContainer.baseUrl}user/update-password";
    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> params = {"password" : password};

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, params, passHeader: false);

    return responseModel;
  }
}