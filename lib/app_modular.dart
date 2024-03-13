import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:bloc_test/feacture/search/search_page.dart';
import 'package:bloc_test/core/service/search_cep_service.dart';
import 'package:bloc_test/feacture/search/bloc/search_bloc.dart';

class AppModular extends Module {
  @override
  void binds(i) {
    i.add<Dio>(() => Dio(BaseOptions(baseUrl: 'https://viacep.com.br/ws/')));
    i.add<ISearchCepService>(SearchCepService.new);
    i.addSingleton(SearchBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SearchPage());
  }
}
