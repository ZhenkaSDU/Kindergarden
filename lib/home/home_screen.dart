

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:the_basics/core/get_it/injection_container.dart';
import 'package:the_basics/features/auth/auth_code_screen.dart';
import 'package:the_basics/core/common/custom_button.dart';
import 'package:the_basics/home/m2_screen.dart';
import 'package:the_basics/logic/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'm2_2_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()..add(AuthLogin(phoneController.text)),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            log("SUCCESS");
          }
          if (state is AuthFailure) {
            log("FAILURE");
            switch (state.response.statusCode) {
              case 400:
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Номер - необходимо для заполнения")));
                break;
              case 500:
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Произошла непредвиденная ошибка")));
                break;
              default:
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("shut")));
                break;
            }
          }
        },
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.1, 0.2, 0.9],
                colors: [
                  Color(0xFFE7FFE9),
                  Color(0xFFF4FFF5),
                  Color(0xFFFFFFFF),

                ]
              )
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/svg/pho3.png", height: 61, width: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Rainbow Kindergarder"),
                                Text("Sunday - 24/07/22"),
                              ],
                            ),
                            Container(
                              width: 80,
                              child: Icon(Icons.menu)
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  Image.asset("assets/images/svg/pho4.png"),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "There are no children registered in the system",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 14,
                  ),

                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 310,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                        // begin: FractionalOffset.centerLeft,
                        // end: FractionalOffset.centerRight,
                        stops: [0.07, 0.9],
                        colors: [
                          Color(0xffA9F9B1),
                          Colors.greenAccent,
                        ]),
                      ),
                      child: CustomButton(
                        text: "+ Add Children",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const M2Screen()));
                          context
                              .read<AuthBloc>()
                              .add(AuthLogin(phoneController.text));
                        },
                        color: Colors.transparent,

                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                    SizedBox(
                        width: 310,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                                begin: FractionalOffset.centerLeft,
                                end: FractionalOffset.centerRight,
                                stops: [0.1, 0.9],
                                colors: [
                                  Color(0xffA9F9B1),
                                  Color(0xff37F9A7),
                                ]),
                          ),
                          child: CustomButton(
                            text: "+ Add Children",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const M2_2Screen()));
                              context
                                  .read<AuthBloc>()
                                  .add(AuthLogin(phoneController.text));
                            },
                            color: Colors.transparent,

                          ),
                        )),

              ],
            )),
          ),
      ),
    );
  }
}
