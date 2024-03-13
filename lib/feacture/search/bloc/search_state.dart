abstract class SearchCepState {}

class SearchCepLoading implements SearchCepState {
  const SearchCepLoading();
}

class SearchCepSucess implements SearchCepState {
  final Map data;
  const SearchCepSucess(this.data);
}

class SearchCepErro implements SearchCepState {
  final String message;
  const SearchCepErro(this.message);
}
