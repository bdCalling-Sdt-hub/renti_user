import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/helper/shared_preference_helper.dart';
import '../../../../../core/route/app_route.dart ';

class PaymentController extends GetxController{
  TextEditingController expiryDate=TextEditingController();
  TextEditingController cardNumber=TextEditingController();
  TextEditingController cvvCode=TextEditingController();


  Future<void> tokenizeCard({required String rentId,required  String productName,required int amount,required  String email,required  int residenceId}) async {
    print( expiryDate.text.substring(0,2));
    print( expiryDate.text.substring(3,5));
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer sk_test_51M6KI7Jb9nyriLWoahD6dzwy06PfzLdDBt72MjJv1quIUgJXRQXAhI7bfH617cUKES7G5eQpCBnKV6KooQwrda5c00oLKLZP0w'
    };
    var request = http.Request('POST', Uri.parse('https://api.stripe.com//v1/tokens'));

    request.bodyFields = {
      'card[exp_month]': expiryDate.text.substring(0,2),
      'card[exp_year]': expiryDate.text.substring(3,5),
      'card[number]': cardNumber.text,
      'card[cvc]': cvvCode.text
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var data=json.decode(await response.stream.bytesToString());
      print(data);
      await payment(amount:amount,rentId: rentId,productName: productName,email: email,token:"tok_visa",residenceId: residenceId);
      AppUtils.successToastMessage("Payment Success");

    }
    else {
      print(response.reasonPhrase);
    }
  }


  payment({required String rentId,required  String productName,required int amount,required  String email,required String token,required  int residenceId})async {
    try {
      Map<String,dynamic> body={
        "product": {
          "name": productName,
          "price": amount
        },
        "token": {
          "email": email,
          "id": "tok_visa"
        }
      };
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String t = prefs.getString(SharedPreferenceHelper.accessTokenKey)??"";
      debugPrint("=======> bearer token :$t");
      debugPrint("=======> rentId :$rentId");
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $t'
      };

      var response= await http.post(Uri.parse("${ApiUrlContainer.baseUrl}${ApiUrlContainer.paymentApi}$rentId"),body:json.encode(body),headers: headers);
      if(response.statusCode==200){
        Get.snackbar('Payment Successful', "Payment Successful Done");
        Get.toNamed(AppRoute.startTrip,arguments: residenceId);
        print("==========> response : ${response.body}");
      }else{
        print("==========> response error : ${response.statusCode}");
      }
    } on Exception catch (e) {
      print("==========> catch error  : $e ");
    }

  }







}