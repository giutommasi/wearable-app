import 'package:crypt/crypt.dart';
import 'package:exam/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../database/entities/profile.dart';
import '../database/entities/user.dart';
import '../repositories/user_repository.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User user;
  late Profile profile;
  final _formKey = GlobalKey<FormState>();
  bool _obscureTextPassword = true;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController pregWeek = TextEditingController();

  @override
  void initState() {
    super.initState();

    final userRepo = Provider.of<UserRepository>(context, listen: false);
    user = userRepo.signedUser;
    final profileRepo = Provider.of<ProfileRepository>(context, listen: false);
    profile = profileRepo.signedProfile;

    firstName.text = user.firstName;
    lastName.text = user.lastName;

    birthday.text = DateFormat("yyyy-MM-dd").format(profile.birthday!);
    pregWeek.text = profile.pregnantWeek.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                    controller: firstName,
                    keyboardType:
                        TextInputType.name, // Use email input type for emails.
                    decoration: _getDecoration("First Name", Icons.person)),
                TextFormField(
                    controller: lastName,
                    keyboardType:
                        TextInputType.name, // Use email input type for emails.
                    decoration: _getDecoration("Last Name", Icons.person)),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: _obscureTextPassword,
                    controller: password,
                    validator: (p) => validatePassword(p),
                    decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.pink.shade200)),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: Color(0xFFF48FB1), fontSize: 17.0),
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
                                color: const Color(0xFFF48FB1))))),
                TextFormField(
                    enabled: false,
                    controller: birthday,
                    decoration: _getDecoration("Birthday", Icons.celebration)),
                TextFormField(
                    enabled: false,
                    controller: pregWeek,
                    decoration:
                        _getDecoration("Pregnancy Week", Icons.pregnant_woman)),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final form = _formKey.currentState;
          if (form != null && form.validate()) {
            final hashedPwd =
                Crypt.sha256(password.text, rounds: 10000, salt: 'abcde1234')
                    .toString();

            user.firstName = firstName.text;
            user.lastName = lastName.text;
            user.password = hashedPwd;
            final userRepo =
                Provider.of<UserRepository>(context, listen: false);
            userRepo.update(user);

            if (context.mounted) {
              const snackBar = SnackBar(
                content: Text('Profile Updated successfully'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        },
        backgroundColor: Colors.pink.shade200,
        child: const Icon(Icons.done),
      ),
    );
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

  InputDecoration _getDecoration(
          String hintText, IconData icon) =>
      InputDecoration(
          focusedBorder:
              const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFF48FB1), fontSize: 17.0),
          icon: Icon(icon, color: const Color(0xFFF48FB1), size: 22.0));
}
