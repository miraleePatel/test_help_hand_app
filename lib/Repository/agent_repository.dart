import '../API/api_manager.dart';
import '../Models/main_insurance_model.dart';

class AgentRepository {
  final APIManager apiManager;

  AgentRepository(this.apiManager);

  Future<List<MainInsuranceModel>> mainInsuranceAPICall() async {
    final response = await apiManager
        .getAPICall("${APIManager.baseUrl}api/v1/main-insurance-people");

    if (response is List) {
      return response.map((data) => MainInsuranceModel.fromJson(data)).toList();
    } else {
      print("List is empty");
      return [];
    }
  }

  Future<List<MainInsuranceModel>> mainInsuranceByIdAPICall(
      {required int id}) async {
    final response = await apiManager
        .getAPICall("${APIManager.baseUrl}api/v1/main-insurance-people/$id");

    if (response is List) {
      return response.map((data) => MainInsuranceModel.fromJson(data)).toList();
    } else {
      print("List is empty");
      return [];
    }
  }
}
