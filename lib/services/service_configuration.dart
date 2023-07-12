class ServiceConfiguration {
  static get baseUrl =>
      'http://ec2-43-206-117-251.ap-northeast-1.compute.amazonaws.com:5000';

  //all Data
  static get allData => "/allData";

  //signup , Signin
  static get signUp => "/signUp";
  static get signIn => "/sign-in";
  static get panCardDetails => "/PanCardDetails";
  static get register => "/Register";

  //personalDetails
  static get personalDetails => "/parsonalDetails";

  //bankDetails
  static get bankDetails => "/bankDetails";

  //paymentMethod
  static get paymentMethod => "/paymentMethod";

  //uploadJson
  static get uploadDocument => "/uploadDocument";

  //share Details
  static get shareDetails => "/sharesDocument";

  //error text
  static get commonErrorMessage => "Something went wrong";
}
