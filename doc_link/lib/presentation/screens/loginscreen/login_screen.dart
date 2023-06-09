import 'package:doc_link/const/const.dart';
import 'package:doc_link/presentation/screens/loginscreen/otpscreen.dart';
import 'package:doc_link/presentation/screens/loginscreen/widgets/google_signin_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/elevated_button_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight10,
                Row(
                  children: [
                    kWidth10,
                    Text(
                      'LOGIN',
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 1, 43, 114)),
                    ),
                  ],
                ),
                kHeight10,
                //?Image section-
                SizedBox(
                  height: 320,
                  width: double.infinity,
                  child: Image.asset(
                    'asset_images/a-patient-consults-a-doctor-and-nurse-free-vector.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                //image section end
                kHeight15,
                Text('Enter The Mobile Number',
                    style: GoogleFonts.lato(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                kHeight10,
                //?phone number form-
                TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: '+91 ',
                      prefixStyle: GoogleFonts.lato(fontSize: 16),
                      border: const OutlineInputBorder(),
                    )),
                Text(
                  'We will send you a one time password to this mobile number',
                  style: GoogleFonts.lato(),
                ),
                const SizedBox(
                  height: 7,
                ),
                //? OTP Button widget-
                ElevatedButtons(
                  text: 'Send OTP',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const OtpScreen();
                    }));
                  },
                ),
                kHeight25,
                Center(
                  child: Text(
                    'OR',
                    style: kTextStyleLargeBlack,
                  ),
                ),
                //?SIGN IN BUTTON--------
                const SizedBox(
                  height: 27,
                ),
                const GoogleSignInButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
