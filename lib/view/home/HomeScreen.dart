import 'package:flutter/material.dart';
import 'package:teste_web/view/ClienteTab/ClienteTab.dart';
import 'package:teste_web/view/HomeTab/HomeTab.dart';
import 'package:teste_web/utils/Helper.dart' as GLOBAL;


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  var pageViewController;
  
  @override
  void initState() {
    super.initState();
    pageViewController = PageController(initialPage: 0, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: GLOBAL.mediumDark
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: FlutterLogo(),
                      ),
                      Text("FLUTTER WEB"),
                    ],
                  ),
                  Text("Matheus Finoto"),
                ],
              ), 
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: GLOBAL.mediumDark
                  ),
                  child: ListView(
                    children: [
                      meuTile("Home", Icons.home, 0),
                      meuTile("Clientes", Icons.person, 1),
                      meuTile("Calendario", Icons.date_range, 2),
                      meuTile("Configurações", Icons.settings, 3),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: PageView(
                    controller: pageViewController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      HomeTab(),
                      ClienteTab(),
                      Container(),
                      Container(),

                    ],
                  ),
                  
                ),
              )
              
            ],
          ),
          )
        ],
      )
    );
    
  }

  Widget meuTile(String nome, IconData icone, int page){
    return ListTile(
      title: Text(nome, style: TextStyle(color: Colors.white)),
      leading: Icon(icone, color: Colors.white,),
      onTap: (){
        pageViewController.jumpToPage(page);
      },
    );
  }


}
