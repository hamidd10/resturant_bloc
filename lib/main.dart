import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app_bloc_design_pattern/bloc/cart_bloc/cart_bloc.dart';
import 'package:restaurant_app_bloc_design_pattern/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:restaurant_app_bloc_design_pattern/bloc/foods_bloc/food_bloc.dart';
import 'package:restaurant_app_bloc_design_pattern/bloc/user_bloc/user_cubit.dart';
import 'package:restaurant_app_bloc_design_pattern/screens/onboarding/onboarding_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FoodsBloc(),),
        BlocProvider(create: (context) => CartBloc(),),
        BlocProvider(create: (context) => FavoriteBloc(),),
        BlocProvider(create: (context) => UserCubit(),),
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: GoogleFonts.lato().fontFamily,
            scaffoldBackgroundColor: Colors.grey[100],
            colorScheme: ColorScheme.light(primary: Colors.amber,secondary: Colors.grey[100]!),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[100]
            )
        ),
        debugShowCheckedModeBanner: false,
        title: 'ARG Restaurant',
        home: const OnboardingScreen1(),
      ),
    );
  }
}
