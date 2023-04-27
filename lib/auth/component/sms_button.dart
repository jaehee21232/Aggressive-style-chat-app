import 'package:chatapp/auth/riverpod/state_provider.dart';
import 'package:chatapp/common/const/color.dart';
import 'package:chatapp/common/const/style/font_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SMSButton extends ConsumerStatefulWidget {
  final double state;
  const SMSButton({super.key, required this.state});

  @override
  _SMSButtonState createState() => _SMSButtonState();
}

class _SMSButtonState extends ConsumerState<SMSButton> {
  @override
  Widget build(BuildContext context) {
    final verid = ref.watch(verificationIdProvider);
    final code = ref.watch(numberProvider);
    final sms = ref.watch(smsProvider);
    bool _codeSent = false;
    Widget smserrorText(bool sent) {
      if (sent == true) {
        return Text(
          "잘못된 인증번호 입니다",
          style: errorText,
        );
      } else {
        return SizedBox();
      }
    }

    Widget checkCodeSentInput(bool sent) {
      if (sent == true) {
        return TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "인증번호를 입력해주세요",
            hintStyle: hintText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: grey,
              ),
            ),
          ),
          onChanged: (value) {
            ref.read(smsProvider.notifier).update((state) => state = value);
          },
          cursorColor: grey,
          autofocus: true,
          validator: (value) {
            if (value!.isEmpty) {
              return " 인증코드를 입력해주세요";
            } else {
              return null;
            }
          },
        );
      } else {
        return SizedBox.shrink();
      }
    }

    Widget checkCodeSentButton(bool sent) {
      if (sent == true) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: black),
          onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;

            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verid, smsCode: sms);

            try {
              await auth.signInWithCredential(credential).then((value) =>
                  Navigator.pushNamed(context, "/nameregisterscreen"));
            } catch (e) {
              ref
                  .read(checkSmsProvider.notifier)
                  .update((state) => state = true);
            }
          },
          child: Text(
            "인증",
            style: styleButtonText,
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    }

    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  widget.state != 0 && widget.state != 99999999 ? black : grey,
              elevation: 0),
          onPressed: () async {
            if (widget.state != 0 && widget.state != 99999999) {
              FirebaseAuth auth = FirebaseAuth.instance;
              await auth.verifyPhoneNumber(
                timeout: Duration(seconds: 60),
                phoneNumber:
                    "+8210${ref.watch(numberProvider).toInt().toString()}",
                verificationCompleted: (PhoneAuthCredential credential) async {
                  // Android only
                  await auth.signInWithCredential(credential);
                },
                verificationFailed: (FirebaseAuthException e) {
                  if (e.code == 'invalid-phone-number') {
                    print("The provided phone number is not valid.");
                  }
                },
                codeSent: (verificationId, forceResendingToken) {
                  ref
                      .read(verProvider.notifier)
                      .update((state) => state = true);

                  ref
                      .read(verificationIdProvider.notifier)
                      .update((state) => state = verificationId);
                },
                codeAutoRetrievalTimeout: (verificationId) {
                  print("timeout");
                },
              );
            }
          },
          child: Text(
            "전송",
            style: styleButtonText,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        checkCodeSentInput(ref.watch(verProvider)),
        SizedBox(
          height: 8,
        ),
        smserrorText(ref.watch(checkSmsProvider)),
        SizedBox(
          height: 8,
        ),
        checkCodeSentButton(ref.watch(verProvider)),
      ],
    );
  }
}
