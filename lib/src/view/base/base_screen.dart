import 'package:flutter/material.dart';
import 'package:teste_web/src/utils/Helper.dart' as GLOBAL;
import 'package:teste_web/src/view/cliente_screen/cliente_screen.dart';
import 'package:teste_web/src/view/home_screen/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
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
          //decoration: BoxDecoration(color: GLOBAL.mediumDark),
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
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
                  //decoration: BoxDecoration(color: GLOBAL.mediumDark),
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
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
                      HomeScreen(),
                      ClienteScreen(),
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
    ));
  }

  Widget meuTile(String nome, IconData icone, int page) {
    return ListTile(
      title: Text(nome, style: TextStyle(color: Colors.black54)),
      leading: Icon(
        icone,
        color: Colors.black54,
      ),
      onTap: () {
        pageViewController.jumpToPage(page);
      },
    );
  }
}
