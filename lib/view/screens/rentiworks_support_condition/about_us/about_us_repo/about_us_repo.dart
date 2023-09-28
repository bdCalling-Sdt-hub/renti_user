import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class AboutUsRepo {

  ApiService apiService;

  AboutUsRepo({required this.apiService});

  Future<ApiResponseModel> aboutUsResponse() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.aboutUsEnd}";

    String requestMethod = ApiResponseMethod.getMethod;
    Map<String,dynamic> body ={};

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod,body, passHeader: true);

    print(responseModel.responseJson.toString());
    return responseModel;
  }
}