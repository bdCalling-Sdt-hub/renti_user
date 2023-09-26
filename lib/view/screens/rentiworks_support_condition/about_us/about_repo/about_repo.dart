import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class AboutRepo {

  ApiService apiService;
  AboutRepo({required this.apiService});

  Future<ApiResponseModel> aboutResponse() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.aboutEndPont}";

    String requestMethod = ApiResponseMethod.getMethod;

    Map<String, dynamic> params = {
    };

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);
    print("Srabon  "+responseModel.statusCode.toString());
    return responseModel;
  }
}