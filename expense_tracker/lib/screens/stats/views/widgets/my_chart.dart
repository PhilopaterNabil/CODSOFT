import 'dart:math';

import 'package:expense_tracker/constants/my_primary_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 4, left: 16, right: 4),
      child: BarChart(
        statsBarData(),
      ),
    );
  }

  BarChartData statsBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getBottomTitles,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 38,
            getTitlesWidget: getLeftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      barGroups: statsBarGroups(),
    );
  }

  List<BarChartGroupData> statsBarGroups() => List.generate(8, (index) {
        switch (index) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 1);
          case 2:
            return makeGroupData(2, 3);
          case 3:
            return makeGroupData(3, 4);
          case 4:
            return makeGroupData(4, 1);
          case 5:
            return makeGroupData(5, 2);
          case 6:
            return makeGroupData(6, 3);
          case 7:
            return makeGroupData(7, 2);
          default:
            return throw Error();
        }
      });

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 10,
          gradient: const LinearGradient(
            colors: [
              MyPrimaryColors.myLightBlue,
              MyPrimaryColors.myPurple,
              MyPrimaryColors.myOrange,
            ],
            transform: GradientRotation(pi / 40),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    switch (value.toInt()) {
      case 0:
        return const Text('01', style: style);
      case 1:
        return const Text('02', style: style);
      case 2:
        return const Text('03', style: style);
      case 3:
        return const Text('04', style: style);
      case 4:
        return const Text('05', style: style);
      case 5:
        return const Text('06', style: style);
      case 6:
        return const Text('07', style: style);
      case 7:
        return const Text('08', style: style);
      case 8:
        return const Text('09', style: style);
      case 9:
        return const Text('10', style: style);
      default:
        return const Text('');
    }
  }

  Widget getLeftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '\$ 0K';
        break;
      case 1:
        text = '\$ 1K';
        break;
      case 2:
        text = '\$ 2K';
        break;
      case 3:
        text = '\$ 3K';
        break;
      case 4:
        text = '\$ 4K';
        break;
      case 5:
        text = '\$ 5K';
        break;
      case 6:
        text = '\$ 6K';
        break;
      case 7:
        text = '\$ 7K';
        break;
      case 8:
        text = '\$ 8K';
        break;
      case 9:
        text = '\$ 9K';
        break;
      case 10:
        text = '\$ 10K';
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
