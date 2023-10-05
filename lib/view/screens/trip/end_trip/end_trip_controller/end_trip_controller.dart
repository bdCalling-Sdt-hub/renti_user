import 'dart:io';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart%20';
import 'package:shared_preferences/shared_preferences.dart';

class EndTripController extends GetxController{

  List<File> addCarImages= [];
  File? firstImg;
  File? secondImg;
  File? thirdImg;
  final imagePicker = ImagePicker();

  void openGallery({required int index}) async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 120,
      maxWidth: 120,
    );

    if (pickedFile != null) {
      if (index == 0) {
        firstImg = File(pickedFile.path);
        addCarImages.add(firstImg!);
        update();
      } else if (index == 1) {
        secondImg = File(pickedFile.path);
        addCarImages.add(secondImg!);

        update();
      } else if (index == 2) {
        thirdImg = File(pickedFile.path);
        addCarImages.add(thirdImg!);

        update();
      }
    }
  }

  Future<void> addCarMultipleFilesAndParams(String id) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(SharedPreferenceHelper.accessTokenKey);

    try {
      print("okay 1");
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "${ApiUrlContainer.baseUrl}${ApiUrlContainer.starTripEndPoint}/$id"),
      );

      for (var img in addCarImages) {
        if (img.existsSync()) {
          try {
            var multipartImg = await http.MultipartFile.fromPath(
                'carImage', img.path,
                contentType: MediaType('image', 'jpeg'));
            request.files.add(multipartImg);
          } on Exception catch (e) {
            print("Error is :${e.toString()}");
          }
        } else {
          print('File does not exist: ${img.path}');
        }
      }

      // Add the parameters to the request
      Map<String, String> params = {
        "tripStatus": "End",
      };

      params.forEach((key, value) {
        request.fields[key] = value;
      });

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Authorization'] = 'Bearer $token';

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        Get.toNamed(AppRoute.rentiHistory);
      } else {
        print(response.statusCode);
        print('Response body: ${await response.stream.bytesToString()}');
      }
    } catch (e) {
      print("okay 3");
      print(e.toString());
    }
  }
}