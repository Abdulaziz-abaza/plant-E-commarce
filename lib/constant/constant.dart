import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String myhintText;
  final String mylabel;
  final obscureTextt;
  final TextInputTypee;
  final suffixIconn;
  final TextEditingController mycontroller;
  final String? Function(String?)? myvalidator;

  const MyTextField(
      {super.key,
      required this.myhintText,
      required this.mylabel,
      this.obscureTextt,
      this.TextInputTypee,
      this.suffixIconn,
      required this.mycontroller,
      required this.myvalidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        validator: myvalidator,
        controller: mycontroller,
        obscureText: obscureTextt,
        keyboardType: TextInputTypee,
        decoration: InputDecoration(
          fillColor: AppConstants.backgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppConstants.activeColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppConstants.secondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppConstants.activeColor),
          ),
          labelText: mylabel,
          labelStyle: TextStyle(
              color: AppConstants.textColor,
              fontSize: AppConstants.largeFontSize),
          hintText: myhintText,
          hintStyle: TextStyle(
              color: AppConstants.textColor,
              fontSize: AppConstants.smallFontSize),
          suffixIcon: suffixIconn,
        ),
      ),
    );
  }
}

class myspace extends StatelessWidget {
  const myspace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class AppConstants {
  // Colors
  static const Color primaryColor = Color(0xFF6F35A5);
  static const Color secondaryColor = Color(0xFFf1e6ff);
  static const Color textColor = Color(0xFF333333);
  static const Color accentColor = Color.fromARGB(255, 34, 6, 42);
  static const Color activeColor = Color.fromARGB(255, 16, 206, 79);
  static const Color darkgreen = Color.fromARGB(255, 21, 127, 56);

  static const Color backgroundColor = Color.fromARGB(255, 184, 187, 185);

  // Vertical space
  static const double verticalSpaceSmall = 8.0;
  static const double verticalSpaceMedium = 16.0;
  static const double verticalSpaceLarge = 32.0;

  // Horizontal space
  static const double horizontalSpaceSmall = 8.0;
  static const double horizontalSpaceMedium = 16.0;
  static const double horizontalSpaceLarge = 32.0;

  // Text sizes
  static const double smallFontSize = 12.0;
  static const double mediumFontSize = 16.0;
  static const double largeFontSize = 20.0;
  static const double extraLargeFontSize = 25.0;

  // Font weights
  static const FontWeight lightFontWeight = FontWeight.w300;
  static const FontWeight regularFontWeight = FontWeight.w400;
  static const FontWeight mediumFontWeight = FontWeight.w500;
  static const FontWeight boldFontWeight = FontWeight.w700;
}

class mytextbtn extends StatefulWidget {
  final String myTextt;
  final Function() onPressedee;

  const mytextbtn(
      {super.key, required this.myTextt, required this.onPressedee});

  @override
  State<mytextbtn> createState() => _mytextbtnState();
}

class _mytextbtnState extends State<mytextbtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressedee,
        child: Text(
          widget.myTextt,
          style: TextStyle(
            color: AppConstants.textColor,
            fontSize: AppConstants.largeFontSize,
          ),
        ));
  }
}

class MyButton extends StatefulWidget {
  final String btnText;
  final Function() onPressedee;

  const MyButton({
    super.key,
    required this.btnText,
    required this.onPressedee,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: AppConstants.activeColor,
        shape: const StadiumBorder(),
        minWidth: 200,
        height: 50,
        textColor: Colors.white,
        onPressed: widget.onPressedee,
        child: Text(
          widget.btnText,
          style: TextStyle(
              fontSize: AppConstants.largeFontSize,
              fontWeight: AppConstants.boldFontWeight),
        ));
  }
}


// Column(
//           children: [
//             Text('Home Screen'),
//             MyButton(
//                 btnText: 'alert',
//                 onPressedee: () {
//                   AwesomeDialog(
//                     context: context,
//                     dialogType: DialogType.info,
//                     animType: AnimType.rightSlide,
//                     title: 'Dialog Title',
//                     desc: 'Dialog description here.............',
//                     btnCancelOnPress: () {},
//                     btnOkOnPress: () {},
//                   )..show();
//                 }),
//           ],
//         ),
