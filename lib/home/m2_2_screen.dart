
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/get_it/injection_container.dart';
import '../logic/bloc/auth_bloc.dart';

class M2_2Screen extends StatefulWidget {
  const M2_2Screen({super.key});

  @override
  State<M2_2Screen> createState() => _M2_2ScreenState();
}

class _M2_2ScreenState extends State<M2_2Screen> {

  Color someColor = Colors.grey;
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
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 20),
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
                    GridView.builder(
                          // padding: EdgeInsets.symmetric(horizontal: 12),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 20,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 18.0
                          ),
                          itemBuilder: (BuildContext context, int index){
                            return SizedBox(
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _buildPopupDialog(context),
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: someColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text("Some Child"),
                                          ],
                                        ),
                                        Image.asset("assets/images/svg/pho3.png")
                                      ],
                                    ),
                                  ),
                              ),
                            );
                          },
                        ),

                    
                  ],
                ),
              )),
        ),
      ),
    );
  }
  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
        title: const Text('Popup example'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      someColor = Colors.redAccent;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.redAccent,
                    child: Text("Won't came today"),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupDialogLate(context),
                    );
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.yellowAccent,
                    child: Text("Won't came today"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      someColor = Colors.greenAccent;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.greenAccent,
                    child: Text("Won't came today"),
                  ),
                ),

              ],
            ),
            Text("Hello"),
          ],
        ),
        actions: <Widget>[
        GestureDetector(

          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildPopupDialogLate(BuildContext context) {
    return AlertDialog(
      title: const Text('Popup example'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [

            ],
          ),
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  someColor = Colors.yellowAccent;
                });
              },
              child: Container(color: Colors.yellowAccent, child: const Text('Confirm')),
            ),
          ],
        ),
      ],
    );
  }

}
