import 'package:animate_z_widget/animate_z_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AnimationType _animationType = AnimationType.rotate;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimateZWidget(
              animationType: _animationType,
              animate: true,
              child: const FlutterLogo(
                size: 50,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _animationType = AnimationType.rotate;
                });
              },
              child: const Text("Rotation Animation")),
          TextButton(
              onPressed: () {
                setState(() {
                  _animationType = AnimationType.flip;
                });
              },
              child: const Text("Flip Animation")),
          TextButton(
              onPressed: () {
                setState(() {
                  _animationType = AnimationType.scale;
                });
              },
              child: const Text("Scale Animation")),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AnimateZWidget(
          animate: false,
          child: FlutterLogo(
            size: 20,
          ),
        ),
      ),
    );
  }
}
