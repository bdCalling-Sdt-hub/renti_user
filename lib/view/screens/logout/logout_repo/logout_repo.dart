import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class LogoutRepo{

  ApiService apiService;
  LogoutRepo({required this.apiService});

  Future<ApiResponseModel> userLogout() async{

    String uri = "${ApiUrlContainer.baseUrl}user/logout";

    String requestMethod = ApiResponseMethod.postMethod;

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: false);

    return responseModel;
  }
}