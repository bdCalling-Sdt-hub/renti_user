import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class CarDetailsRepo{

  ApiService apiService;
  CarDetailsRepo({required this.apiService});

  Future<ApiResponseModel> fetchCarDetails({required String id}) async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.carDetailsEndPoint}$id";

    String requestMethod = ApiResponseMethod.getMethod;
    
    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);
    print(responseModel.message);
    print(responseModel.responseJson);
    print(responseModel.statusCode);
    return responseModel;
  }

  Future<ApiResponseModel> sendRentRequest({required String id}) async{

    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.sendRentRequestEndPoint}$id";

    print("URI : ${uri}");


    String requestMethod = ApiResponseMethod.postMethod;

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);
    print(responseModel.message);
    // print(responseModel.responseJson);
    // print(responseModel.statusCode);
    return responseModel;
  }
}

