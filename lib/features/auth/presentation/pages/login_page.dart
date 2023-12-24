import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  bool _remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Gap(50),
              const SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  minHeight: 12.0,
                  backgroundColor: Color(0xff6949FF),
                  color: Color(0xff6949FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  value: 0.5,
                ),
              ),
              const Gap(40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                  Gap(5),
                  Icon(
                    FontAwesomeIcons.user,
                    color: Color(0xff6949FF),
                  ),
                ],
              ),
              const Gap(20),
              Column(
                children: [
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
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6949FF)),
                      ),
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Color(0xff2F2F2F)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Color(0xff927AFF),
                                )),
                    ),
                  ),
                ],
              ),
              const Gap(4),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: const Color(0xff927AFF),
                        value: _remember,
                        onChanged: (val) {
                          setState(() {
                            _remember = val!;
                          });
                        }),
                  ),
                  const Text("Remember me"),
                ],
              ),
              Column(
                children: [
                  const Center(
                    child: Text(
                      "or",
                      style: TextStyle(fontSize: 25, color: Color(0xff6949FF)),
                    ),
                  ),
                  const Gap(20),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    elevation: 4.0,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textColor: const Color(0xff2F2F2F),
                    color: Colors.white,
                    child: const Text(
                      "Continue With Google",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(50.0),
        child: MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          textColor: Colors.white,
          color: const Color(0xff6949FF),
          child: const Text(
            "Sign up",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
