import 'package:flutter/material.dart';
import 'package:flutter2/EXERCISE-2/ColorCounters.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create:(context)=>ColorCounters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
      )
  );
}

enum CardType { red, blue }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  @override
  Widget build(BuildContext context) {
    final colorCounters = Provider.of<ColorCounters>(context);
    return Scaffold( // Add this Scaffold
      appBar: AppBar(title: Text('Color Counter')),
      body: Column(
        children: [
          ColorTap(
            type: CardType.red,
            tapCount: colorCounters.redTapCount,
            onTap: colorCounters.incrementRed,
          ),
          ColorTap(
            type: CardType.blue,
            tapCount: colorCounters.blueTapcount,
            onTap: colorCounters.incrementblue,
          ),
        ],
      ),
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
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(type: CardType.red, tapCount: redTapCount, onTap: onRedTap),
          ColorTap(
            type: CardType.blue,
            tapCount: blueTapCount,
            onTap: onBlueTap,
          ),
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