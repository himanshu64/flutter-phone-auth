import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_phone_auth/app_route.dart';
import 'package:flutter_phone_auth/core/constants/colors.dart';
import 'package:flutter_phone_auth/global_providers.dart';
import 'package:flutter_phone_auth/presentation/views/phone_model.dart';
import 'package:flutter_phone_auth/presentation/widgets/buttons.dart';
import 'package:flutter_phone_auth/presentation/widgets/error_text.dart';
import 'package:flutter_phone_auth/state/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

final signInPhoneModelProvider =
    StateNotifierProvider.autoDispose<SignInPhoneModel, SignInState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return SignInPhoneModel(
    authService: authService,
  );
});

final selectedCountryProvider =
    Provider.autoDispose<CountryWithPhoneCode?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.maybeWhen(
      ready: (selectedCountry) => selectedCountry, orElse: () => null);
});

class SignInPhoneViewBuilder extends ConsumerWidget {
  const SignInPhoneViewBuilder({super.key});

  Future<void> _openVerification(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(AppRoutes.signInVerificationView);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInState>(signInPhoneModelProvider, (_, state) {
      if (state == const SignInState.success()) {
        _openVerification(context);
      }
    });

    final state = ref.watch(signInPhoneModelProvider);
    final model = ref.read(signInPhoneModelProvider.notifier);

    return SignInPhoneView(
      phoneCode: '+91',
      phonePlaceholder: "Enter mobile no",
      formatter: model.phoneNumberFormatter,
      onSubmit: model.verifyPhone,
      canSubmit: state.maybeWhen(
        canSubmit: () => true,
        success: () => true,
        orElse: () => false,
      ),
      isLoading: state.maybeWhen(
        loading: () => true,
        orElse: () => false,
      ),
      errorText: state.maybeWhen(
        error: (error) => error,
        orElse: () => null,
      ),
    );
  }
}

class SignInPhoneView extends StatefulWidget {
  const SignInPhoneView({
    Key? key,
    this.canSubmit = false,
    this.isLoading = false,
    this.errorText,
    required this.phoneCode,
    required this.phonePlaceholder,
    required this.formatter,
    required this.onSubmit,
  }) : super(key: key);

  final LibPhonenumberTextFormatter formatter;
  final String phoneCode;
  final String phonePlaceholder;
  final bool canSubmit;
  final bool isLoading;
  final String? errorText;
  final Function() onSubmit;

  @override
  _SignInPhoneViewState createState() => _SignInPhoneViewState();
}

class _SignInPhoneViewState extends State<SignInPhoneView> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // title: const Text(
          //   "Sign in with phone number",
          // ),
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "We need to verity your number",
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      color: neuteralEbony,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),

                Text(
                  "Please enter your phone number to receive a verification code.",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: paleSky,
                      fontWeight: FontWeight.w400),
                  // textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                   
                const SizedBox(width: 5),
                    Flexible(
                      child: TextFormField(
                        focusNode: focusNode,
                        keyboardType: TextInputType.phone,
                        controller: controller,
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          hintText: widget.phonePlaceholder,
                          hintStyle: TextStyle(
                            fontSize: 18,
                            letterSpacing: -0.2,
                            color: Colors.grey.shade400,
                          ),
                          prefix:  SizedBox(
           
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.countriesView);
                    },
                   
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        widget.phoneCode,
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.normal, color: paleSky),
                      ),
                    ),
                  ),
                ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300, width: 1.0),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        inputFormatters: [widget.formatter],
                        
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    title: "Get OTP",
                    onPressed: widget.canSubmit ? widget.onSubmit : null,
                  ),
                ),
                // if (widget.errorText != null) ErrorText(message: widget.errorText??''),

                const Spacer(),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/svg/radio.svg"),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                        child: Text(
                      "Allow fydaa to send financial knowledge and critical alerts on your WhatsApp.",
                      style: GoogleFonts.inter(
                          fontSize: 12.0,
                          color: paleSky,
                          fontWeight: FontWeight.w400),
                    ))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
