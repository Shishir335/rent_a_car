import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car/utils/colors.dart';
import 'package:rent_a_car/utils/globals.dart';
import 'package:another_flushbar/flushbar.dart';

gap({double? height, double? width}) {
  if (height == null && width == null) {
    return const SizedBox(height: 0);
  } else {
    return height != null ? SizedBox(height: height) : SizedBox(width: width);
  }
}

snackbar({
  required String message,
  int? statusCode,
  int duration = 2,
  void Function(Flushbar<dynamic>)? onTap,
}) {
  bool error = false;
  if (statusCode != null) {
    error = (statusCode >= 200 && statusCode < 300) ? false : true;
  }

  Flushbar(
    messageText: Text(
      toBeginningOfSentenceCase(message)!,
      maxLines: 3,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    borderRadius: BorderRadius.circular(10),
    messageSize: 16,
    backgroundColor: error ? AppColors.errorColor : AppColors.successColor,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: duration),
    animationDuration: const Duration(milliseconds: 500),
    onTap: onTap,
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  ).show(navigatorKey.currentState!.context);
}

getBorder(BuildContext context) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Theme.of(context).primaryColor.withOpacity(.5),
    ),
  );
}

getLabelStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge;
}

getHintStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge;
}

String? ddValidate(dynamic value, String name) {
  if (value == null || value == '') {
    return 'Please select $name';
  } else {
    return null;
  }
}

String? Function(String?)? emptyValidate() {
  return (value) {
    if (value!.isEmpty) {
      return 'This field cannot be empty';
    } else {
      return null;
    }
  };
}

class PasswordIcon extends StatelessWidget {
  const PasswordIcon({super.key, required this.obscureText});

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Icon(
      obscureText ? Icons.visibility_off : Icons.visibility,
      color: obscureText ? AppColors.hintColor : AppColors.primaryColor,
    );
  }
}

formatDate(DateTime? date, {String format = 'yyyy-MM-dd HH:mm'}) {
  return DateFormat(format).format(date!);
}

statusBar(BuildContext context) {
  return Container(height: MediaQuery.of(context).viewPadding.top);
}
