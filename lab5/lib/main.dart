import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _size = 25.0;
const _bgColor = Colors.red;
const _borderColor = Colors.black;
const _borderWidth = 4.0;
const _borderRadius = 5.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pixel 4'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _buildFour(),
      ),
    );
  }

  List<Widget> _buildFour() {
    return [
      _line1(),
      _line1(),
      _lineFull(),
      _lineRight(),
      _lineRight(),
    ];
  }

  Widget _line1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildEmpty(),
        _buildEmpty(),
        _buildEmpty(),
        _buildDot(),
      ],
    );
  }

  Widget _lineFull() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildDot(),
        _buildDot(),
        _buildDot(),
        _buildDot(),
      ],
    );
  }

  Widget _lineRight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEmpty(),
        _buildEmpty(),
        _buildEmpty(),
        _buildEmpty(),
        _buildDot(),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox(
      width: _size,
      height: _size,
    );
  }
}