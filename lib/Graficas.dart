import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_ihc/pages/User.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:proyecto_final_ihc/GraficaLineal.dart';

class Graficas extends StatefulWidget {
  final Widget child;

  Graficas({Key key, this.child}) : super(key: key);

  _GraficasState createState() => _GraficasState();
}

class _GraficasState extends State<Graficas> {
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new Pollution(1980, '2018', 30),
      new Pollution(1980, '2019', 40),
      new Pollution(1980, '2020', 10),
    ];
    var data2 = [
      new Pollution(1985, '2018', 100),
      new Pollution(1980, '2019', 150),
      new Pollution(1985, '2020', 80),
    ];
    var data3 = [
      new Pollution(1985, '2018', 200),
      new Pollution(1980, '2019', 300),
      new Pollution(1985, '2020', 180),
    ];
    //primero
    var piedata = [
      new Task('Videos', 60.5, Color(0xff3366cc)),
      new Task('Publicaciones', 35.2, Color(0xffff9900)),
      new Task('Otros', 4.3, Color(0xffdc3912)),
    ];

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_backspace,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => User(),
                ));
              },
            ),
            backgroundColor: Color(0xff1976d2),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                Tab(icon: Icon(Icons.analytics)),
                Tab(icon: Icon(FontAwesomeIcons.chartArea)),
              ],
            ),
            title: Text('Graficos'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Tiempo dedicado.',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: charts.PieChart(_seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(
                                      right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts
                                          .MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition:
                                            charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Publicaciones, Vistas y Likes en su respectivo año',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Publicaciones durante los primeros 5 años',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.LineChart(_seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.ChartTitle('Años',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Publicaciones',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Grafica Lineal de Likes Publicaciones y Vistas en Meses',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                               ),
                               textAlign:TextAlign.justify ,
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 440,
                        child: LineChart(
                          LineChartData(
                            lineTouchData: LineTouchData(enabled: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 4),
                                  FlSpot(1, 3.5),
                                  FlSpot(2, 4.5),
                                  FlSpot(3, 1),
                                  FlSpot(4, 4),
                                  FlSpot(5, 6),
                                  FlSpot(6, 6.5),
                                  FlSpot(7, 6),
                                  FlSpot(8, 4),
                                  FlSpot(9, 6),
                                  FlSpot(10, 6),
                                  FlSpot(11, 7),
                                ],
                                isCurved: true,
                                barWidth: 2,
                                colors: [
                                  Colors.green,
                                ],
                                dotData: FlDotData(
                                  show: false,
                                ),
                              ),
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 0),
                                  FlSpot(1, 3),
                                  FlSpot(2, 4),
                                  FlSpot(3, 5),
                                  FlSpot(4, 8),
                                  FlSpot(5, 3),
                                  FlSpot(6, 5),
                                  FlSpot(7, 8),
                                  FlSpot(8, 4),
                                  FlSpot(9, 7),
                                  FlSpot(10, 7),
                                  FlSpot(11, 8),
                                ],
                                isCurved: true,
                                barWidth: 2,
                                colors: [
                                  Colors.black,
                                ],
                                dotData: FlDotData(
                                  show: false,
                                ),
                              ),
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 7),
                                  FlSpot(1, 3),
                                  FlSpot(2, 4),
                                  FlSpot(3, 0),
                                  FlSpot(4, 3),
                                  FlSpot(5, 4),
                                  FlSpot(6, 5),
                                  FlSpot(7, 3),
                                  FlSpot(8, 2),
                                  FlSpot(9, 4),
                                  FlSpot(10, 1),
                                  FlSpot(11, 3),
                                ],
                                isCurved: false,
                                barWidth: 2,
                                colors: [
                                  Colors.red,
                                ],
                                dotData: FlDotData(
                                  show: false,
                                ),
                              ),
                            ],
                            betweenBarsData: [
                              BetweenBarsData(
                                fromIndex: 0,
                                toIndex: 2,
                                colors: [Colors.red.withOpacity(0.3)],
                              )
                            ],
                            minY: 0,
                            titlesData: FlTitlesData(
                              bottomTitles: SideTitles(
                                  showTitles: true,
                                  getTextStyles: (value) => const TextStyle(
                                      fontSize: 10,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                  getTitles: (value) {
                                    switch (value.toInt()) {
                                      case 0:
                                        return 'Ene';
                                      case 1:
                                        return 'Feb';
                                      case 2:
                                        return 'Mar';
                                      case 3:
                                        return 'Abr';
                                      case 4:
                                        return 'May';
                                      case 5:
                                        return 'Jun';
                                      case 6:
                                        return 'Jul';
                                      case 7:
                                        return 'Aug';
                                      case 8:
                                        return 'Sep';
                                      case 9:
                                        return 'Oct';
                                      case 10:
                                        return 'Nov';
                                      case 11:
                                        return 'Dic';
                                      default:
                                        return '';
                                    }
                                  }),
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTitles: (value) {
                                  return '\ ${value + 0.5} likes';
                                },
                              ),
                            ),
                            gridData: FlGridData(
                              show: true,
                              checkToShowHorizontalLine: (double value) {
                                return value == 1 ||
                                    value == 6 ||
                                    value == 4 ||
                                    value == 5;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: GraficaLineal(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
