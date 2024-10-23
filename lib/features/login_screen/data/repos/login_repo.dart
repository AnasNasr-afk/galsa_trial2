import 'package:galsa_trial2/core/networking/api_result.dart';
import 'package:galsa_trial2/core/networking/api_service.dart';
import 'package:galsa_trial2/features/login_screen/data/models/login_request_body.dart';
import 'package:galsa_trial2/features/login_screen/data/models/login_response.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future <ApiResult<LoginResponse>> login ( LoginRequestBody loginRequestBody) async{
    try {
      var response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e){
      return const ApiResult.failure('Login Failed');
    }
  }
}