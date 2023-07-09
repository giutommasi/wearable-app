// import 'package:crypt/crypt.dart';
// import 'package:exam/repositories/profile_repository.dart';
import 'package:exam/Constants/colors.dart';
import 'package:exam/Pages/dailyPlan1.dart';
import 'package:exam/Pages/food_plan.dart';
import 'package:exam/Pages/home_page.dart';
import 'package:exam/Pages/profMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import '../database/entities/profile.dart';
// import '../database/entities/user.dart';
// import '../repositories/user_repository.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String ChildName = ' '; 
  final _formKey = GlobalKey<FormState>();
  bool _obscureTextPassword = true;
  
  

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController pregWeek = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  //   final userRepo = Provider.of<UserRepository>(context, listen: false);
  //   user = userRepo.signedUser;
  //   final profileRepo = Provider.of<ProfileRepository>(context, listen: false);
  //   profile = profileRepo.signedProfile;

  //   firstName.text = user.firstName;
  //   lastName.text = user.lastName;

  //   birthday.text = DateFormat("yyyy-MM-dd").format(profile.birthday!);
  //   pregWeek.text = profile.pregnantWeek.toString();
  // }

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
                onPressed: () {Navigator.of(context).pop();},
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
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: gradientEnd),
                      child: IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.edit_outlined), 
                        iconSize: 20,
                        color: Colors.white),
                    ),
                  )
                ],
              ),   
              //const SizedBox(height: 10),
                const Text('Giulia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    )),
                const SizedBox(height: 2),
                Text("Mom of $ChildName",
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    )),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gradientEnd,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {},
                    child: const Text('Edit Profile'),
                  ),
                ),
              const SizedBox(height: 30),
                const Divider(thickness: 0.6, color: Colors.grey),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                    title: 'User Management',
                    icon: Icons.manage_accounts_outlined,
                    endIcon: true,
                    expandedContent: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                                      children: [
                      TextFormField(
                          controller: firstName,
                          keyboardType: TextInputType
                              .name, // Use email input type for emails.
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
                    ),
                    ),
                const SizedBox(height: 10),
                const Divider(thickness: 0.6, color: Colors.grey),
                const SizedBox(height: 10),
                const ProfileMenuWidget(
                    title: 'Information',
                    icon: Icons.info_outline,
                    endIcon: false,
                    ),
                const ProfileMenuWidget(
                    title: 'Logout',
                    icon: Icons.logout_outlined,
                    textColor: Colors.red,
                    endIcon: false,
              ),  
    
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final form = _formKey.currentState;
          // if (form != null && form.validate()) {
          //   final hashedPwd =
          //       Crypt.sha256(password.text, rounds: 10000, salt: 'abcde1234')
          //           .toString();

          //   user.firstName = firstName.text;
          //   user.lastName = lastName.text;
          //   user.password = hashedPwd;
          //   final userRepo =
          //       Provider.of<UserRepository>(context, listen: false);
          //   userRepo.update(user);

          //   if (context.mounted) {
          //     const snackBar = SnackBar(
          //       content: Text('Profile Updated successfully'),
          //     );
          //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //   }
          // }
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