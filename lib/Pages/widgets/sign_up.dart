import 'package:crypt/crypt.dart';
import 'package:pregnancy_health/database/entities/profile.dart';
import 'package:pregnancy_health/database/entities/user.dart';
import 'package:pregnancy_health/repositories/profile_repository.dart';
import 'package:pregnancy_health/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false; //This variable allow to change the checkBox's status
  bool _obscureTextPassword = true; //Allow to obscure pw
  final _focusNodeName =
      FocusNode(); //Allow to jump to the next TextField/Page when the user click ok in the keyboard
  final _focusNodeLastName =
      FocusNode(); //Allow to jump to the next TextField/Page when the user click ok in the keyboard
  final _focusNodeEmail =
      FocusNode(); //Allow to jump to the next TextField/Page when the user click ok in the keyboard
  final _focusNodePw =
      FocusNode(); //Allow to jump to the next TextField/Page when the user click ok in the keyboard
  final _focusNodeRepeatPw = FocusNode();

  late String _username, _password, _firstName, _lastName;
  final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();

  RegExp digitNameValidator = RegExp('[a-z A-Z]'); //Constrains in textNameInput

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _formWidget(),
              ],
            ),
          ],
        ),
      );

  Widget _formWidget() => Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
              width: 290,
              height: 530,
              child: SingleChildScrollView(
                  child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _firstNameField(),
                    _lastNameField(),
                    _emailField(),
                    _passwordField(),
                    const SizedBox(height: 30),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.pink.shade200),
                        )),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/google_logo.png"),
                            height: 18.0,
                            width: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24, right: 8),
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _signInButton()
                  ],
                ),
              ))),
        ),
      );

  Widget _firstNameField() => Padding(
        padding: const EdgeInsets.only(right: 14.0, top: 8.0, left: 14.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofillHints: const [
            AutofillHints.name
          ], //Il telefono suggerisce nome/email o qualsiasi altro dato dell'utente
          focusNode: _focusNodeName,
          inputFormatters: [
            FilteringTextInputFormatter.allow(digitNameValidator)
          ],
          validator: (value) =>
              value != null && value.isNotEmpty && value.length <= 14
                  ? null
                  : "Please enter your name",
          onSaved: (newValue) => _firstName = newValue!,
          maxLength: 14,
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
              hintText: 'Enter your First name',
              hintStyle: TextStyle(
                  color: Color.fromARGB(255, 244, 143, 177), fontSize: 17.0),
              icon: Icon(Icons.person_outlined,
                  color: Color(0xFFF48FB1), size: 22.0)),
          onFieldSubmitted: (_) {
            setState(() {
              _focusNodeLastName.requestFocus();
            });
          },
        ),
      );

  Widget _lastNameField() => Padding(
        padding: const EdgeInsets.only(right: 14.0, top: 8.0, left: 14.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          autofillHints: const [
            AutofillHints.familyName
          ], //Il telefono suggerisce nome/email o qualsiasi altro dato dell'utente
          focusNode: _focusNodeLastName,
          inputFormatters: [
            FilteringTextInputFormatter.allow(digitNameValidator)
          ],
          validator: (value) =>
              value != null && value.isNotEmpty && value.length <= 14
                  ? null
                  : "Please enter your name",
          onSaved: (newValue) => _lastName = newValue!,
          maxLength: 14,
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
              hintText: 'Enter your Last name',
              hintStyle: TextStyle(color: Color(0xFFF48FB1), fontSize: 17.0),
              icon: Icon(Icons.person_outlined,
                  color: Color(0xFFF48FB1), size: 22.0)),
          onFieldSubmitted: (_) {
            setState(() {
              _focusNodeEmail.requestFocus();
            });
          },
        ),
      );

  Widget _emailField() => Padding(
        padding: const EdgeInsets.only(right: 14.0, left: 14, bottom: 0),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autofillHints: const [AutofillHints.email],
              // onTapOutside: (void onClick) => Navigator.pop(context), se clicchi fuori dal testo, check email corretta/errata, da implementare[...]
              focusNode: _focusNodeEmail, //Definisco nodo
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
              validator: (email) => validateEmail(email),
              onSaved: (newValue) => _username = newValue!,
              decoration: InputDecoration(
                  errorStyle: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      height: 0),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
                  hintText: 'Email address',
                  hintStyle:
                      const TextStyle(color: Color(0xFFF48FB1), fontSize: 17.0),
                  icon: const Icon(Icons.email_outlined,
                      color: Color(0xFFF48FB1), size: 22.0)),
              onFieldSubmitted: (_) {
                _focusNodePw.requestFocus();
              },
            ),
          ],
        ),
      );

  Widget _passwordField() => Padding(
        padding: const EdgeInsets.only(right: 14.0, left: 14, bottom: 0),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: _focusNodePw,
              obscureText: _obscureTextPassword,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
              validator: (p) => validatePassword(p),
              controller: password,
              onSaved: (newValue) => _password = newValue!,
              decoration: InputDecoration(
                  errorStyle: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      height: 0),
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
              onFieldSubmitted: (_) {
                _focusNodeRepeatPw.requestFocus();
              },
              textInputAction: TextInputAction
                  .go, //Cosi dico che inserimento dati è terminato e posso inviarli
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: _focusNodeRepeatPw,
              obscureText: _obscureTextPassword,
              keyboardType: TextInputType.visiblePassword,
              validator: (p) {
                return p != password.text ? "Password must match" : null;
              },
              style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
              decoration: InputDecoration(
                  errorStyle: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      height: 0),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.pink.shade200)),
                  //border: InputBorder.none,
                  hintText: 'Re-enter Password',
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
              textInputAction: TextInputAction
                  .go, //Cosi dico che inserimento dati è terminato e posso inviarli
            ),
          ],
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
        onPressed: () {
          print("Valid: ${_formKey.currentState!.validate()}");

          final valid = _formKey.currentState != null &&
              _formKey.currentState!.validate();
          if (valid) {
            doRegister();
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 9),
          child: Text('SIGNUP',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      );

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return 'Email cannot be blank';
    }

    return !regex.hasMatch(value) ? 'Enter a valid email address' : null;
  }

  String? validatePassword(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return 'Password cannot be blank';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Must contains one number';
    }

    if (value.length < 7 || value.length > 14) {
      return 'Min 7 and max 14 characters';
    }
    return null;
  }

  void doRegister() async {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();

      final userRepo = Provider.of<UserRepository>(context, listen: false);
      final profileRepo =
          Provider.of<ProfileRepository>(context, listen: false);

      int? users = await userRepo.countUser(_username);

      if (users > 0) {
        if (context.mounted) {
          const snackBar = SnackBar(
            content: Text('Email already registered'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        return;
      }

      // Default rounds and random salt generated
      _password = Crypt.sha256(password.text, rounds: 10000, salt: 'abcde1234')
          .toString();

      await userRepo.insert(User(username: _username, password: _password));

      await profileRepo.insert(Profile(
          profileUsername: _username,
          firstName: _firstName,
          lastName: _lastName,
          timestamp: DateTime.now()));

      form.reset();
      if (context.mounted) {
        const snackBar = SnackBar(
          content: Text('Signed Up successfully!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        return;
      }
    }
  }
}
