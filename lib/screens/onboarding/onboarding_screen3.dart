import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'input_name_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: height*0.1),
              child: SvgPicture.asset('assets/images/onboarding3.svg',color: Colors.black,height: height*0.3,),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fast Delivery',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enjoy quick and reliable delivery at your doorstep.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NameInputScreen()),
                );
              },
              child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Get Started',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
            ),
            Gap(height*0.1)
          ],
        ),
      ),
    );
  }
}