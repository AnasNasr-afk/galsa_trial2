


import 'package:galsa_trial2/core/networking/api_result.dart';
import 'package:galsa_trial2/core/networking/api_service.dart';
import 'package:galsa_trial2/features/signup_screen/data/models/signup_request_body.dart';
import 'package:galsa_trial2/features/signup_screen/data/models/signup_response.dart';

class SignUpRepo {
  final ApiService apiService;

  SignUpRepo(this.apiService);

    Future<ApiResult<SignUpResponse>> signUp (SignUpRequestBody signUpRequestBody) async {
    try {
      var response = await apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    }catch(e){
      return const ApiResult.failure('Sign Up Failed');
    }
    }
}