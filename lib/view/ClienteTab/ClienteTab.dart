import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teste_web/utils/Helper.dart' as GLOBAL;

class ClienteTab extends StatefulWidget {
  @override
  _ClienteTabState createState() => _ClienteTabState();
}

class _ClienteTabState extends State<ClienteTab> {
  
  Future loadData()async{
    try{

      var data = await http.get(
       'https://jsonplaceholder.typicode.com/users'
      );

      var response = json.decode(data.body);

      return response;
    
      
    }catch (e){
      print(e.toString());
    }
    
  }

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




  @override
  Widget build(BuildContext context) {
    return  Card(
        child: Column(
          children: [
            Container(
              height: 75,
              decoration: BoxDecoration(
                color: GLOBAL.redDark
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child:  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("CLIENTES", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 31,),
                          child: TextField(
                          decoration: InputDecoration(
                          hintText: "Pesquisar..."
                          ),
                      ),
                    )
                  ),
                
                  SizedBox(
                    height: 35,
                    child: FlatButton(
                      color: Colors.white,
                       onPressed: (){_showDialog();}, 
                       child: Text("Novo Cliente", style: TextStyle(color: GLOBAL.redDark),)
                    ),
                  )
                ],
              ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
              children: [
                  //CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/$index/300"),),
                  SizedBox(width: 12,), 
                  Expanded(child: Text("Nome", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  SizedBox(width: 8,),
                  Expanded(child: Text("E-mail", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  SizedBox(width: 8,),
                  Row(
                  children: [
                    Icon(Icons.delete, size: 20, color: GLOBAL.mediumDark,),
                    Icon(Icons.delete, size: 20, color: GLOBAL.mediumDark,),
                    Icon(Icons.delete, size: 20, color: GLOBAL.mediumDark,),
                   
                  ],
                ),
                SizedBox(width: 8,),
              ],
              ),
            ),
            Container(height: 0.5, color: Colors.white,),
            Expanded(
              child: Padding(
              padding: EdgeInsets.all(16),
              child: FutureBuilder(
                  future: loadData(),
                  builder: (_, snap){
                    if(!snap.hasData){
                      return Center(child: CircularProgressIndicator(),);
                    }else{
                      return ListView.builder(
                          itemCount: snap.data.length,
                          itemBuilder: (_, index){
                          return Row(
                                children: [
                                  //CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/$index/300"),),
                                  SizedBox(width: 8,), 
                                  Expanded(child: Text("${snap.data[index]["name"]}")),
                                  SizedBox(width: 8,),
                                  Expanded(child: Text("${snap.data[index]["email"]}")),
                                  SizedBox(width: 8,),
                                  Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.delete, size: 20, color: Colors.red,), onPressed: (){}
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit, size: 20, color: Colors.blue,), onPressed: (){}
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.save, size: 20, color: Colors.green,), onPressed: (){}
                                    ),
                                  ],
                                ),
                                SizedBox(width: 8,),
                                ],
                              );
                        }
                      );
                    }
            
                  },
                ),
              ),
              )
            
          ],
        )
      );
  }

}