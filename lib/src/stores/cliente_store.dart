import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:teste_web/src/models/cliente_model.dart';
import 'package:teste_web/src/utils/Helper.dart' as GLOBAL;

part 'cliente_store.g.dart';

class ClienteStore = _ClienteStore with _$ClienteStore;

abstract class _ClienteStore with Store {
  @observable
  bool loadingGetClientes = false;

  ObservableList<ClienteModel> listOfClientes = ObservableList<ClienteModel>();

  @action
  Future<void> getClientes() async {
    listOfClientes.clear();
    loadingGetClientes = true;
    try {
      //await Future.delayed(Duration(seconds: 2));
      var data = await http.get('https://jsonplaceholder.typicode.com/users');

      var response = json.decode(data.body);

      for (var u in response) {
        listOfClientes.add(ClienteModel.fromJson(u));
      }
    } catch (e) {
      print(e.toString());
    }
    loadingGetClientes = false;
  }

  @observable
  String filter = '';

  @action
  setFilter(value) => filter = value;

  @computed
  List<ClienteModel> get clientesFiltered {
    if (filter.isEmpty) {
      return listOfClientes;
    } else {
      return listOfClientes
          .where((element) => element.name.toLowerCase().contains(filter))
          .toList();
    }
  }
}
