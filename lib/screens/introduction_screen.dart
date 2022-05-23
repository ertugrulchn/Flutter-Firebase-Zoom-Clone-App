import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import 'package:zoom_clone/screens/login_screen.dart';
import 'package:zoom_clone/utils/colors.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Bu Uygulama Ne İşe Yarar ?',
      body:
          'Bu uygulama ile istediğiniz kadar ücretsiz konuşabilirsiniz. Ekranı Paylaşabilir veya toplantılara ev sahipliği yapabilirsiniz',
      image: Center(
        child: Image.asset('assets/images/ebook.png'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Bu Uygulamayla Yapabilecekleriniz',
      body:
          'Bu uygulama ile canlı dersler yapabilir, toplantılar düzenleyebilir, arkadaşlarınızla sohbet edebilir ve sınırsızca konuşabilirsiniz.',
      image: Center(
        child: Image.asset('assets/images/manthumbs.png'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Hazır mısın ?',
      body:
          'Hazırsanız hemen başlayabiliriz, umarım uygulamamızı beğenirsiniz.',
      image: Center(
        child: Image.asset('assets/images/readingbook.png'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: secondaryBackgroundColor,
            activeSize: Size.square(25),
            activeColor: Colors.white,
          ),
          showDoneButton: true,
          done: const Text(
            'Tamamlandı',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          showSkipButton: true,
          skip: const Text(
            'Atla',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
            color: Colors.white,
          ),
          onDone: () => OnDone(context),
          curve: Curves.bounceInOut,
        ),
      ),
    );
  }

  void OnDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}
