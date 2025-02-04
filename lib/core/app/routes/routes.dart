import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:models4life/core/app/store/auth/user_data.dart';
import 'package:models4life/core/app/store/cart/cart.dart';
import 'package:models4life/core/app/store/whaitlist/whaitlist.dart';
import 'package:models4life/features/auth/presentation/auth.dart';
import 'package:models4life/features/cart/presentation/pages/cart_page.dart';
import 'package:models4life/features/main_page/presentation/pages/main_page.dart';
import 'package:models4life/features/regist/presentation/pages/regist.dart';
import 'package:models4life/features/user_page/presentation/pages/user_page.dart';
import 'package:models4life/features/whaitlist/presentation/pages/whaitlist_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final passCheck = UserData();
    final cart = Cart();
    final whaitlist = Whaitlist();

    passCheck.userCheck();
    if (passCheck.user != null) {
      passCheck.getUserData();
      passCheck.getCart();
      passCheck.loadAdresses();
      passCheck.loadCards();
      passCheck.fetchOrderHistory(passCheck.user!.id.toString());
    }
    final router = GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainPage(
          userData: passCheck,
          cart: cart,
          whaitlist: whaitlist,
        ),
      ),
      GoRoute(
        path: '/regist',
        builder: (context, state) => Regist(
          registration: passCheck,
        ),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => Auth(
          authentification: passCheck,
        ),
      ),
      GoRoute(
        path: '/user_page',
        builder: (context, state) => UserPage(
          userData: passCheck,
        ),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => CartPage(
          passCheck: passCheck,
          cart: cart,
        ),
      ),
      GoRoute(
        path: '/whaitlist',
        builder: (context, state) => WhaitlistPage(
          passCheck: passCheck,
          whaitlist: whaitlist,
        ),
      ),
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
