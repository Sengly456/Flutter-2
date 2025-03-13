import 'package:flutter/material.dart';
import 'package:flutter2/EXERCISE-2/ColorCounters.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ColorCounters(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  ));
}

enum CardType { red, blue }




class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Consumer<ColorCounters>(
      builder: (context, colorCounters, child) {
        return Scaffold(
          body: colorCounters.currentIndex == 0
              ? ColorTapsScreen(
                  redTapCount: colorCounters.redTapCount,
                  blueTapCount: colorCounters.blueTapCount,
                  onRedTap: colorCounters.incrementRed,
                  onBlueTap: colorCounters.incrementBlue,
                )
              : StatisticsScreen(
                  redTapCount: colorCounters.redTapCount,
                  blueTapCount: colorCounters.blueTapCount,
                ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: colorCounters.currentIndex,
            onTap: colorCounters.setIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.tap_and_play),
                label: 'Taps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Statistics',
              ),
            ],
          ),
        );
      },
    );
  }
}



class ColorTapsScreen extends StatelessWidget {
  final int redTapCount;
  final int blueTapCount;
  final VoidCallback onRedTap;
  final VoidCallback onBlueTap;

  const ColorTapsScreen({
    super.key,
    required this.redTapCount,
    required this.blueTapCount,
    required this.onRedTap,
    required this.onBlueTap,
  });
  @override
  Widget build(BuildContext context) {
    print('tap');
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(type: CardType.red, tapCount: redTapCount, onTap: onRedTap),
          ColorTap(type: CardType.blue, tapCount: blueTapCount, onTap: onBlueTap),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.tapCount,
    required this.onTap,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    print('tap button');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  final int redTapCount;
  final int blueTapCount;

  const StatisticsScreen({
    super.key,
    required this.redTapCount,
    required this.blueTapCount,
  });

  @override
  Widget build(BuildContext context) {
    print('build statistic');
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Red Taps: $redTapCount', style: TextStyle(fontSize: 24)),
            Text('Blue Taps: $blueTapCount', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
