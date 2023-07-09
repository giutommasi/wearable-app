import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../database/entities/profile.dart';
import '../../repositories/profile_repository.dart';

class ProfileAlert extends AlertDialog {
  ProfileAlert({Key? key, required this.profile}) : super(key: key);

  final Profile profile;
  final TextEditingController _pregWeek = TextEditingController();
  final TextEditingController _birthday = TextEditingController();
  final TextEditingController _childName = TextEditingController();

  final RegExp weekRegex =
      RegExp('\b([1-9]|[123][0-9]|40)\b'); //Constrains in textNameInput
  RegExp digitNameValidator = RegExp('[a-z A-Z]'); //Constrains in textNameInput

  Future<bool?> showProfileAlert(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Complete your Profile'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _pregWeekField(),
                _birthdayPicker(context),
                _childNameField()
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xFFF48FB1)),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Color(0xFFF48FB1)),
                ),
                onPressed: () async {
                  if ((_pregWeek.text.isEmpty ||
                          int.parse(_pregWeek.text) > 40 ||
                          int.parse(_pregWeek.text) < 1) ||
                      _birthday.text.isEmpty) {
                    const snackBar = SnackBar(
                      content: Text('Pregnancy week or birthday not valid'),
                    );

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    Navigator.of(context).pop(false);
                  } else {
                    final profileRepo =
                        Provider.of<ProfileRepository>(context, listen: false);
                    Profile profile = profileRepo.signedProfile;
                    profile.pregnantWeek = int.parse(_pregWeek.text);
                    profile.birthday =
                        DateFormat('yyyy-MM-dd').parse(_birthday.text);

                    if (_childName.text.isNotEmpty) {
                      profile.childName = _childName.text;
                    }

                    await profileRepo.update(profile);

                    if (context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                  }
                },
              )
            ],
          );
        });
  }

  Widget _childNameField() => Padding(
        padding: const EdgeInsets.only(right: 14.0, top: 8.0, left: 14.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _childName,
          autofillHints: const [
            AutofillHints.name
          ], //Il telefono suggerisce nome/email o qualsiasi altro dato dell'utente
          inputFormatters: [
            FilteringTextInputFormatter.allow(digitNameValidator)
          ],
          maxLength: 14,
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
              hintText: "Child name",
              hintStyle: TextStyle(
                  color: Color.fromARGB(255, 244, 143, 177), fontSize: 17.0),
              icon: Icon(Icons.person_outlined,
                  color: Color(0xFFF48FB1), size: 22.0)),
        ),
      );

  Widget _pregWeekField() => Padding(
        padding: const EdgeInsets.only(right: 14.0, top: 8.0, left: 14.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          controller: _pregWeek,
          autofillHints: const [AutofillHints.name],
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          maxLength: 2,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
              hintText: 'Enter your Pregnancy week',
              hintStyle: TextStyle(color: Color(0xFFF48FB1), fontSize: 17.0),
              icon: Icon(Icons.pregnant_woman,
                  color: Color(0xFFF48FB1), size: 22.0)),
        ),
      );

  Widget _birthdayPicker(BuildContext context) => Padding(
      padding: const EdgeInsets.only(right: 14.0, top: 8.0, left: 14.0),
      child: TextField(
          controller: _birthday, //editing controller of this TextField
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
              hintText: 'Enter your birthday',
              hintStyle: TextStyle(color: Color(0xFFF48FB1), fontSize: 17.0),
              icon: Icon(Icons.calendar_today,
                  color: Color(0xFFF48FB1), size: 22.0)),
          readOnly: true, // when true user cannot edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2023).subtract(
                    const Duration(days: 365 * 18)), //get today's date
                firstDate: DateTime(1900),
                lastDate: DateTime(2023));
            if (pickedDate != null) {
              String formattedDate = DateFormat('yyyy-MM-dd').format(
                  pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
              print(
                  formattedDate); //formatted date output using intl package =>  2022-07-04
              //You can format date as per your need
              _birthday.text = formattedDate;
            } else {
              _birthday.text = "";
              print("Date is not selected");
            }
          }));
}
