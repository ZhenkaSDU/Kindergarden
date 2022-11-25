

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_basics/core/get_it/injection_container.dart';
import 'package:the_basics/logic/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'm2_add_screen.dart';

class M2Screen extends StatefulWidget {
  const M2Screen({super.key});

  @override
  State<M2Screen> createState() => _M2ScreenState();
}

class _M2ScreenState extends State<M2Screen> {
  bool isChecked = false;
  TextEditingController phoneController = TextEditingController();
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("List of the children"),
                        SizedBox(height: 10,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const M2AddScreen()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add_circle),
                              Text("There are no children register")
                            ],
                          ),
                        ),
                        SizedBox(height: 250,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("There is no children register")
                          ],
                        )
                      ],
                    ),
                  )

                ],
              )),
        ),
      ),
    );
  }
}
