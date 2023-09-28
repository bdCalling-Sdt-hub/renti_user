import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class SelectCarRepo {
  ApiService apiService;
  SelectCarRepo({required this.apiService});

  Future<ApiResponseModel> selectCarRepo() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.sendRentRequestEndPont}6513fdb0c0fbfde118a82549";

    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> params = {
      "startDate": "2023-09-28",
      "endDate": "2023-09-30"
    };

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);
    print("Srabon "+responseModel.responseJson);
    print("Srabon "+uri);
    return responseModel;
  }

  Future<ApiResponseModel> carDetailsResponse() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.cancelRentEndPont}65140836c0fbfde118a8325c";

    String requestMethod = ApiResponseMethod.getMethod;

    Map<String, String> params = {

    };

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);
    print("Srabon "+responseModel.responseJson);
    print("Srabon "+uri);
    return responseModel;
  }

  Future<ApiResponseModel> deleteRentCarRequest() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.cancelRentEndPont}65140836c0fbfde118a8325c";

    String requestMethod = ApiResponseMethod.deleteMethod;

    Map<String, String> params = {

    };

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);
    print("Srabon "+responseModel.responseJson);
    print("Srabon "+uri);
    return responseModel;
  }
}
