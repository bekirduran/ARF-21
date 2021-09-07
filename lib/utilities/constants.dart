
class Constants {

  static const String liveBaseURL = 'http://37.148.210.43:8080/api';
  static const String localBaseURL = "http://10.0.2.2:8080/api";

  static const baseUrl = liveBaseURL;


  static const String login = baseUrl + "/auth/signin";
  static const String register = baseUrl + "/auth/signup";
  static const String allProductUrl = baseUrl + "/shop/allcategories";
  static const String companies = baseUrl + "/shop/searchcompany";
  static const String createOrder = baseUrl + "/shop/saveorder";
  static const String getOrders = baseUrl + "/shop/getorders/";
  static const String postApplication = baseUrl + "/shop/postapplication";
  static const String getApplications = baseUrl + "/shop/getapplication/";



  static const myHeader = {
    'Authorization':'Basic ZmZmOmZmZmZmZg==',
    'Content-Type':'application/json',
    'Accept':'*/*',
    'Accept-Encoding':'gzip, deflate, br',
    'Connection':'keep-alive'
  };

  static int userId = 0;

}