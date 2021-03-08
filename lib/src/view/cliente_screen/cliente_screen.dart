import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:teste_web/src/components/custon_divider.dart';
import 'package:teste_web/src/models/cliente_model.dart';
import 'package:teste_web/src/stores/cliente_store.dart';
import 'dart:convert';
import 'package:teste_web/src/utils/Helper.dart' as GLOBAL;

class ClienteScreen extends StatefulWidget {
  @override
  _ClienteScreenState createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Alert Dialog titulo"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ClienteStore cs = ClienteStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cs.getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                      //color: GLOBAL.redDark,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "CLIENTES",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 31,
                          ),
                          child: TextField(
                            decoration: InputDecoration(hintText: "Pesquisar..."),
                            onChanged: cs.setFilter,
                          ),
                        )),
                        SizedBox(
                          height: 35,
                          child: FlatButton(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                _showDialog();
                              },
                              child: Text(
                                "Novo Cliente",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  )),
              Container(height: 0.3, width: double.infinity, color: Colors.grey,),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    //CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/$index/300"),),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Text(
                      "Nome",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Text(
                      "E-mail",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      width: 8,
                    ),

                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Observer(
                      builder: (_) {
                        if (cs.loadingGetClientes) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          if (cs.listOfClientes.isEmpty) {
                            return Text('LISTA VAZIA');
                          } else {
                            return RefreshIndicator(
                              onRefresh: cs.getClientes,
                              child: ListView.builder(
                                  itemCount: cs.clientesFiltered.length,
                                  itemBuilder: (_, index) {
                                    ClienteModel cm = cs.clientesFiltered[index];
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            //CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/$index/300"),),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(child: Text("${cm.name}")),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(child: Text("${cm.email}")),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Row(
                                              children: [
                                                FlatButton(
                                                    color: Colors.red,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10)),
                                                    onPressed: () {
                                                      //_showDialog();
                                                      cs.listOfClientes.remove(cm);
                                                    },
                                                    child: Text(
                                                      "Remover",
                                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                                    )
                                                ),
                                                SizedBox(width: 4,),
                                                FlatButton(
                                                    color: Colors.blue,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10)),
                                                    onPressed: () {
                                                      //_showDialog();
                                                    },
                                                    child: Text(
                                                      "Editar",
                                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                          ],
                                        ),
                                        Divider()
                                      ],
                                    );
                                  }),
                            );
                          }
                        }
                      },
                    )),
              )
            ],
          )),
    );
  }

  // FutureBuilder(
  //                 future: loadData(),
  //                 builder: (_, snap) {
  //                   if (!snap.hasData) {
  //                     return Center(
  //                       child: CircularProgressIndicator(),
  //                     );
  //                   } else {
  // return ListView.builder(
  //     itemCount: snap.data.length,
  //     itemBuilder: (_, index) {
  //       return Row(
  //         children: [
  //           //CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/$index/300"),),
  //           SizedBox(
  //             width: 8,
  //           ),
  //           Expanded(
  //               child: Text("${snap.data[index]["name"]}")),
  //           SizedBox(
  //             width: 8,
  //           ),
  //           Expanded(
  //               child:
  //                   Text("${snap.data[index]["email"]}")),
  //           SizedBox(
  //             width: 8,
  //           ),
  //           Row(
  //             children: [
  //               IconButton(
  //                   icon: Icon(
  //                     Icons.delete,
  //                     size: 20,
  //                     color: Colors.red,
  //                   ),
  //                   onPressed: () {}),
  //               IconButton(
  //                   icon: Icon(
  //                     Icons.edit,
  //                     size: 20,
  //                     color: Colors.blue,
  //                   ),
  //                   onPressed: () {}),
  //               IconButton(
  //                   icon: Icon(
  //                     Icons.save,
  //                     size: 20,
  //                     color: Colors.green,
  //                   ),
  //                   onPressed: () {}),
  //             ],
  //           ),
  //           SizedBox(
  //             width: 8,
  //           ),
  //         ],
  //       );
  //     });
  //                   }
  //                 },
  //               ),
}
