import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../API/api_manager.dart';
import '../Models/main_insurance_model.dart';
import '../Repository/agent_repository.dart';

class AgentController extends GetxController{
  AgentRepository agentRepository = AgentRepository(APIManager());
  TextEditingController searchController = TextEditingController();
  RxList<MainInsuranceModel> agentList = <MainInsuranceModel>[].obs;
  RxList<MainInsuranceModel> singleAgentList = <MainInsuranceModel>[].obs;

    getAgentData() async {
      agentList.clear();
      var response = await agentRepository.mainInsuranceAPICall();
      agentList.addAll(response as Iterable<MainInsuranceModel>);
      print("lenght");
      print(agentList.length);
    }

    getAgentByIDData({required int id}) async {
      singleAgentList.clear();
      var response = await agentRepository.mainInsuranceByIdAPICall(id: id);
      singleAgentList.addAll(response as Iterable<MainInsuranceModel>);
      print("lenght");
      print(singleAgentList.length);
    }
}