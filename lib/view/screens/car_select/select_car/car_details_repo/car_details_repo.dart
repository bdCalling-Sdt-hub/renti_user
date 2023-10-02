import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class CarDetailsRepo{

  ApiService apiService;
  CarDetailsRepo({required this.apiService});

  Future<ApiResponseModel> fetchCarDetails({required String id}) async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.carDetailsEndPoint}/$id";

    String requestMethod = ApiResponseMethod.getMethod;
    
    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);
    
    return responseModel;
  }
}

