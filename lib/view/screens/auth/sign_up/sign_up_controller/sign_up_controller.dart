import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_repo/sign_up_repo.dart';

class SignUpController extends GetxController{

  SignUpRepo signUpRepo;
  SignUpController({required this.signUpRepo});

  bool isSubmit = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController creditCardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController ineNumberController = TextEditingController();

  List<String> genderList = ["Male", "Female", "Others"];
  int selectedGender = 0;
  List<File> kycDocFiles = [];
  File? profileImage;
  String phoneCode = "+52";

  void changeGender(int index){
    selectedGender = index;
    update();
  }

  void gotoNextStep() {
    Get.offAndToNamed(AppRoute.otpScreen, arguments: [emailController.text.toString(), false]);
  }

  File? uploadDrivingLicense;
  File? uploadPassport;
  String drivingLicenseFileName = "";
  String passportFileName = "";

  Future<void> pickDrivingLicenceFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, allowedExtensions: ["pdf"], type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadDrivingLicense = File(result.files.single.path.toString());
      //drivingLicenseFileName = result.files.single.name;

      kycDocFiles.add(uploadDrivingLicense!);
      update();
    }
  }

  Future<void> pickPassportFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, allowedExtensions: ["pdf"], type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadPassport = File(result.files.single.path.toString());
      //passportFileName = result.files.single.name;
      kycDocFiles.add(uploadPassport!);
      update();
    }
  }

  void removeDrivingLicenceFile() {
    uploadDrivingLicense = null;
    drivingLicenseFileName = "";
    kycDocFiles.removeAt(0);
    update();
  }

  void removePassportFile() {
    uploadPassport = null;
    passportFileName = "";
    kycDocFiles.removeAt(1);
    update();
  }
   
  File? imageFile;
  final imagePicker = ImagePicker();
  String? imageUrl;

  void openGallery() async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 120, maxWidth: 120);

    if(pickedFile != null){
      imageFile = File(pickedFile.path);
      update();
    }
  }

  void openCamera(BuildContext context)  async{
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 120,
        maxWidth: 120
    );

    if(pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();
    }
  }


  Future<void> signUpUser() async {

    isSubmit = true;
    update();

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${ApiUrlContainer.baseUrl}${ApiUrlContainer.signUpEndPoint}"));

      // Add the KYC files to the request
      for (var file in kycDocFiles) {
        if (file.existsSync()) {
          try {
            var multipartFile = await http.MultipartFile.fromPath(
                'KYC', file.path,
                contentType: MediaType('application', 'pdf'));
            request.files.add(multipartFile);
          } on Exception catch (e) {
            print("Error is :${e.toString()}");
          }
        } else {
          print('File does not exist: ${file.path}');
        }
      }

      if (imageFile != null && imageFile!.existsSync()) {
        try {
          var img = await http.MultipartFile.fromPath('image', imageFile!.path, contentType: MediaType('image', 'jpeg'));

          request.files.add(img);
        } on Exception catch (e) {
          print('Error adding image file to request: $e');
          // Handle the error gracefully, e.g., show an error message to the user.
        }
      }

      // Add the parameters to the request
      Map<String, String> params = {
        "fullName": fullNameController.text,
        "email": emailController.text,
        "phoneNumber": "$phoneCode ${phoneNumberController.text}",
        "gender": genderList[selectedGender],
        "address": addressController.text,
        "dateOfBirth": "${dateController.text}/${monthController.text}/${yearController.text}",
        "password": passwordController.text,
        "ine": ineNumberController.text,

        "role": "user"
      };

      params.forEach((key, value) {
        request.fields[key] = value;
      });

      request.headers['Content-Type'] = 'multipart/form-data';

      var response = await request.send();

      if (response.statusCode == 201) {
        gotoNextStep();
        print('Files uploaded successfully');
      } else if(response.statusCode ==409){
        var response1 = await http.Response.fromStream(response);
        print(jsonDecode(response1.body));
        AppUtils.errorToastMessage('User already exists! Please login');
      }else{
        print('File upload failed with status code: ${response.statusCode}');
        AppUtils.errorToastMessage("File upload failed");
        print('Response body: ${response.stream.bytesToString()}');
      }
    } catch (e, s) {
      print('Error sending request: $e');
      print('Error s: $s');
    }

    isSubmit = false;
    update();
  }
}