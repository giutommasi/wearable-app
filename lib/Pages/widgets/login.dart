import 'package:crypt/crypt.dart';
import 'package:pregnancy_health/Pages/widgets/profile_alert.dart';
import 'package:pregnancy_health/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../database/entities/profile.dart';
import '../../database/entities/user.dart';
import '../../repositories/user_repository.dart';
import '../home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  bool _obscureTextPassword = true;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  final _focusNodeEmail = FocusNode();
  final _focusNodePw = FocusNode();

  @override
  void initState() {
    super.initState();
    setSavedUsername();
  }

  Future<void> setSavedUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString("saved_username");

    if (savedUsername != null) {
      username.text = savedUsername;
      setState(() {
        isChecked = true;
      });
    }
  }

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
          controller: username,
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
          controller: password,
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

  Widget _signInButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          surfaceTintColor: const Color(0xFFF48FB1),
          backgroundColor: const Color(0xFFF48FB1),
          elevation: 2,
          //border: Border.all(color: const Color.fromARGB(244, 13, 109, 120), width: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () async {
          final userRepo = Provider.of<UserRepository>(context, listen: false);
          final profileRepo =
              Provider.of<ProfileRepository>(context, listen: false);

          // Default rounds and random salt generated
          final hashedPwd =
              Crypt.sha256(password.text, rounds: 10000, salt: 'abcde1234')
                  .toString();
          User? user = await userRepo.selectUser(username.text, hashedPwd);
          Profile? profile = await profileRepo.selectProfile(username.text);

          if (user == null || profile == null) {
            if (context.mounted) {
              const snackBar = SnackBar(
                content: Text('Credentials not valid'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            return;
          }

          if (isChecked) {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setString("saved_username", username.text);
            prefs.setString("username", username.text);
          }

          if (context.mounted) {
            _homePage(context);
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 9),
          child: Text('LOGIN',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      );
}

void _homePage(BuildContext context) async {
  final profileRepo = Provider.of<ProfileRepository>(context, listen: false);
  Profile profile = profileRepo.signedProfile;

  if (profile.birthday == null || profile.pregnantWeek == null) {
    ProfileAlert alert = ProfileAlert(profile: profile);
    bool? profileUpdated = await alert.showProfileAlert(context);
    if (profileUpdated != null && profileUpdated) {
      if (context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => (const HomePage())));
      }
    }
  } else {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => (const HomePage())));
  }
}
