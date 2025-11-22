import 'package:flutter/material.dart';

class ContainerConfigurator extends StatefulWidget {
  const ContainerConfigurator({super.key});

  @override
  State<ContainerConfigurator> createState() => _ContainerConfiguratorState();
}

class _ContainerConfiguratorState extends State<ContainerConfigurator> {
  double _width = 100.0;
  double _height = 100.0;
  double _topRightRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          _buildControlLabel("Ширина", _width),
          Slider(
            value: _width,
            min: 50.0,
            max: 300.0,
            onChanged: (value) => setState(() => _width = value),
          ),

          _buildControlLabel("Висота", _height),
          Slider(
            value: _height,
            min: 50.0,
            max: 300.0,
            onChanged: (value) => setState(() => _height = value),
          ),

          _buildControlLabel("Радіус", _topRightRadius),
          Slider(
            value: _topRightRadius,
            min: 0.0,
            max: 100.0,
            onChanged: (value) => setState(() => _topRightRadius = value),
          ),

          const Divider(height: 40, thickness: 2),

          Center(
            child: RedContainer(
              width: _width,
              height: _height,
              topRightRadius: _topRightRadius,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlLabel(String label, double value) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: Text(
        "$label: ${value.toStringAsFixed(2)}",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class RedContainer extends StatelessWidget {
  final double width;
  final double height;
  final double topRightRadius;

  const RedContainer({
    super.key,
    required this.width,
    required this.height,
    required this.topRightRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(topRightRadius),
        ),
      ),
    );
  }
}