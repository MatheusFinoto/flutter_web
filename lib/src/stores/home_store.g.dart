// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$loadingListOfDataAtom = Atom(name: '_HomeStore.loadingListOfData');

  @override
  bool get loadingListOfData {
    _$loadingListOfDataAtom.reportRead();
    return super.loadingListOfData;
  }

  @override
  set loadingListOfData(bool value) {
    _$loadingListOfDataAtom.reportWrite(value, super.loadingListOfData, () {
      super.loadingListOfData = value;
    });
  }

  final _$changedListAtom = Atom(name: '_HomeStore.changedList');

  @override
  bool get changedList {
    _$changedListAtom.reportRead();
    return super.changedList;
  }

  @override
  set changedList(bool value) {
    _$changedListAtom.reportWrite(value, super.changedList, () {
      super.changedList = value;
    });
  }

  final _$adjustDataAtom = Atom(name: '_HomeStore.adjustData');

  @override
  List<Map<String, Object>> get adjustData {
    _$adjustDataAtom.reportRead();
    return super.adjustData;
  }

  @override
  set adjustData(List<Map<String, Object>> value) {
    _$adjustDataAtom.reportWrite(value, super.adjustData, () {
      super.adjustData = value;
    });
  }

  final _$loadListOfDataAsyncAction = AsyncAction('_HomeStore.loadListOfData');

  @override
  Future<void> loadListOfData() {
    return _$loadListOfDataAsyncAction.run(() => super.loadListOfData());
  }

  final _$changeListOfDataAsyncAction =
      AsyncAction('_HomeStore.changeListOfData');

  @override
  Future<void> changeListOfData() {
    return _$changeListOfDataAsyncAction.run(() => super.changeListOfData());
  }

  @override
  String toString() {
    return '''
loadingListOfData: ${loadingListOfData},
changedList: ${changedList},
adjustData: ${adjustData}
    ''';
  }
}
