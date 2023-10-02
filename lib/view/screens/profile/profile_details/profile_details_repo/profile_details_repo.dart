import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class ProfileDetailsRepo{

  ApiService apiService;
  ProfileDetailsRepo({required this.apiService});

  Future<ApiResponseModel> fetchProfileData() async{

    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.profileDetailsEndPoint}";
    String responseMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(url, responseMethod, null, passHeader: true);

    return responseModel;
  }
}