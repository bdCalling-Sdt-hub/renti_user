import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/service/api_service.dart';

import '../../../../../core/global/api_response_method.dart';
import '../../../../../core/global/api_url_container.dart';



class TermsConditionsRepo{

  ApiService apiService;
  TermsConditionsRepo({required this.apiService});

  Future<ApiResponseModel> termsConditionsResponse()async{
    String uri="${ApiUrlContainer.baseUrl}${ApiUrlContainer.termsConditionsEndPont}";
    String requestMethod=ApiResponseMethod.getMethod;
    Map<String,dynamic> params={};

    ApiResponseModel responseModel =await apiService.request(uri, requestMethod, params,passHeader: true);
    print(responseModel.statusCode.toString());
    return responseModel;
  }
}