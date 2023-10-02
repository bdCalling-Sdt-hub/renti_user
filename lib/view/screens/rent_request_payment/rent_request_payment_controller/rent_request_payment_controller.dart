import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rent_request_payment/rent_request_payment_model/rent_request_payment_model.dart';
import '../rent_request_payment_repo/rent_request_payment_repo.dart';

class RentRequestPaymentController extends GetxController {
  RentRequestPaymentRepo rentRequestPaymentRepo;

  RentRequestPaymentController({required this.rentRequestPaymentRepo});

  bool isSubmit = false;

  Future<void> rentRequestPaymentResult(String productId, String productPrice,String productName) async {
    isSubmit = true;
    update();

    ApiResponseModel responseModel =
        await rentRequestPaymentRepo.rentRequestPaymentResponse(
            productId: productId,
            productPrice: productPrice,
            productName: productName
        );

    print("status code: ${responseModel.statusCode}");

    if (responseModel.statusCode == 200) {
      RentRequestPaymentModel rentRequestPaymentModel =
          RentRequestPaymentModel.fromJson(
              jsonDecode(responseModel.responseJson));
      print("data: ${rentRequestPaymentModel.message}");
      await gotoNextStep(rentRequestPaymentModel);
      isSubmit = false;
      update();
    } else {
      isSubmit = false;
      update();
    }

    isSubmit = false;
    update();
  }

  gotoNextStep(RentRequestPaymentModel signInResponseModel) async {

  }
}
