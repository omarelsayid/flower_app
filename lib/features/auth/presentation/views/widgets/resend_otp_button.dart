import 'dart:async';
import 'package:flutter/material.dart';

class ResendOTPButton extends StatefulWidget {
  final Function onResend; // تمرير الدالة التي تنفذ عند إعادة الإرسال

  ResendOTPButton({required this.onResend});

  @override
  _ResendOTPButtonState createState() => _ResendOTPButtonState();
}

class _ResendOTPButtonState extends State<ResendOTPButton> {
  int _timerSeconds = 30; // مدة العد التنازلي بالثواني
  Timer? _timer;
  bool _canResend = false; // هل يمكن إعادة إرسال OTP؟

  @override
  void initState() {
    super.initState();
    startTimer(); // تشغيل المؤقت عند فتح الصفحة
  }

  void startTimer() {
    setState(() {
      _canResend = false;
      _timerSeconds = 30;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _canResend = true;
        });
      }
    });
  }

  void handleResend() {
    if (!_canResend) return;

    widget.onResend(); // تنفيذ دالة إعادة الإرسال
    startTimer(); // إعادة تشغيل المؤقت بعد الإرسال
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          _canResend ? handleResend : null, // تعطيل الزر أثناء العد التنازلي
      child: Text(_canResend ? "Resend" : "Resend in $_timerSeconds "),
    );
  }
}
