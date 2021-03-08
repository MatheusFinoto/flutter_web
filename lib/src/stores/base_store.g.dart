// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseStore on _BaseStore, Store {
  final _$pageAtom = Atom(name: '_BaseStore.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$_BaseStoreActionController = ActionController(name: '_BaseStore');

  @override
  void setPage(int value) {
    final _$actionInfo =
        _$_BaseStoreActionController.startAction(name: '_BaseStore.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page}
    ''';
  }
}
