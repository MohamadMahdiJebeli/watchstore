import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/components/theme.dart';
import 'package:watchstore/data/repo/cartRepo.dart';
import 'package:watchstore/route/routes.dart';
import 'package:watchstore/screens/auth/cubit/auth_cubit.dart';
import 'package:watchstore/screens/cart/bloc/cart_bloc.dart';
import 'package:watchstore/screens/splashScreen.dart';
import 'package:watchstore/utils/sharedPreferencesManger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) {
        final cartBloc = CartBloc(cartRepository);
        cartBloc.add(CartInitEvent());
        cartBloc.add(CartItemCountEvent());
        return cartBloc;
      },
    ),
    BlocProvider(
      create: (context) => AuthCubit(),
    ),
  ],
  child: MaterialApp(
    title: 'Watch Store',
    theme: lightTheme(),
    routes: routes,
    home: BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is LoggedInState) {
          return const SplashScreen();
        } else if (state is LoggedOutState) {
          return const SplashScreen();
          // SendSMS_Screen();
        } else {
          return const SplashScreen();
          // SendSMS_Screen();
        }
      },
    ),
  ),
);
}}