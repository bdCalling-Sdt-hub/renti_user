/*
import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class StarTripRepo {
  ApiService apiService;
  StarTripRepo({required this.apiService});

  Future<ApiResponseModel> startTripResponse({required String rentID}) async {
    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.starTripEndPoint}/$rentID";
    print("Url: $url");
    String requestMethod = ApiResponseMethod.postMethod;

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);

    return responseModel;
  }
}*/
