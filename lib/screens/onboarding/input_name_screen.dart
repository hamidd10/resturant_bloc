import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_bloc_design_pattern/bloc/user_bloc/user_cubit.dart';

import '../main/main_wrapper.dart';

class NameInputScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  NameInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Let’s Get to Know You!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('What should we call you?'),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white
              ),
              child:  Center(child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  border: InputBorder.none,
                ),
              ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber
              ),
              onPressed: () {
                context.read<UserCubit>().setUserName(_controller.text);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainWrapper(),), (route) => false,);
              },
              child: const Text('Continue',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
