// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteStore on _ClienteStore, Store {
  Computed<List<ClienteModel>> _$clientesFilteredComputed;

  @override
  List<ClienteModel> get clientesFiltered => (_$clientesFilteredComputed ??=
          Computed<List<ClienteModel>>(() => super.clientesFiltered,
              name: '_ClienteStore.clientesFiltered'))
      .value;

  final _$loadingGetClientesAtom =
      Atom(name: '_ClienteStore.loadingGetClientes');

  @override
  bool get loadingGetClientes {
    _$loadingGetClientesAtom.reportRead();
    return super.loadingGetClientes;
  }

  @override
  set loadingGetClientes(bool value) {
    _$loadingGetClientesAtom.reportWrite(value, super.loadingGetClientes, () {
      super.loadingGetClientes = value;
    });
  }

  final _$filterAtom = Atom(name: '_ClienteStore.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$getClientesAsyncAction = AsyncAction('_ClienteStore.getClientes');

  @override
  Future<void> getClientes() {
    return _$getClientesAsyncAction.run(() => super.getClientes());
  }

  final _$_ClienteStoreActionController =
      ActionController(name: '_ClienteStore');

  @override
  dynamic setFilter(dynamic value) {
    final _$actionInfo = _$_ClienteStoreActionController.startAction(
        name: '_ClienteStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_ClienteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingGetClientes: ${loadingGetClientes},
filter: ${filter},
clientesFiltered: ${clientesFiltered}
    ''';
  }
}
