import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/colors.dart';
import '../widgets/images.dart';
import '../widgets/style.dart';
import 'hfPage7.dart';

/// ---------------------------
/// Main OtpVerification Screen
/// ---------------------------
class HealthyFoodPage6 extends StatefulWidget {
  const HealthyFoodPage6({super.key});

  @override
  State<HealthyFoodPage6> createState() => _HealthyFoodPage6State();
}

class _HealthyFoodPage6State extends State<HealthyFoodPage6> {
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
                          child: SvgPicture.asset(
                            hfArrowBackIcon,
                            width: 28, // চাইলে সাইজ কন্ট্রোল করতে পারো
                            height: 28,
                          ),
                        ),
                        const SizedBox(height: 6),
                        SvgPicture.asset(hfLogo),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: OtpVerificationCard(
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
/// OtpVerification Card Widget
/// ---------------------------
class OtpVerificationCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final bool obscure;
  final VoidCallback toggleObscure;
  final bool acceptTerms;
  final ValueChanged<bool> onAcceptChanged;
  final VoidCallback onSubmit;

  const OtpVerificationCard({
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
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text('OTP Verification', style: sftitle),

            const SizedBox(height: 24),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F0DC),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: RichText(
                text: TextSpan(
                  style: sfsmall,
                  children: const [
                    TextSpan(
                        text:
                            'Check your mail. We’ve sent you the 4 digit pin at ',
                        style: TextStyle(fontSize: 15)),
                    TextSpan(
                      text: 'ahosanhabib922@gmail.com',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            OtpInputFields(),

            const SizedBox(height: 25),

            RichText(
              text: TextSpan(
                style: sfsmall,
                children: const [
                  TextSpan(
                      text: 'Didn’t you received any code? ',
                      style: TextStyle(fontSize: 15)),
                  TextSpan(
                    text: 'Resend',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Confirm OtpVerification button with inner border effect
            ConfirmButton(onPressed: onSubmit),
            const SizedBox(height: 10),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //     print('Back to Log In tapped!');
            //   },
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       SvgPicture.asset(
            //         hfArrowBackIcon2,
            //         height: 18,
            //       ),
            //       SizedBox(width: 8.0),
            //       Text(
            //         'Back To Log In',
            //         style: TextStyle(
            //           color: Colors.black87,
            //           fontSize: 14.0,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ],
            //   ),
            // )
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
            builder: (context) => HealthyFoodPage7(),
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
                child: Text('Verify Now', style: sfbutton),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------------------
/// OTP Input Fields Widget
/// ---------------------------
class OtpInputFields extends StatefulWidget {
  const OtpInputFields({super.key});

  @override
  State<OtpInputFields> createState() => _OtpInputFieldsState();
}

class _OtpInputFieldsState extends State<OtpInputFields> {
  // প্রতিটি TextField এর জন্য একটি করে Controller এবং FocusNode
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    // FocusNode-গুলোতে listener যোগ করা, যাতে UI আপডেট হয়
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    // memory leak এড়ানোর জন্য dispose করা জরুরি
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  // একটি বক্স থেকে পরের বক্সে যাওয়ার ফাংশন
  void _nextField(String value, int index) {
    if (value.length == 1 && index < 3) {
      _focusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

  // আগের বক্সে ফিরে আসার ফাংশন
  void _previousField(String value, int index) {
    if (value.isEmpty && index > 0) {
      _focusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  // একটি সিঙ্গেল OTP বক্স তৈরির ফাংশন
  Widget _buildOtpTextField(int index) {
    // ছবির কালার কোড অনুযায়ী
    const Color activeColor = hfPrimaryColor;
    const Color inactiveColor = inputLine;

    // বর্তমান ফিল্ডটি ফোকাসে আছে কিনা তা চেক করা
    // final bool hasFocus = _focusNodes[index].hasFocus;

    return SizedBox(
      width: 50,
      height: 65,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        autofocus: index == 0, // প্রথম বক্সটি অটোফোকাস হবে
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1, // প্রতিটি বক্সে একটির বেশি সংখ্যা লেখা যাবে না
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly // শুধু সংখ্যা ইনপুট করা যাবে
        ],
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: activeColor,
        ),
        decoration: InputDecoration(
          counterText: '', // ক্যারেক্টার কাউন্টার লুকিয়ে রাখার জন্য
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: inactiveColor, width: 2.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: activeColor, width: 2.5),
          ),
        ),
        onChanged: (value) {
          // ভ্যালু পরিবর্তন হলে এই ফাংশনগুলো কল হবে
          _nextField(value, index);
          _previousField(value, index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return _buildOtpTextField(index);
        }),
      ),
    );
  }
}
