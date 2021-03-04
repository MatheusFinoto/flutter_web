// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../stores/login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<dynamic> _$isEmailValidComputed;

  @override
  dynamic get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<dynamic>(() => super.isEmailValid,
              name: '_LoginStore.isEmailValid'))
          .value;
  Computed<dynamic> _$isSenhaValidComputed;

  @override
  dynamic get isSenhaValid =>
      (_$isSenhaValidComputed ??= Computed<dynamic>(() => super.isSenhaValid,
              name: '_LoginStore.isSenhaValid'))
          .value;
  Computed<dynamic> _$isSenhaCompleteComputed;

  @override
  dynamic get isSenhaComplete => (_$isSenhaCompleteComputed ??=
          Computed<dynamic>(() => super.isSenhaComplete,
              name: '_LoginStore.isSenhaComplete'))
      .value;

  final _$emailAtom = Atom(name: '_LoginStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_LoginStore.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setEmail(dynamic value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(dynamic value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
isEmailValid: ${isEmailValid},
isSenhaValid: ${isSenhaValid},
isSenhaComplete: ${isSenhaComplete}
    ''';
  }
}
