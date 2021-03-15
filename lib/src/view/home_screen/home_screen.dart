import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teste_web/src/stores/home_store.dart';
import 'package:graphic/graphic.dart' as graphic;

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  HomeStore hs = HomeStore();

  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hs.loadListOfData();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
      Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // reaction((_)=>hs.changedList, (value){
    //   print('SET STATE');
    //   if(value == true){
    //     setState(() {
    //
    //     });
    //   }
    //   hs.changedList = false;
    //   //hs.testeData();
    // });

    // reaction((_)=>hs.restartedListPie, (value){
    //   if(value == true){
    //     print('list pie loaded');
    //   }
    //   hs.setRestartedListPie(false);
    //   hs.loadListPie();
    // });
  }
  int touchedIndex;





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
                          child: Text('Venda Mensal (2021)', style: TextStyle(fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        ),
                        Observer(
                          builder: (_){
                            return Column(
                              children: [
                                Container(
                                  width: size.width * 0.6,
                                  height: 400,
                                  child: graphic.Chart(
                                    data: hs.listOfData,
                                    scales: {
                                      'index': graphic.CatScale(
                                        accessor: (map){
                                          return map.index.toString();
                                        },
                                        range: [0, 1],
                                      ),

                                      'type': graphic.CatScale(
                                        accessor: (map) => map.type as String,
                                      ),

                                      'value': graphic.LinearScale(
                                        accessor: (map) => map.value as num,
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
                            );
                          },
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
                            child: Text('Produtos vendidos', style: TextStyle(fontSize: 20)),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Card(
                    color: Colors.blue,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          child: Text('Calendário', style: TextStyle(fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        ),
                        Observer(
                          builder: (_){
                            return Container(
                              height: 450,
                              width: 400,
                              child: _buildTableCalendarWithBuilders(),
                            );
                          },
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
                            child: Text('Eventos', style: TextStyle(fontSize: 20)),
                            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          ),
                          //Container(height: 0.3, width: double.infinity, color: Colors.grey,),
                          Container(
                            height: 450,
                            child: ListView.builder(
                              itemCount: _selectedEvents.length,
                              itemBuilder: (_, index){
                                return ListTile(
                                  title: Text(_selectedEvents[index].toString()),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Card(
                  //     elevation: 5,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Column(
                  //       children: [
                  //         Padding(
                  //           child: Text('Produtos vendidos', style: TextStyle(fontSize: 20)),
                  //           padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  //         ),
                  //         Container(
                  //           width: 350,
                  //           height: 400,
                  //           child: graphic.Chart(
                  //             data: basicData,
                  //             scales: {
                  //               'genre': graphic.CatScale(
                  //                 accessor: (map) => map['genre'] as String,
                  //               ),
                  //               'sold': graphic.LinearScale(
                  //                 accessor: (map) => map['sold'] as num,
                  //                 nice: true,
                  //               )
                  //             },
                  //             coord: graphic.PolarCoord(transposed: true, innerRadius: 0.5),
                  //             geoms: [graphic.IntervalGeom(
                  //               position: graphic.PositionAttr(field: 'genre*sold'),
                  //               color: graphic.ColorAttr(field: 'genre'),
                  //
                  //             )],
                  //             padding: EdgeInsets.zero,
                  //             margin: EdgeInsets.all(20),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),





                ],
              ),
            ),
          ],

        ),
      ),
    );
  }







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

  Widget _buildTableCalendar() {
    return TableCalendar(
      initialCalendarFormat: CalendarFormat.month,
      availableCalendarFormats: {CalendarFormat.month: 'Mes', CalendarFormat.week: 'Semana'},
      //locale: 'pt_BR',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.grey[200],//Colors.deepOrange[400],
        todayColor: Colors.white,//Colors.deepOrange[200],
        markersColor: Colors.white,//Colors.brown[700],
        selectedStyle: TextStyle(color: Colors.black),
        todayStyle: TextStyle(color: Colors.black),
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:TextStyle().copyWith(color: Colors.blue, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,

    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      //locale: 'pt_BR',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: 100,
              height: 100,
              child: Text('${date.day}',style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[600],
            ),
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];
          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
            ? Colors.brown[300]
            : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin:
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          title: Text(event.toString()),
          onTap: () => print('$event tapped!'),
        ),
      ))
          .toList(),
    );
  }

}

const basicData = [
  { 'genre': 'Sports', 'sold': 275 },
  { 'genre': 'Strategy', 'sold': 115 },
  { 'genre': 'Action', 'sold': 120 },
  { 'genre': 'Shooter', 'sold': 350 },
  { 'genre': 'Other', 'sold': 150 },
];