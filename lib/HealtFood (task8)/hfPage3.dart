import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/colors.dart';
import '../widgets/images.dart';
import '../widgets/style.dart';
import 'hfPage4.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // neutral base; specific styles are provided via constants below
//         scaffoldBackgroundColor: pageBackground,
        useMaterial3: false,
      ),
      home: const HealthyFoodPage3(),
    );
  }
}

/// ---------------------------
/// Main Registration Screen
/// ---------------------------
class HealthyFoodPage3 extends StatefulWidget {
  const HealthyFoodPage3({super.key});

  @override
  State<HealthyFoodPage3> createState() => _HealthyFoodPage3State();
}

class _HealthyFoodPage3State extends State<HealthyFoodPage3> {
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

      /// ✅ bottom wave ঠিক জায়গায় আছে
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            // ✅ LayoutBuilder, ConstrainedBox, IntrinsicHeight সরিয়ে একটি সাধারণ Column ব্যবহার করা হয়েছে
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // উপরের অংশ (Top Section)
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(hfArrowBackIcon),
                ),
                const SizedBox(height: 6),
                SvgPicture.asset(hfLogo),

                // ✅ মূল পরিবর্তন এখানে: Expanded উইজেট
                // এটি উপরের উইজেটগুলো বাদে বাকি সব খালি জায়গা নিয়ে নিবে
                // এবং তার ভেতরের কন্টেন্টকে মাঝখানে রাখবে।
                Expanded(
                  child: Center(
                    // Center উইজেট কার্ডটিকে উল্লম্বভাবে (vertically) মাঝখানে রাখে
                    child: RegistrationCard(
                      formKey: _formKey,
                      nameCtrl: _nameCtrl,
                      emailCtrl: _emailCtrl,
                      passCtrl: _passCtrl,
                      obscure: _obscure,
                      toggleObscure: () => setState(() => _obscure = !_obscure),
                      acceptTerms: _acceptTerms,
                      onAcceptChanged: (v) => setState(
                          () => _acceptTerms = v!), // null safety-এর জন্য 'v!'
                      onSubmit: () {
                        // Handle submission logic
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------------------
/// Registration Card Widget
/// ---------------------------
class RegistrationCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final bool obscure;
  final VoidCallback toggleObscure;
  final bool acceptTerms;
  final ValueChanged<bool> onAcceptChanged;
  final VoidCallback onSubmit;

  const RegistrationCard({
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
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text('Registration', style: sftitle),

            const SizedBox(height: 24),

            // Form fields
            InputField(
              controller: nameCtrl,
              hintText: 'Enter Your Full Name',
              prefix: SvgPicture.asset(
                hfRegIcon1,
              ),
              validator: (s) =>
                  (s == null || s.trim().isEmpty) ? 'Please enter name' : null,
            ),
            const SizedBox(height: 16),

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

            // password with eye icon
            InputField(
              controller: passCtrl,
              hintText: 'Enter Password',
              prefix: SvgPicture.asset(hfRegIcon3),
              suffix: SvgPicture.asset(hfRegIcon4),
              obscureText: obscure,
              validator: (s) => (s == null || s.length < 6)
                  ? 'Password must be at least 6 chars'
                  : null,
            ),

            const SizedBox(height: 26),

            // Terms switch row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    width: 46,
                    height: 30,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Switch(
                        value: acceptTerms,
                        activeColor: Colors.white,
                        activeTrackColor: buttonGreen,
                        inactiveTrackColor: inputLine,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: onAcceptChanged,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(width: 2),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: sfsmall,
                      children: const [
                        TextSpan(
                            text: 'I accept the ',
                            style: TextStyle(fontFamily: 'Karma')),
                        TextSpan(
                          text: 'Terms of Services',
                          style: TextStyle(
                              color: logoGreen, fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: ' as well as '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              color: logoGreen, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Confirm Registration button with inner border effect
            ConfirmButton(onPressed: onSubmit),
            const SizedBox(height: 10),
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
            builder: (context) => HealthyFoodPage4(),
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
                child: Text('Confirm Registration', style: sfbutton),
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
