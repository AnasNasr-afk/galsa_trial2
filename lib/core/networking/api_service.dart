
import 'package:dio/dio.dart';
import 'package:galsa_trial2/core/networking/api_constants.dart';
import 'package:galsa_trial2/features/login_screen/data/models/login_response.dart';
import 'package:galsa_trial2/features/signup_screen/data/models/signup_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/login_screen/data/models/login_request_body.dart';
import '../../features/signup_screen/data/models/signup_request_body.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
   factory ApiService (Dio dio , {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future <LoginResponse> login (@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signUp)
  Future<SignUpResponse> signUp (@Body() SignUpRequestBody signUpRequestBody);
}