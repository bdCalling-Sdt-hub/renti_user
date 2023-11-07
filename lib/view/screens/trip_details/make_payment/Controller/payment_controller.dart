import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class PaymentController extends GetxController{
  TextEditingController expiryDate=TextEditingController();
  TextEditingController cardNumber=TextEditingController();
  TextEditingController cvvCode=TextEditingController();


  Future<void> tokenizeCard({required String hostId,required  String productName,required int amount,required  String email}) async {
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
      await payment(amount:200,hostId: hostId,productName: productName,email: email,token:"tok_visa");
    }
    else {
      print(response.reasonPhrase);
    }
  }


  payment({required String hostId,required  String productName,required int amount,required  String email,required String token})async {
    try {
      Map<String,dynamic> body={
        "product": {
          "name": productName,
          "price": amount
        },
        "token": {
          "email": email,
          "id": token
        }
      };
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ5ZjA3ZGNkZWIyYzhlYjRjYjI0ZTMiLCJlbWFpbCI6InB5dGhvbmxvdmVya2FiaXIxMUBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImFjdGl2aXR5SWQiOm51bGwsImlhdCI6MTY5OTM0ODAzMiwiZXhwIjoxNjk5MzkxMjMyfQ.lg_uM7g_0_Sxm4XSnzOfMpjZDGcnFKne20Sr5Yjlugc'
      };


      var response= await http.post(Uri.parse("http://192.168.10.14:3001/api/payment/$hostId"),body:jsonEncode(body),headers: headers);
      if(response.statusCode==200){
        Get.snackbar('Payment Successful', "Payment Successful Done");
        print("==========> response : ${response.body}");
      }else{
        print("==========> response error : ${response.statusCode}");
      }
    } on Exception catch (e) {
      print("==========> catch error  : $e ");
    }

  }







}