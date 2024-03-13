import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/core/service/search_cep_service.dart';
import 'package:bloc_test/feacture/search/bloc/search_state.dart';

class SearchBloc extends Bloc<String, SearchCepState> {
  final ISearchCepService apiService;

  SearchBloc(this.apiService) : super(const SearchCepSucess({})) {
    on<String>(
      (event, emit) async {
        emit(const SearchCepLoading());
        await Future.delayed(const Duration(milliseconds: 500));

        if (validatImput(event)) {
          final data = await apiService.fetchCepData(event);
          if (data.keys.first == 'erro') {
            emit(const SearchCepErro('Cep não encontrado'));
          } else {
            var datanew = removeDataEmpty(data);
            emit(SearchCepSucess(datanew));
          }
        } else {
          emit(const SearchCepErro('O imput precisa ter 8 caracteres numéricos válidos'));
        }
      },
    );
  }
}

bool validatImput(String event) {
  final RegExp regex = RegExp(r'^\d{8}$');
  return regex.hasMatch(event);
}

Map<dynamic, dynamic> removeDataEmpty(dynamic data) {
  Map<dynamic, dynamic> nonEmptyData = {};
  if (data is Map<dynamic, dynamic>) {
    data.forEach(
      (key, value) {
        if (value.toString().isNotEmpty) {
          nonEmptyData[key] = value;
        }
      },
    );
  }
  return nonEmptyData;
}
