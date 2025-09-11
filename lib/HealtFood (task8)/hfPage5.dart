import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shakil_new/HealtFood%20(task8)/hfPage6.dart';

import '../widgets/colors.dart';
import '../widgets/images.dart';
import '../widgets/style.dart';

/// ---------------------------
/// Main ForgotPassword Screen
/// ---------------------------
class HealthyFoodPage5 extends StatefulWidget {
  const HealthyFoodPage5({super.key});

  @override
  State<HealthyFoodPage5> createState() => _HealthyFoodPage5State();
}

class _HealthyFoodPage5State extends State<HealthyFoodPage5> {
  final _formKey = GlobalKey<FormState>();
  bool _acceptTerms = false;
  bool _obscure = true;

  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      /// ✅ bottom wave এখানে রাখলাম
      bottomNavigationBar: SvgPicture.asset(
        hfBottomWave,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: hfbackground,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight -
                        MediaQuery.of(context)
                            .viewInsets
                            .bottom, // ✅ keyboard respect
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(hfArrowBackIcon),
                        ),
                        const SizedBox(height: 6),
                        SvgPicture.asset(hfLogo),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: ForgotPasswordCard(
                                formKey: _formKey,
                                nameCtrl: _nameCtrl,
                                emailCtrl: _emailCtrl,
                                passCtrl: _passCtrl,
                                obscure: _obscure,
                                toggleObscure: () =>
                                    setState(() => _obscure = !_obscure),
                                acceptTerms: _acceptTerms,
                                onAcceptChanged: (v) =>
                                    setState(() => _acceptTerms = v),
                                onSubmit: () {},
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// ---------------------------
/// ForgotPassword Card Widget
/// ---------------------------
class ForgotPasswordCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final bool obscure;
  final VoidCallback toggleObscure;
  final bool acceptTerms;
  final ValueChanged<bool> onAcceptChanged;
  final VoidCallback onSubmit;

  const ForgotPasswordCard({
    super.key,
    required this.formKey,
    required this.nameCtrl,
    required this.emailCtrl,
    required this.passCtrl,
    required this.obscure,
    required this.toggleObscure,
    required this.acceptTerms,
    required this.onAcceptChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    // The card matches the rounded rectangle in the image with soft green border and big radius
    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: inputLine),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text('Forgot Password', style: sftitle),

            const SizedBox(height: 24),

            InputField(
              controller: emailCtrl,
              hintText: 'Enter Your Email Address',
              prefix: SvgPicture.asset(hfRegIcon2),
              keyboardType: TextInputType.emailAddress,
              validator: (s) {
                if (s == null || s.trim().isEmpty) return 'Please enter email';
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(s))
                  return 'Enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: 16),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F0DC),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Text(
                "We can't seem to find the right email address for you. Retype the email that you have registered.",
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Confirm ForgotPassword button with inner border effect
            ConfirmButton(onPressed: onSubmit),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                print('Back to Log In tapped!');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    hfArrowBackIcon2,
                    height: 18,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Back To Log In',
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'KantumruyPro',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------
/// InputField Reusable Widget
/// ---------------------------
class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefix != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                child: IconTheme(
                  data: const IconThemeData(size: 20, color: logoGreen),
                  child: prefix!,
                ),
              )
            : null,
        suffixIcon: suffix != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(end: 20),
                child: IconTheme(
                    data: const IconThemeData(size: 20), child: suffix!),
              )
            : null,
        hintText: hintText,
        hintStyle: sfhint,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFb0c780), width: 1.0)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: logoGreen, width: 1.6)),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
      style: const TextStyle(fontSize: 14),
    );
  }
}

/// ---------------------------
/// Confirm Button with inner border
/// ---------------------------
class ConfirmButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ConfirmButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Outer container creates the green button; inner container creates an inset border look.
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HealthyFoodPage6(),
          ),
        );
      },
      child: Container(
        height: 60,
        width: 220,
        decoration: BoxDecoration(
          color: hfButtonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Container(
            // inner border effect: slightly smaller container with transparent background & light inset border
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border:
                  Border.all(color: Colors.white.withOpacity(0.15), width: 2),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Text('Reset Password', style: sfbutton),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------------------
/// Bottom Wave (now removed since using fixed SVG background)
/// ---------------------------
// class BottomWave extends StatelessWidget {
//   const BottomWave({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // This widget is now empty since we're using fixed SVG background
//     return const SizedBox.shrink();
//   }
// }
