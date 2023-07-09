import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../database/entities/profile.dart';
import '../../repositories/profile_repository.dart';

class ChildAlert extends AlertDialog {
  ChildAlert({Key? key, required this.profile}) : super(key: key);

  final Profile profile;
  final TextEditingController _childName = TextEditingController();
  final RegExp digitNameValidator =
      RegExp('[a-z A-Z]'); //Constrains in textNameInput

  Future<void> updateChildName(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update your Child Name'),
          content: _childNameField(),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xFFF48FB1)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text(
                'Save',
                style: TextStyle(color: Color(0xFFF48FB1)),
              ),
              onPressed: () async {
                final profileRepo =
                    Provider.of<ProfileRepository>(context, listen: false);

                if (_childName.text.isNotEmpty) {
                  profile.childName = _childName.text;
                  await profileRepo.update(profile);
                }

                if (context.mounted) {
                  Navigator.of(context).pop(true);
                }
              },
            ),
          ],
        );
      },
    );
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
}
