import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:math';

// import 'package:cpfcnpj/cpfcnpj.dart';
// import 'package:mobx/mobx.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_web/src/models/chart_data.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {



  ObservableList<ChartData> listOfData = ObservableList<ChartData>();
  //ObservableList<Map<String, dynamic>> listOfData = ObservableList<Map<String, dynamic>>();

  @observable
  bool loadingListOfData = false;

  @action
  Future<void> loadListOfData()async{
    listOfData.clear();
    loadingListOfData = true;
    try{
      for(var u in adjustData){
        listOfData.add(ChartData.fromJson(u));
        //listOfData.add(u);
      }

      //changeListOfData();
    }catch(e){
      print(e.toString());
    }
    loadingListOfData = false;
  }



  @observable
  bool changedList = false;

  @action
  Future<void> changeListOfData()async{
    await Future.delayed(Duration(seconds: 5));

    // var a = listOfData.where((element) => element['index'].toString().contains('0')).toList();
    // print(a.length.toString());

    for(var u in adjustData){
      if(u['index'] == 0){
        adjustData.remove(u);
      }
    }

    loadListOfData();

   // changedList = true;

  }

  @observable
  var adjustData = [
    {"type":"Email","index":0,"value":120},
    {"type":"Email","index":1,"value":132},
    {"type":"Email","index":2,"value":101},
    {"type":"Email","index":3,"value":134},
    {"type":"Email","index":4,"value":90},
    {"type":"Email","index":5,"value":230},
    {"type":"Email","index":6,"value":210},
    {"type":"Affiliate","index":0,"value":220},
    {"type":"Affiliate","index":1,"value":182},
    {"type":"Affiliate","index":2,"value":191},
    {"type":"Affiliate","index":3,"value":234},
    {"type":"Affiliate","index":4,"value":290},
    {"type":"Affiliate","index":5,"value":330},
    {"type":"Affiliate","index":6,"value":310},
    {"type":"Video","index":0,"value":150},
    {"type":"Video","index":1,"value":232},
    {"type":"Video","index":2,"value":201},
    {"type":"Video","index":3,"value":154},
    {"type":"Video","index":4,"value":190},
    {"type":"Video","index":5,"value":330},
    {"type":"Video","index":6,"value":410},
    {"type":"Direct","index":0,"value":320},
    {"type":"Direct","index":1,"value":332},
    {"type":"Direct","index":2,"value":301},
    {"type":"Direct","index":3,"value":334},
    {"type":"Direct","index":4,"value":390},
    {"type":"Direct","index":5,"value":330},
    {"type":"Direct","index":6,"value":320},
    {"type":"Search","index":0,"value":320},
    {"type":"Search","index":1,"value":432},
    {"type":"Search","index":2,"value":401},
    {"type":"Search","index":3,"value":434},
    {"type":"Search","index":4,"value":390},
    {"type":"Search","index":5,"value":430},
    {"type":"Search","index":6,"value":420},
  ];





}