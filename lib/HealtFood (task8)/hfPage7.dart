import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/colors.dart';
import '../widgets/images.dart';
import '../widgets/style.dart';
import 'hfPage5.dart';

/// ---------------------------
/// Main CreateNewPass Screen
/// ---------------------------
class HealthyFoodPage7 extends StatefulWidget {
  const HealthyFoodPage7({super.key});

  @override
  State<HealthyFoodPage7> createState() => _HealthyFoodPage7State();
}

class _HealthyFoodPage7State extends State<HealthyFoodPage7> {
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
                              child: CreateNewPassCard(
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
                        const SizedBox(height: 30), // কিছু ফাঁকা জায়গা
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
/// CreateNewPass Card Widget
/// ---------------------------
class CreateNewPassCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final bool obscure;
  final VoidCallback toggleObscure;
  final bool acceptTerms;
  final ValueChanged<bool> onAcceptChanged;
  final VoidCallback onSubmit;

  const CreateNewPassCard({
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
            Text('Create New Password', style: sftitle),

            const SizedBox(height: 24),
            // password with eye icon
            InputField(
              controller: passCtrl,
              hintText: 'New Password',
              prefix: SvgPicture.asset(hfRegIcon3),
              suffix: SvgPicture.asset(hfRegIcon4),
              obscureText: obscure,
              validator: (s) => (s == null || s.length < 6)
                  ? 'Password must be at least 6 chars'
                  : null,
            ),

            const SizedBox(height: 26),
            InputField(
              controller: passCtrl,
              hintText: 'Confirm Password',
              prefix: SvgPicture.asset(hfRegIcon3),
              suffix: SvgPicture.asset(hfRegIcon4),
              obscureText: obscure,
              validator: (s) => (s == null || s.length < 6)
                  ? 'Password must be at least 6 chars'
                  : null,
            ),

            const SizedBox(height: 28),

            // Confirm CreateNewPass button with inner border effect
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
            builder: (context) => HealthyFoodPage5(),
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
                child: Text('Continue With Login', style: sfbutton),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
