
import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:teste_web/src/utils/Helper.dart' as GLOBAL;

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  @observable
  String email = "";

  @action
  void setEmail(value)=> email = value;

   @computed
  get isEmailValid => RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email);

 ///SENHA
  @observable
  String senha = "";

  @action
  void setSenha(value)=> senha = value;

  @computed
  get isSenhaValid=> senha.length >= 6 || senha == "";

  @computed
  get isSenhaComplete=> senha.length == 6;

}