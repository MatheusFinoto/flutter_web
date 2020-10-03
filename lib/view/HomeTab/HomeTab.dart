import 'package:flutter/material.dart';
import 'package:teste_web/utils/Helper.dart' as GLOBAL;

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                meuCard("Clientes: 10", GLOBAL.redDark),
                meuCard("Produtos: 143", Colors.green[600]),
                meuCard("Vendas: 100", Colors.blue[600]),
                meuCard("Funcionarios: 10", Colors.amber),
              ],
            ),
            
            // Container(
            //   height: 75,
            //   decoration: BoxDecoration(
            //     color: GLOBAL.redDark
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.all(16),
            //     child:  Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("HOME", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            //       Container()
            //     ],
            //   ),
            //   )
            // ),
            Expanded(
              child: Padding(
              padding: EdgeInsets.all(16),
              // child: FutureBuilder(
              //     future: loadData(),
              //     builder: (_, snap){
              //       if(!snap.hasData){
              //         return Center(child: CircularProgressIndicator(),);
              //       }else{
              //         return ListView.builder(
              //           itemCount: snap.data.length,
              //         itemBuilder: (_, index){
              //           return ListTile(
              //             // leading: CircleAvatar(
              //             //   backgroundImage: NetworkImage("https://picsum.photos/$index/300"),
              //             // ),
              //             title: Text("${snap.data[index]["name"]}"),
              //           );
              //         }
              //       );
              //       }
            
              //     },
              //   ),
              ),
            )
            
          ],
        );
  }

  Widget meuCard(String title, Color color){
    return SizedBox(
      width: 200,
      height: 100,
      child: Card(
        color: color,
        child: Center(child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
      ),
    );
  }

}