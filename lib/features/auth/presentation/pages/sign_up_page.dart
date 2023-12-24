import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  DateTime date = DateTime.now();
  TextEditingController dateOfBirth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Column(
                children: [
                  Gap(50),
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      minHeight: 12.0,
                      backgroundColor: Color(0xffEFEFEF),
                      color: Color(0xff6949FF),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      value: 0.5,
                    ),
                  ),
                  Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create an account ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                        textAlign: TextAlign.center,
                      ),
                      Gap(5),
                      Icon(
                        FontAwesomeIcons.pencil,
                        color: Color(0xff6949FF),
                      ),
                    ],
                  ),
                  Gap(20),
                  Text(
                      "              Please complete your profile.\n Don't worry, your data will remain private and \n                      only you can see it.",
                      style: TextStyle(fontSize: 15, height: 1.5)),
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    cursorColor: const Color(0xff927AFF),
                    decoration: const InputDecoration(
                      labelText: " Full Name",
                      labelStyle: TextStyle(color: Color(0xff2F2F2F)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff927AFF)),
                      ),
                    ),
                  ),
                  const Gap(8),
                  TextFormField(
                    cursorColor: const Color(0xff927AFF),
                    decoration: const InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(color: Color(0xff2F2F2F)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff927AFF)),
                      ),
                    ),
                  ),
                  const Gap(8),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: const Color(0xff927AFF),
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: TextStyle(color: Color(0xff2F2F2F)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff927AFF)),
                      ),
                    ),
                  ),
                  const Gap(8),
                  TextFormField(
                    cursorColor: const Color(0xff927AFF),
                    decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Color(0xff2F2F2F)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff927AFF)),
                      ),
                    ),
                  ),
                  const Gap(8),
                  TextFormField(
                    cursorColor: const Color(0xff927AFF),
                    decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Color(0xff2F2F2F)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff927AFF)),
                      ),
                    ),
                  ),
                  const Gap(8),
                  TextFormField(
                    cursorColor: const Color(0xff927AFF),
                    decoration: const InputDecoration(
                      labelText: "Password Confirmation",
                      labelStyle: TextStyle(color: Color(0xff2F2F2F)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff927AFF)),
                      ),
                    ),
                  ),
                  const Gap(8),
                  TextFormField(
                    cursorColor: const Color(0xff927AFF),
                    decoration: const InputDecoration(
                      labelText: "Country",
                      labelStyle: TextStyle(color: Color(0xff2F2F2F)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff927AFF)),
                      ),
                    ),
                  ),
                  const Gap(8),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: const Color(0xff927AFF),
                    decoration: const InputDecoration(
                      labelText: "Age",
                      labelStyle: TextStyle(color: Color(0xff2F2F2F)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff927AFF)),
                      ),
                    ),
                  ),
                  const Gap(8),
                  GestureDetector(
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context, initialDate: date, firstDate: DateTime(1980), lastDate: DateTime(2100));

                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                        dateOfBirth.text = newDate.toIso8601String().substring(0, 10);
                        print(newDate);
                      });
                    },
                    child: TextFormField(
                      controller: dateOfBirth,
                      cursorColor: const Color(0xff927AFF),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xff927AFF),
                        ),
                        labelText: "Date of Birth",
                        enabled: true,
                        labelStyle: TextStyle(color: Color(0xff2F2F2F)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff927AFF)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
