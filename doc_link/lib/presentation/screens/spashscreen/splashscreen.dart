import 'package:doc_link/presentation/screens/bottomnav/bottomnav.dart';
import 'package:doc_link/presentation/screens/loginscreen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHomescreen();
    super.initState();
  }

//?Navigating Function
  navigateToHomescreen() async {
    await Future.delayed(const Duration(seconds: 3));

    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const BottomNav();
        }),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 26, 120),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "asset_images/online-doctor-consultation-flat-design-logo-aplication-doctor-cartoon-for-mobile-app-free-vector-removebg-preview.png",
              fit: BoxFit.fill,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
            )
          ],
        ),
      ),
    );
  }
}
