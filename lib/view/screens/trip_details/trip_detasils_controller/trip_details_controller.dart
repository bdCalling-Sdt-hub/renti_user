import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/trip_details/trip_details_model/trip_details_model.dart';
import 'package:renti_user/view/screens/trip_details/trip_details_repo/trip_details_repo.dart';
import 'package:http/http.dart' as http;

class TripDetailsController extends GetxController {
  TripDetailsRepo tripDetailsRepo;
  TripDetailsController({required this.tripDetailsRepo});

  bool isLoading = false;

  TripDetailsModel tripDetailsModel = TripDetailsModel();

  loadData(String rentId) async {
    isLoading = true;
    update();

    ApiResponseModel responseModel =
        await tripDetailsRepo.fetchData(rentID: rentId);
    if (responseModel.statusCode == 200) {
      tripDetailsModel =
          TripDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
    }

    isLoading = false;
    update();
  }

  late Map<String, dynamic> paymentIntent;

  Future createPaymentIntent() async{
    try{
      Map<String, dynamic> body = {
        'amount': 200,
        'currency': "USD",
      };
      http.Response response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),headers: {
        'Authorization': 'Bearer sk_test_51NrcLcSJXOqjAG5dahsxt4pz7cPpq1x7sjvjlnOMi219k6DYo2dVsJk6XE2Pih1p8FfblB00mh7tqCGPLmmKpFsu00cbtRcbQ2',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
        body: body);
      return json.decode(response.body);
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future makePayment() async{
    try{
      paymentIntent = await createPaymentIntent();
      print("makePayment Success");

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
            style: ThemeMode.light,
            merchantDisplayName: "Srabon"
          )
      );

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
  }


}
