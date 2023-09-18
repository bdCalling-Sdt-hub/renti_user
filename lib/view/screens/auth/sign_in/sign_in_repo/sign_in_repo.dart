import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class SignInRepo{

  ApiService apiService;
  SignInRepo({required this.apiService});

  Future<ApiResponseModel> signInUser({required String email, required String password}) async{

    Map<String, String> params = {
      "email" : email,
      "password" : password
    };
    print("params: ${params.toString()}");

    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.signInEndPoint}";
    print("Url: $url");

    ApiResponseModel responseModel = await apiService.request(url, ApiResponseMethod.postMethod, params);

    print("Data: ${responseModel.responseJson}");
    print("status code: ${responseModel.statusCode}");
    return responseModel;
  }
}