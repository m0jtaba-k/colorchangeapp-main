// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const ColorChangerApp());

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Color Changer',
      home: ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  // Current background color (starts with blue)
  Color _color = Colors.blue;

  // All possible gradient directions with labels
  final List<GradientDirection> _gradientOptions = [
    GradientDirection(Alignment.topCenter, Alignment.bottomCenter, 'Vertical'),
    GradientDirection(
      Alignment.centerLeft,
      Alignment.centerRight,
      'Horizontal',
    ),
    GradientDirection(
      Alignment.topLeft,
      Alignment.bottomRight,
      'Left-to-Right',
    ),
    GradientDirection(
      Alignment.topRight,
      Alignment.bottomLeft,
      'Right-to-Left',
    ),
  ];

  int _currentDirectionIndex = 0;

  void _changeColor() {
    setState(() {
      _color = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });
  }

  void _changeDirection() {
    setState(() {
      _currentDirectionIndex =
          (_currentDirectionIndex + 1) % _gradientOptions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentDirection = _gradientOptions[_currentDirectionIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: currentDirection.begin,
            end: currentDirection.end,
            colors: [_color, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _changeColor,
                child: const Text('Change Color'),
              ),
              const SizedBox(height: 20),
              Text(
                'Red: ${_color.red}, Green: ${_color.green}, Blue: ${_color.blue}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeDirection,
                child: const Text('Change Direction'),
              ),
              const SizedBox(height: 10),
              Text(
                'Direction: ${currentDirection.label}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper class to store gradient direction information
class GradientDirection {
  final Alignment begin;
  final Alignment end;
  final String label;

  const GradientDirection(this.begin, this.end, this.label);
}
