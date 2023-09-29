import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';

import '../../../../../../service/api_service.dart';

class CarDetailsRepo{

  ApiService apiService;
  CarDetailsRepo({required this.apiService});


  Future<ApiResponseModel> OfferCarRepoResponse() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.carDetailsEndPont}";

    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> params = {
      "startDate": "2023-08-28",
      "endDate": "2023-08-30"
    };

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);

    return responseModel;
  }
}