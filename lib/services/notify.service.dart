import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

// ANCHOR Notify Service
class NotifyService {
  // ANCHOR Toast
  static void toast(
    BuildContext context, {
    required String message,
  }) {
    ToastContext toastContext = ToastContext();

    toastContext.init(
      context,
    );

    // show
    Toast.show(
      message,
      rootNavigator: true,
      duration: 5,
      gravity: Toast.top,
      textStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 13.5,
        fontWeight: FontWeight.w500,
        color: Color(0xFFF5F5F5),
      ),
    );
  }
}
