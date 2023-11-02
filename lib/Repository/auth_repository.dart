import 'package:get/get.dart';
import 'package:help_hand_app/Models/login_model.dart';

import '../API/api_manager.dart';


class AuthRepository {
  final APIManager apiManager;

  AuthRepository(this.apiManager);

  /// login api call
  Future<LoginSuccessModel> loginApiCall({
    required String email,
    required String password,
  }) async {
    var jsonData = await apiManager.postAPICall(
      '${APIManager.baseUrl}api/v1/login',
      {
        'email': email,
        'password': password,
      },
    );
    var respons = LoginSuccessModel.fromJson(jsonData);
    return respons;
  }
}
