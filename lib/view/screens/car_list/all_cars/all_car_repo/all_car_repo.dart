import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/service/api_service.dart';

import '../../../../../core/global/api_url_container.dart';

class AllCarRepo{

  ApiService apiService;
  AllCarRepo({required this.apiService});

  Future<ApiResponseModel> AllCarRepoResponse() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.allCarsEndPoint}";

    String requestMethod = ApiResponseMethod.getMethod;


    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);

    return responseModel;
  }
}