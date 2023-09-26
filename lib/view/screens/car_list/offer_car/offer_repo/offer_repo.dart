import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class OfferRepo{

  ApiService apiService;
  OfferRepo({required this.apiService});

  Future<ApiResponseModel> OfferRepoResponse() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.popularCarEndPoint}";

    String requestMethod = ApiResponseMethod.getMethod;
    Map<String, String> params = {
    };
    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);
    return responseModel;
  }
}