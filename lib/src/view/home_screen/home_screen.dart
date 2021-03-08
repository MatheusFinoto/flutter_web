import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:teste_web/src/utils/Helper.dart' as GLOBAL;
import 'package:graphic/graphic.dart' as graphic;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                //color: Colors.grey[300],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text('DASHBOARD',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
            Container(height: 0.3, width: double.infinity, color: Colors.grey,),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: myCard('Empresas', '10', Colors.lightBlueAccent, Icons.business_outlined),
                  ),
                  Expanded(
                    child: myCard('Funcionários', '6', Colors.green[600], Icons.group_outlined),
                  ),
                  Expanded(
                    child: myCard('Lucros', 'R\$: 1,000,434.00', Colors.orange, Icons.attach_money_outlined),
                  ),
                  Expanded(
                    child: myCard('Caixa', '\$ 10,543', Colors.red, Icons.attach_money_outlined),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          child: Text('Multi Line (No Stack)', style: TextStyle(fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        ),
                        Container(
                          width: size.width * 0.6,
                          height: 400,
                          child: graphic.Chart(
                            data: adjustData,
                            scales: {
                              'index': graphic.CatScale(
                                accessor: (map) => map['index'].toString(),
                                range: [0, 1],
                              ),
                              'type': graphic.CatScale(
                                accessor: (map) => map['type'] as String,
                              ),
                              'value': graphic.LinearScale(
                                accessor: (map) => map['value'] as num,
                                nice: true,
                              ),
                            },
                            geoms: [graphic.LineGeom(
                              position: graphic.PositionAttr(field: 'index*value'),
                              color: graphic.ColorAttr(field: 'type'),
                              shape: graphic.ShapeAttr(values: [graphic.BasicLineShape(smooth: true)]),
                            )],
                            axes: {
                              'index': graphic.Defaults.horizontalAxis,
                              'value': graphic.Defaults.verticalAxis,
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            child: Text('Polar Coord Transposed', style: TextStyle(fontSize: 20)),
                            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          ),
                          Container(
                            width: 350,
                            height: 400,
                            child: graphic.Chart(
                              data: basicData,
                              scales: {
                                'genre': graphic.CatScale(
                                  accessor: (map) => map['genre'] as String,
                                ),
                                'sold': graphic.LinearScale(
                                  accessor: (map) => map['sold'] as num,
                                  nice: true,
                                )
                              },
                              coord: graphic.PolarCoord(transposed: true, innerRadius: 0.5),
                              geoms: [graphic.IntervalGeom(
                                position: graphic.PositionAttr(field: 'genre*sold'),
                                color: graphic.ColorAttr(field: 'genre'),
                              )],
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.all(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],

        ),
      ),
    );
  }

  // Column(
  // children: [
  // Row(
  // crossAxisAlignment: CrossAxisAlignment.center,
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  // children: [
  // meuCard("Clientes: 10", GLOBAL.redDark),
  // meuCard("Produtos: 143", Colors.green[600]),
  // meuCard("Vendas: 100", Colors.blue[600]),
  // meuCard("Funcionarios: 10", Colors.amber),
  // ],
  // ),
  //
  // // Container(
  // //   height: 75,
  // //   decoration: BoxDecoration(
  // //     color: GLOBAL.redDark
  // //   ),
  // //   child: Padding(
  // //     padding: EdgeInsets.all(16),
  // //     child:  Row(
  // //     crossAxisAlignment: CrossAxisAlignment.center,
  // //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  // //     children: [
  // //       Text("HOME", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
  // //       Container()
  // //     ],
  // //   ),
  // //   )
  // // ),
  // Expanded(
  // child: Padding(
  // padding: EdgeInsets.all(16),
  // // child: FutureBuilder(
  // //     future: loadData(),
  // //     builder: (_, snap){
  // //       if(!snap.hasData){
  // //         return Center(child: CircularProgressIndicator(),);
  // //       }else{
  // //         return ListView.builder(
  // //           itemCount: snap.data.length,
  // //         itemBuilder: (_, index){
  // //           return ListTile(
  // //             // leading: CircleAvatar(
  // //             //   backgroundImage: NetworkImage("https://picsum.photos/$index/300"),
  // //             // ),
  // //             title: Text("${snap.data[index]["name"]}"),
  // //           );
  // //         }
  // //       );
  // //       }
  //
  // //     },
  // //   ),
  // ),
  // )
  //
  // ],
  // );




  Widget myCard(title, subtitle, color, icon){
    return Card(
        elevation: 5,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                image: AssetImage('assets/images/lines1.png'),
                fit: BoxFit.cover
            ),
          ),
          //padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: 20,),
              ListTile(
                title: AutoSizeText(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),maxLines: 1,overflow: TextOverflow.ellipsis,),
                subtitle: AutoSizeText(subtitle,style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                trailing: Icon(icon, size: 40, color: Colors.black.withOpacity(0.3),),
              ),
              SizedBox(height: 20,),
            ],
          ),
        )
    );
  }

}

const adjustData = [
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

const basicData = [
  { 'genre': 'Sports', 'sold': 275 },
  { 'genre': 'Strategy', 'sold': 115 },
  { 'genre': 'Action', 'sold': 120 },
  { 'genre': 'Shooter', 'sold': 350 },
  { 'genre': 'Other', 'sold': 150 },
];