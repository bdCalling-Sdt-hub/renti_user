import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_model/request_cancel_response_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_model/rent_history_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';

class RentHistoryController extends GetxController{

  RentHistoryRepo rentHistoryRepo;
  RentHistoryController({required this.rentHistoryRepo});

  RentHistoryModel rentHistoryModel = RentHistoryModel();
  bool isLoading = false;
  List<UserWiseRent> rentUser = [];
  RequestCancelResponseModel requestCancelResponseModel = RequestCancelResponseModel();

  void initialState() async{
    rentUser.clear();
    isLoading = true;
    update();

    await rentHistoryResult();

    isLoading = false;
    update();
  }

  Future<void> rentHistoryResult() async{

    ApiResponseModel responseModel = await rentHistoryRepo.rentHistoryRepoResponse();

    if(responseModel.statusCode == 200){

      rentHistoryModel = RentHistoryModel.fromJson(jsonDecode(responseModel.responseJson));
      List<UserWiseRent>? tempCarList = rentHistoryModel.userWiseRent;
      if(tempCarList != null && tempCarList.isNotEmpty){
        rentUser.addAll(tempCarList);
      }
    }
  }

  bool isSubmit = false;

  cancelRequest(String rentId) async{

    isSubmit = true;
    update();

    ApiResponseModel responseModel = await rentHistoryRepo.cancelRentRequest(rentId: rentId);
    if(responseModel.statusCode == 200){
      requestCancelResponseModel = RequestCancelResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      AppUtils.successToastMessage("Rent request cancel successfully");
      Get.offAndToNamed(AppRoute.rentiHistory);
    }
    else{

    }

    isSubmit = false;
    update();
  }

/*  late Map<String, dynamic> paymentIntent;

  Future createPaymentIntent() async{
    try{
      Map<String, dynamic> body = {
        'amount': "200",
        'currency': "USD",
      };
      http.Response response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),headers: {
        'Authorization': 'Bearer sk_test_51NrcLcSJXOqjAG5dahsxt4pz7cPpq1x7sjvjlnOMi219k6DYo2dVsJk6XE2Pih1p8FfblB00mh7tqCGPLmmKpFsu00cbtRcbQ2',
        'Content-Type': 'application/x-www-form-urlencoded'
      }, body:body);
      print("Srabon" +response.statusCode.toString());
      return json.decode(response.body);
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future makePayment() async{
    try{
      paymentIntent = await createPaymentIntent();
      print("makePayment Success");

      final result = await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent['client_secret'],
              style: ThemeMode.light,
              allowsDelayedPaymentMethods: true,
              merchantDisplayName: "Srabon"
          )
      );

      print("okay Okay");

      displayPaymentSheet();
    }catch(e){
      print("makePayment Error$e");
    }
  }

  Future displayPaymentSheet()async{
    try{
      await Stripe.instance.presentPaymentSheet();
      print("displayPaymentSheet Success");
    }catch(e){
      print("displayPaymentSheet Error$e");
    }
  }*/

  Future<void> initPaymentSheet(context, {required String email, required int amount}) async {
    try {
      // 1. create payment intent on the server
      final response = await http.post(
          Uri.parse(
              'https://us-central1-stripe-checkout-flutter.cloudfunctions.net/stripePaymentIntentRequest'),
          body: {
            'email': email,
            'amount': amount.toString(),
          });

      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse.toString());

      //2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Flutter Stripe Store Demo',
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
          style: ThemeMode.light,
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment completed!')),
      );
    } catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }
}


