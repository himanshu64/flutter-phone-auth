import 'package:flutter/material.dart';
import 'package:flutter_phone_auth/app_route.dart';
import 'package:flutter_phone_auth/core/constants/colors.dart';
import 'package:flutter_phone_auth/global_providers.dart';
import 'package:flutter_phone_auth/presentation/views/verification_model.dart';
import 'package:flutter_phone_auth/presentation/widgets/error_text.dart';
import 'package:flutter_phone_auth/state/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

final signInVerificationModelProvider =
    StateNotifierProvider.autoDispose<SignInVerificationModel, SignInState>(
        (ref) {
  final authService = ref.watch(authServiceProvider);
  return SignInVerificationModel(
    authService: authService,
  );
});

final countdownProvider = StreamProvider.autoDispose<int>((ref) {
  final signInVerificationModel =
      ref.watch(signInVerificationModelProvider.notifier);
  return signInVerificationModel.countdown.stream;
});

class SignInVerificationViewBuilder extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInState>(signInVerificationModelProvider, (_, state) {
      if (state == const SignInState.success()) {
        Navigator.popUntil(
          context,
          ModalRoute.withName(AppRoutes.startupView),
        );
      }
    });

    final state = ref.watch(signInVerificationModelProvider);
    final countdown = ref.watch(countdownProvider);
    final model = ref.read(signInVerificationModelProvider.notifier);

    return SignInVerificationView(
      phoneNumber: model.formattedPhoneNumber,
      resendCode: () => model.resendCode(),
      verifyCode: (String smsCode) => model.verifyCode(smsCode),
      delayBeforeNewCode: (countdown.value ?? delayBeforeUserCanRequestNewCode),
      canSubmit: state.maybeWhen(
        canSubmit: () => true,
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

class SignInVerificationView extends StatefulWidget {
  const SignInVerificationView({
    Key? key,
    required this.phoneNumber,
    this.canSubmit = false,
    this.isLoading = false,
    this.errorText,
    this.delayBeforeNewCode = 30,
    this.resendCode,
    this.verifyCode,
  }) : super(key: key);

  final String phoneNumber;
  final bool canSubmit;
  final bool isLoading;
  final int delayBeforeNewCode;
  final String? errorText;
  final Function()? resendCode;
  final Function(String smsCode)? verifyCode;

  @override
  State<StatefulWidget> createState() => _SignInVerificationViewState();
}

class _SignInVerificationViewState extends State<SignInVerificationView> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      focusNode.requestFocus();
    });
  }

  Future<void> _pushBack(BuildContext context) async {
    final navigator = Navigator.of(context);
    navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 45,
      width: 60,
      textStyle: const TextStyle(fontSize: 24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(5),
    );

    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const SizedBox(height: 20),
                    Text("Verify your phone",
            style: GoogleFonts.inter(
                fontSize: 32,
                color: neuteralEbony,
                fontWeight: FontWeight.w500)),
                    const SizedBox(
          height: 10.0,
                    ),
                    RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Enter the verification code sent to\n",
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: paleSky,
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: widget.phoneNumber,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: neuteralEbony,
                  fontWeight: FontWeight.w600))
                    ])),
                    const SizedBox(height: 10.0,),
                    
                    Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          padding: const EdgeInsets.all(10.0),
          child: Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            length: 6,
            onTap: () {
              if (widget.errorText != null) {
                controller.text = "";
              }
            },
            onSubmitted: widget.verifyCode,
            focusNode: focusNode,
            controller: controller,
            pinAnimationType: PinAnimationType.none,
            pinputAutovalidateMode: PinputAutovalidateMode.disabled,
            validator: (String? s) {
              if (widget.errorText == null && s!.length == 6) {
                widget.verifyCode!(s);
              }
              return null;
            },
          ),
                    ),
                   
                    Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
          widget.delayBeforeNewCode > 0
              ? "Verification code expires in ${widget.delayBeforeNewCode.toString()} seconds"
              : "Resend to ${widget.phoneNumber}",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: colorSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
                    )
          ],
                    ),
                    const SizedBox(
          height: 50.0,
                    ),
                    widget.delayBeforeNewCode > 0
            ? const SizedBox.shrink()
            : InkWell(
                onTap: widget.resendCode,
                child: Container(
                  padding:const  EdgeInsets.symmetric(vertical: 15.0),
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: colorSecondary),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Text(
                    "Resend Code",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: neuteralEbony),
                  ),
                ),
              ),
                    const SizedBox(
          height: 20.0,
                    ),
                    InkWell(
          onTap: () {
            _pushBack(context);
          },
          child: Container(
            
             width: size.width,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: colorSecondary),
                    borderRadius: BorderRadius.circular(8.0)
                
            ),
            padding:const  EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              "Change Number",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: neuteralEbony),
            ),
          ),
                    ),
                    const SizedBox(
          height: 20.0,
                    ),
                    if (widget.errorText != null)
          ErrorText(message: widget.errorText ?? ''),
                  ]),
        ),
      ),
    );
  }
}
