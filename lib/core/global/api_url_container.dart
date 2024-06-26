class ApiUrlContainer {

  /// =========================>ForLive ==========================>
  //
  static const String apiBaseUrl = "https://renticarshare.com/api";
  static const String socketGlobal = "https://renticarshare.com";
  static const String imageUrl = "https://renticarshare.com";

  /// =========================>forLocal==========================>

 // static const String apiBaseUrl = "http://192.168.10.14:3001/api/";
 // static const String socketGlobal = "http://192.168.10.14:9001";
 // static const String imageUrl = "http://192.168.10.14:3001";

  static const String signInEndPoint = "/user/user/sign-in";
  static const String updateProfile = "/user/update/";
  static const String signUpEndPoint = "/user/usersignup";
  static const String forgetPasswordEndPoint = "/user/user/forget-password";
  static const String verifyEmailEndPoint = "/user/verify-code";
  static const String resetPasswordEndPoint = "/user/update-password";
  static const String logoutEndPoint = "/user/logout";
  static const String changePasswordEndPoint = "/user/change-password";
  static const String profileDetailsEndPoint = "/user/user-info";
  static const String profileUpdateEndPoint = "/user/update";
  static const String privacyPolicy = "/privacyPolicy/all";
  static const String aboutUsEnd = "/about/all";
  static const String termConditionEndPoint = "/termsConditionRouter/all";
  static const String howRentiWorksEndPoint = "/howRentiWork";
  static const String allCarsEndPoint = "/car/all";
  static const String rentAll = "/rent/all";
  static const String carDetailsEndPoint = "/car";
  static const String rentHistoryEndPoint = "/rent/rent-history";
  static const String offerCarEndPoint = "/car/offer";
  static const String rentRequestPaymentEndPoint = "/payment";
  static const String luxuryCarEndPoint = "/car/luxury";
  static const String supportEndPoint = "/support";
  static const String sentRentRequestEndPoint = "/rent/request";
  static const String rentDetailsEndPont = "/rent";
  static const String cancelRentRequestEndPoint = "/rent/cancel/request";
  static const String starTripEndPoint = "/rent/trip";
  static const String paymentApi = "/payment";
  static const String stripeUrl = "https://api.stripe.com//v1/tokens";
  static const String notificationEndPoint = "/notifications";
  static const String cardEndPoint = "/card";
}
