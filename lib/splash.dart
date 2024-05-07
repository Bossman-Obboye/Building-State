import 'package:building/main.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _initiatHomeScreen() async {
    await Future.delayed(
        const Duration(
          milliseconds: 1000,
        ), () {
      
    });
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => const MainApp(),
        ),
      );
  }

  @override
  void initState() {
    super.initState();
    _initiatHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('assets/images/Snicker.png'),
                height: 100,
                width: 100,
                fit: BoxFit.cover),
            Text(
              "MY APP",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
