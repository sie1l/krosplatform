import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorState(),
      child: const MyApp(),
    ),
  );
}


class ColorState with ChangeNotifier {
  double _red = 50;
  double _green = 203;
  double _blue = 43;

  double get red => _red;
  double get green => _green;
  double get blue => _blue;

  Color get currentColor => Color.fromRGBO(_red.toInt(), _green.toInt(), _blue.toInt(), 1.0);

  void updateRed(double value) {
    _red = value;
    notifyListeners();
  }

  void updateGreen(double value) {
    _green = value;
    notifyListeners();
  }

  void updateBlue(double value) {
    _blue = value;
    notifyListeners();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo Home Page"),
          backgroundColor: Colors.deepPurple[100],
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorPreviewWidget(),

              SizedBox(height: 50),

              ColorSlidersWidget(),
            ],
          ),
        ),
      ),
    );
  }
}


class ColorPreviewWidget extends StatelessWidget {
  const ColorPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorState>(
      builder: (context, colorState, child) {
        return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: colorState.currentColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        );
      },
    );
  }
}


class ColorSlidersWidget extends StatelessWidget {
  const ColorSlidersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorState = context.watch<ColorState>();

    return Column(
      children: [
        _buildSliderRow(
          label: "Red",
          value: colorState.red,
          color: Colors.red,
          onChanged: (val) => context.read<ColorState>().updateRed(val),
        ),
        _buildSliderRow(
          label: "Green",
          value: colorState.green,
          color: Colors.green,
          onChanged: (val) => context.read<ColorState>().updateGreen(val),
        ),
        _buildSliderRow(
          label: "Blue",
          value: colorState.blue,
          color: Colors.blue,
          onChanged: (val) => context.read<ColorState>().updateBlue(val),
        ),
      ],
    );
  }

  Widget _buildSliderRow({
    required String label,
    required double value,
    required Color color,
    required Function(double) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "$label: ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              value.toInt().toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        Slider(
          value: value,
          min: 0,
          max: 255,
          activeColor: color,
          thumbColor: color,
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}