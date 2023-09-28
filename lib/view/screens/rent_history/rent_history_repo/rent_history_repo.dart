import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class RentHistoryRepo {
  ApiService apiService;
  RentHistoryRepo({required this.apiService});

  Future<ApiResponseModel> rentHistoryRepo() async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.rentHistoryEndPont}";

    String requestMethod = ApiResponseMethod.getMethod;

    Map<String, String> params = {

    };

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);
    print("Srabon "+responseModel.responseJson);
    print("Srabon "+uri);
    return responseModel;
  }
}
