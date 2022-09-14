import 'package:adminapp/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../widgets/textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _wtspcontroller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  late final String newwtsp;
  late final String newnum1;
  late final String newnum2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assetes/images/logo.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.13),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 2,
                color: darkBlueColor,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                //Text1
                child: TextFField(
                  controller: _controller1,
                  icon: const Icon(
                    Icons.call,
                    color: darkBlueColor,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                child: TextFField(
                  controller: _controller2,
                  icon: const Icon(
                    Icons.call,
                    color: darkBlueColor,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                child: TextFField(
                  controller: _wtspcontroller,
                  icon: const Icon(
                    Icons.whatsapp,
                    color: darkBlueColor,
                    size: 35,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SubmitButton(
                onTap: () {
                  setState(() {
                    if (_wtspcontroller.text.isNotEmpty) {
                      FirebaseFirestore.instance
                          .collection('contact')
                          .doc('oGI4A5uKGlUrVdVKG5Nm')
                          .update({
                        'wtspnum': _wtspcontroller.text,
                      });
                    }
                    if (_controller1.text.isNotEmpty) {
                      FirebaseFirestore.instance
                          .collection('contact')
                          .doc('oGI4A5uKGlUrVdVKG5Nm')
                          .update({
                        'num1': _controller1.text,
                      });
                    }
                    if (_controller2.text.isNotEmpty) {
                      FirebaseFirestore.instance
                          .collection('contact')
                          .doc('oGI4A5uKGlUrVdVKG5Nm')
                          .update({
                        'num2': _controller2.text,
                      });
                    }
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content:
                          Text('les modifications ont été bien enregistrées')));
                          _controller1.clear();
                          _controller2.clear();
                          _wtspcontroller.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
