import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  List<Color> gradientColors = [
    const Color(0xFF50E4FF),
    const Color(0xFF2196F3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Київ метео 1'),
      ),
      body: Column(
        children: <Widget>[
          const Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '23.32℃',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Digital',
                      fontSize: 26,
                      color: Color.fromARGB(255, 48, 208, 30)),
                ),
              ),
              Expanded(
                child: Text('46.21%',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Digital',
                        fontSize: 20,
                        color: Color.fromARGB(255, 30, 193, 208))),
              ),
              Expanded(
                child: Text('1008.82hPa',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Digital',
                        fontSize: 20,
                        color: Color.fromARGB(255, 244, 229, 95))),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 1.70,
            child: LineChart(
              mainData(),
            ),
          )
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        // leftTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: true,
        //     interval: 1,
        //     getTitlesWidget: leftTitleWidgets,
        //     reservedSize: 42,
        //   ),
        // ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 10,
      maxY: 40,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 26.29),
            FlSpot(2.6, 27.34),
            FlSpot(4.9, 25.21),
            FlSpot(6.8, 21.15),
            FlSpot(8, 20.14),
            FlSpot(9.5, 19.52),
            FlSpot(11, 19.23),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Digital',
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '00:00';
        break;
      case 1:
        text = '04:00';
        break;
      case 3:
        text = '08:00';
        break;
      case 5:
        text = '12:00';
        break;
      case 8:
        text = '16:00';
        break;
      case 10:
        text = '20:00';
        break;
      case 11:
        text = '23:59';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }
}
