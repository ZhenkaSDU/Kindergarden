import 'dart:developer';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_basics/home/logic/bloc/save_child_bloc.dart';
import 'package:the_basics/home/m2_2_screen.dart';

import '../core/common/custom_button.dart';
import '../core/get_it/injection_container.dart';

class M2AddScreen extends StatefulWidget {
  const M2AddScreen({super.key});

  @override
  State<M2AddScreen> createState() => _M2AddScreenState();
}

class _M2AddScreenState extends State<M2AddScreen> {
  bool isChecked = false;
  TextEditingController sessionIdController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveChildBloc, SaveChildState>(
      listener: (context, state) {
        if (state is SaveChildSuccess) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const M2_2Screen()));
        }
      },
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [
              0.1,
              0.2,
              0.9
            ],
                colors: [
              Color(0xFFE7FFE9),
              Color(0xFFF4FFF5),
              Color(0xFFFFFFFF),
            ])),
        child: BlocBuilder<SaveChildBloc, SaveChildState>(
          builder: (context, state) {
            return Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/svg/pho3.png",
                            height: 61,
                            width: 50,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text("Rainbow Kindergarder"),
                                  Text("Sunday - 24/07/22"),
                                ],
                              ),
                              Container(
                                  width: 80, child: const Icon(Icons.menu))
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
                          const Text("List of the children"),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(Icons.add_circle),
                                Text("There are no children register")
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ":Add child",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text("Session ID"),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  SizedBox(
                                    width: 310,
                                    child: TextField(
                                      controller: sessionIdController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '',
                                        isDense: true, // Added this
                                        contentPadding:
                                            EdgeInsets.all(8), // Added this
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text("ID"),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  SizedBox(
                                    width: 310,
                                    child: TextField(
                                      controller: idController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '',
                                        isDense: true, // Added this
                                        contentPadding:
                                            EdgeInsets.all(8), // Added this
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text("First Name"),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  SizedBox(
                                    width: 310,
                                    child: TextField(
                                      controller: nameController,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '',
                                        isDense: true, // Added this
                                        contentPadding:
                                            EdgeInsets.all(8), // Added this
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text("Last Name"),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  SizedBox(
                                    width: 310,
                                    child: TextField(
                                      controller: surnameController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '',
                                        isDense: true, // Added this
                                        contentPadding:
                                            EdgeInsets.all(8), // Added this
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text("Phone Number"),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  SizedBox(
                                    width: 310,
                                    child: TextField(
                                      controller: phoneController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '',
                                        isDense: true, // Added this
                                        contentPadding:
                                            EdgeInsets.all(8), // Added this
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  SizedBox(
                                      width: 310,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: const LinearGradient(
                                              begin:
                                                  FractionalOffset.centerLeft,
                                              end: FractionalOffset.centerRight,
                                              stops: [
                                                0.1,
                                                0.8
                                              ],
                                              colors: [
                                                Color(0xff37F9A7),
                                                Color(0xffA9F9B1),
                                              ]),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: const LinearGradient(
                                                begin:
                                                    FractionalOffset.centerLeft,
                                                end: FractionalOffset
                                                    .centerRight,
                                                stops: [
                                                  0.1,
                                                  0.9
                                                ],
                                                colors: [
                                                  Color(0xffA9F9B1),
                                                  Color(0xff37F9A7),
                                                ]),
                                          ),
                                          child: CustomButton(
                                            text: "Save",
                                            onTap: () {
                                              context.read<SaveChildBloc>().add(
                                                  SaveData(
                                                      sessionIdController.text,
                                                      idController.text,
                                                      nameController.text,
                                                      surnameController.text,
                                                      phoneController.text));

                                              setState(() {});
                                            },
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }
}
