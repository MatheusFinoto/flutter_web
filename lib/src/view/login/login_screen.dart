import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_web/src/stores/login_store.dart';
import 'package:teste_web/src/utils/Helper.dart' as GLOBAL;
import 'package:teste_web/src/view/base/base_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width / 4,
        //height: MediaQuery.of(context).size.height / 3,
        child: Card(
            child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100,
              ),
              Observer(
                builder: (_) {
                  return Container(
                      padding: EdgeInsets.all(8),
                      height: 90,
                      child: Center(
                        child: TextField(
                          onChanged: (value) => loginStore.setEmail(value),
                          //enabled: !loginStore.carregado ? true : false,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          cursorWidth: 0.7,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                              suffixIcon: loginStore.isEmailValid
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  : null,
                              hintText: "E-mail",
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: GLOBAL.redDark)),
                              errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              errorText: loginStore.isEmailValid
                                  ? null
                                  : "Este não é um E-mail válido"),
                        ),
                      ));
                },
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: "E-mail"
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Senha"),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => BaseScreen()));
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        )),
      )),
    );
  }
}
