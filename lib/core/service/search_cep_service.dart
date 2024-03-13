import 'package:dio/dio.dart';

abstract class ISearchCepService {
  Future<Map<String, dynamic>> fetchCepData(String cep);
}

class SearchCepService implements ISearchCepService {
  final Dio service;

  SearchCepService(this.service);

  @override
  Future<Map<String, dynamic>> fetchCepData(String cep) async {
    final response = await service.get("$cep/json/");
    return response.data;
  }
}
