import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:bloc_test/feacture/search/bloc/search_bloc.dart';
import 'package:bloc_test/feacture/search/bloc/search_state.dart';
import 'package:bloc_test/feacture/search/widget/cep_data_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => Modular.get<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Busca por CEP'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: MediaQuery.of(context).size.width * 0.30, // 15% da largura da tela
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          controller: _cepController,
                          decoration: const InputDecoration(
                            labelText: 'CEP',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.1, // Ajuste a largura conforme necessário
                      child: ElevatedButton(
                        onPressed: () => Modular.get<SearchBloc>().add(_cepController.text),
                        child: const Text('Pesquisar'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<SearchBloc, SearchCepState>(
                builder: (context, state) {
                  if (state is SearchCepErro) {
                    return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
                  }
                  if (state is SearchCepLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is SearchCepSucess) {
                    if (state.data.isEmpty) {
                      return Container();
                    }
                    return CepDataWidget(
                      data: state.data,
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
