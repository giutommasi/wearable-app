import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  bool _obscureTextPassword = true;
  final _focusNodeEmail = FocusNode();
  final _focusNodePw = FocusNode();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _formWidget(),
                _signInButton(),
              ],
            ),
          ],
        ),
      );

  Widget _formWidget() => Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 14.0,
              ),
              width: 290,
              height: 350,
              child: Form(
                child: Column(
                  children: [
                    _emailField(),
                    _passwordField(),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.topLeft,
                      child: _checkBox(),
                    ),
                    const SizedBox(height: 70),
                    Container(
                        //padding: const EdgeInsets.only(right: 20),
                        alignment: Alignment.bottomCenter,
                        child: _forgotPwButton()),
                  ],
                ),
              )),
        ),
      );

  Widget _checkBox() => Row(children: [
        Checkbox(
            value: isChecked,
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(Colors.pink.shade200),
            activeColor: Colors.pink.shade200,
            onChanged: (newBool) {
              setState(() {
                isChecked = newBool!;
              });
            }),
        TextButton(
            onPressed: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: const Text(
              'Remember Me',
              style: TextStyle(color: Color(0xFFF48FB1)),
            ))
      ]);

  Widget _emailField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: TextFormField(
          focusNode: _focusNodeEmail,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
              hintText: 'Email address',
              hintStyle: TextStyle(color: Color(0xFFF48FB1), fontSize: 17.0),
              icon: Icon(Icons.email_outlined,
                  color: Color(0xFFF48FB1), size: 22.0)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          onFieldSubmitted: (_) {
            _focusNodePw.requestFocus();
          },
        ),
      );

  Widget _passwordField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: TextFormField(
          focusNode: _focusNodePw,
          obscureText: _obscureTextPassword,
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
          decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.pink.shade200)),
              hintText: 'Password',
              hintStyle:
                  const TextStyle(color: Color(0xFFF48FB1), fontSize: 17.0),
              icon: const Icon(Icons.lock_outline,
                  color: Color(0xFFF48FB1), size: 22.0),
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        _obscureTextPassword = !_obscureTextPassword;
                      },
                    );
                  },
                  child: Icon(
                      _obscureTextPassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      size: 15,
                      color: const Color(0xFFF48FB1)))),
        ),
      );

  Widget _forgotPwButton() => TextButton(
      onPressed: () {}, //TODO//,
      child: const Text(
        'Forgot password?',
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFFF48FB1),
          //fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ));

  Widget _signInButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          surfaceTintColor: const Color(0xFFF48FB1),
          backgroundColor: const Color(0xFFF48FB1),
          elevation: 2,
          //border: Border.all(color: const Color.fromARGB(244, 13, 109, 120), width: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () {
          if (isChecked) {
            _HomePage(context);
          }
          _HomePage(context);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 9),
          child: Text('LOGIN',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      );
}

void _HomePage(BuildContext context) {
  Navigator.pop(context);
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => (const HomePage())));
}
