
import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class AllCarRepo{

  ApiService apiService;
  AllCarRepo({required this.apiService});

  Future<ApiResponseModel> allCarResponse() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.allCarsEndPoint}";

    String requestMethod = ApiResponseMethod.getMethod;
    Map<String, String> params = {};
    ApiResponseModel responseModel = await apiService.request(uri, requestMethod,null, passHeader: true);
    return responseModel;
  }
}
