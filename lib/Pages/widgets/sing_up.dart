import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  
  bool isChecked = false;               //This variable allow to change the checkBox's status
  bool _obscureTextPassword = true;     //Allow to obscure pw
  final _focusNodeName = FocusNode();   //Allow to jump to the next TextField/Page when the user click ok in the keyboard
  final _focusNodeEmail = FocusNode();  //Allow to jump to the next TextField/Page when the user click ok in the keyboard
  final _focusNodePw = FocusNode();     //Allow to jump to the next TextField/Page when the user click ok in the keyboard
  final _focusNodeRepeatPw = FocusNode();
  TextEditingController textController  //Allow to check if the TextField input is right
    = TextEditingController(); 
  String displayText= '';               //Empty initial string in textNameInput
  RegExp digitNameValidator  = 
    RegExp('[a-z A-Z]');                //Constrains in textNameInput

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
              padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
              width: 290,
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _nameField(),
                    _emailField(),
                    _passwordField(),
                    const SizedBox(height: 10),
                    _RememberMe(),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child:Text('OR', style: TextStyle(color: Colors.pink.shade200),)),
                    Text('Insert SignIn with Google'),
                    Container(
                      height: 200,
                      child: Text(''),
                    )
                  ],
                ),
              )),
        ),
      );

  Widget _nameField() => Padding(
        padding: const EdgeInsets.only(right: 14.0, top: 8.0, left: 14.0),
        child: TextField(
          autofillHints: [AutofillHints.name],    //Il telefono suggerisce nome/email o qualsiasi altro dato dell'utente
          focusNode: _focusNodeName,
          inputFormatters: [
            FilteringTextInputFormatter.allow(digitNameValidator)],    
          //controller: textController, da sviluppare poi controllo nome eventuale
          maxLength: 14,
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
              hintText: 'Enter your name',
              hintStyle: TextStyle(color: Color(0xFFF48FB1), fontSize: 17.0),
              icon: Icon(Icons.person_outlined,
                  color: Color(0xFFF48FB1), size: 22.0)),
          onSubmitted: (_) {
            setState(() {
            //displayText = textController.text;},);
            _focusNodeEmail.requestFocus();});
          },
        ),
      );


  Widget _emailField() => Padding(
        padding: const EdgeInsets.only(right: 14.0, left: 14, bottom: 0),
          child: Column(
            children: [
              TextFormField(
                autofillHints: [AutofillHints.email],
                //onTapOutside: (void onClick) => Navigator.pop(context), se clicchi fuori dal testo, check email corretta/errata, da implementare[...]
                //controller: textController,   [da implemetare nel controllo email valida]
                // validator: (email) => email != null && !EmailValidator.validate(email)
                //   ? 'Enter a valid email' : null,  
                focusNode: _focusNodeEmail,   //Definisco nodo
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
                decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Color.fromRGBO(244, 143, 177, 1))),
                    hintText: 'Email address',
                    hintStyle: TextStyle(color: Color(0xFFF48FB1), fontSize: 17.0),
                    icon: Icon(Icons.email_outlined,
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
            TextField(
              focusNode: _focusNodePw,
              obscureText: _obscureTextPassword,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
              decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width:1, color: Colors.pink.shade200)),
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
              onSubmitted: (_) {
                _focusNodeRepeatPw.requestFocus();
              },
               textInputAction: TextInputAction.go, //Cosi dico che inserimento dati è terminato e posso inviarli
            ),
            TextField(
             

              focusNode: _focusNodeRepeatPw,
              obscureText: _obscureTextPassword,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(fontSize: 16.0, color: Color(0xFFF48FB1)),
              decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width:1, color: Colors.pink.shade200)),
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
              onSubmitted: (_) {_HomePage(context);},
              textInputAction: TextInputAction.go, //Cosi dico che inserimento dati è terminato e posso inviarli
            ),
          ],
        ),
      );

  Widget _RememberMe() => Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.topLeft,
        child: Row(children: [
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
        ]),
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
        onPressed: ()  => _HomePage(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 9),
          child: Text('SIGNUP',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      );


void _HomePage(BuildContext context) {
  Navigator.pop(context);
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => (const HomePage())));
}

}