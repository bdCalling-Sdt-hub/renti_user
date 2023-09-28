import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/service/api_service.dart';

import '../../../../../core/global/api_url_container.dart';

class OfferCarRepo{

  ApiService apiService;
  OfferCarRepo({required this.apiService});

  Future<ApiResponseModel> OfferCarRepoResponse() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.carAllEndPont}";

    String requestMethod = ApiResponseMethod.getMethod;

    Map<String, String> params = {

    };

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);

    return responseModel;
  }
}