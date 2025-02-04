import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:models4life/core/app/store/auth/user_data.dart';
import 'package:models4life/features/regist/presentation/widgets/alert_reg.dart';

class Regist extends StatelessWidget {
  const Regist({super.key, required this.registration});
  final UserData registration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Center(
                  child: Container(
            padding: const EdgeInsets.all(30),
            height: 600,
            width: 750,
            decoration: const BoxDecoration(
                color: const Color.fromARGB(255, 46, 46, 46),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Регистрация',
                  style: TextStyle(
                      fontFamily: 'Validex', fontSize: 35, color: Colors.white),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: registration.login,
                  maxLength: 30,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Введите почту',
                      hintStyle: TextStyle(
                          fontFamily: 'Validex', color: Colors.white)),
                ),
                const SizedBox(
                  height: 7,
                ),
                Observer(
                  builder: (_) => TextField(
                    controller: registration.password,
                    maxLength: 30,
                    obscureText: registration.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Введите пароль',
                        hintStyle: const TextStyle(
                            fontFamily: 'Validex', color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              registration.changerPass();
                            },
                            icon: Icon(
                              registration.passVisib
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye,
                              color: Colors.white,
                            ))),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Observer(
                  builder: (_) => TextField(
                    controller: registration.checkPassword,
                    maxLength: 30,
                    obscureText: registration.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Повторите пароль',
                        hintStyle: const TextStyle(
                            fontFamily: 'Validex', color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              registration.changerPass();
                            },
                            icon: Icon(
                              registration.passVisib
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye,
                              color: Colors.white,
                            ))),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (registration.password.text !=
                            registration.checkPassword.text) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText: 'Пароли не совпадают!',
                                  ));
                        } else if (registration.password.text.length < 6 ||
                            registration.checkPassword.text.length < 6) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText:
                                        'Пароль должен быть больше шести символов!',
                                  ));
                        } else if (registration.password.text.isEmpty ||
                            registration.checkPassword.text.isEmpty ||
                            registration.login.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText: 'Заполни все поля!',
                                  ));
                        } else {
                          try {
                            await registration.signUp();
                            if (registration.user == null) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Пользователь существует')));
                            } else {
                              // ignore: use_build_context_synchronously
                              context.go('/');
                            }
                          } catch (error) {
                            // Show error message to user
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Пользователь существует'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                            fontFamily: 'Validex',
                            color: Color.fromARGB(255, 46, 46, 46)),
                      )),
                )
              ],
            ),
          )))
        ],
      ),
    );
  }
}
