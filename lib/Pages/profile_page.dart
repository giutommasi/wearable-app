import 'package:crypt/crypt.dart';
import 'package:pregnancy_health/Constants/colors.dart';
import 'package:pregnancy_health/Pages/welcome_page.dart';
import 'package:pregnancy_health/Pages/widgets/child_alert.dart';
import 'package:pregnancy_health/Pages/widgets/profMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../database/entities/profile.dart';
import '../database/entities/user.dart';
import '../repositories/profile_repository.dart';
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
  late String version;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController pregWeek = TextEditingController();

  @override
  void initState() {
    super.initState();

    getAppVersion();

    final userRepo = Provider.of<UserRepository>(context, listen: false);
    user = userRepo.signedUser;
    final profileRepo = Provider.of<ProfileRepository>(context, listen: false);
    profile = profileRepo.signedProfile;

    firstName.text = profile.firstName;
    lastName.text = profile.lastName;

    birthday.text = DateFormat("yyyy-MM-dd").format(profile.birthday!);
    pregWeek.text = profile.actualWeek.toString();
  }

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.pink.shade200,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              Consumer<ProfileRepository>(
                  builder: (context, profileRepo, child) {
                return
                    //const SizedBox(height: 10),
                    Text(profileRepo.signedProfile.firstName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ));
              }),
              const SizedBox(height: 2),
              Consumer<ProfileRepository>(
                builder: (context, profileRepo, child) {
                  return Text.rich(TextSpan(
                      children: [
                        TextSpan(
                            text:
                                "Mom of ${profileRepo.signedProfile.childName}"),
                        WidgetSpan(
                            child: InkWell(
                                child: const Icon(
                                  Icons.edit,
                                  color: gradientEnd,
                                ),
                                onTap: () async {
                                  ChildAlert alert =
                                      ChildAlert(profile: profile);

                                  await alert.updateChildName(context);
                                }))
                      ],
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      )));
                },
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 0.6, color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: 'User Management',
                icon: Icons.manage_accounts_outlined,
                endIcon: true,
                expandedContent: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: <Widget>[
                            TextFormField(
                                controller: firstName,
                                keyboardType: TextInputType
                                    .name, // Use email input type for emails.
                                decoration:
                                    _getDecoration("First Name", Icons.person)),
                            TextFormField(
                                controller: lastName,
                                keyboardType: TextInputType
                                    .name, // Use email input type for emails.
                                decoration:
                                    _getDecoration("Last Name", Icons.person)),
                            TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: _obscureTextPassword,
                                controller: password,
                                validator: (p) => validatePassword(p),
                                decoration: InputDecoration(
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.pink)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.pink.shade200)),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                        color: Color(0xFFF48FB1),
                                        fontSize: 17.0),
                                    icon: const Icon(Icons.lock_outline,
                                        color: Color(0xFFF48FB1), size: 22.0),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _obscureTextPassword =
                                                  !_obscureTextPassword;
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
                                decoration: _getDecoration(
                                    "Birthday", Icons.celebration)),
                            TextFormField(
                                enabled: false,
                                controller: pregWeek,
                                decoration: _getDecoration(
                                    "Pregnancy Week", Icons.pregnant_woman)),
                          ],
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 0.6, color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: 'Information',
                icon: Icons.info_outline,
                endIcon: false,
                onPress: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Pregnancy Health app version: $version"),
                  ));
                },
              ),
              ProfileMenuWidget(
                title: 'Logout',
                icon: Icons.logout_outlined,
                textColor: Colors.red,
                endIcon: false,
                onPress: () async {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (c) => const WelcomePage()),
                      (route) => false);
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('username', '');
                },
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final form = _formKey.currentState;
          if (form != null && form.validate()) {
            if (password.text.isNotEmpty) {
              final hashedPwd =
                  Crypt.sha256(password.text, rounds: 10000, salt: 'abcde1234')
                      .toString();
              user.password = hashedPwd;
            }

            profile.firstName = firstName.text;
            profile.lastName = lastName.text;
            final userRepo =
                Provider.of<UserRepository>(context, listen: false);
            userRepo.update(user);
            Provider.of<ProfileRepository>(context, listen: false)
                .update(profile);

            const snackBar = SnackBar(
              content: Text('Profile Updated successfully'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
      return null;
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
