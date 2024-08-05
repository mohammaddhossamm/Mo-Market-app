import 'package:flutter/material.dart';
void customSussessSnackBar(
  context, {
  required String text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(25),
      duration: const Duration(seconds: 1),
      elevation: 10,
      backgroundColor:  Colors.white,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Icon(
              Icons.check_circle_outline,
              color:Colors.green,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void customErrorSnackBar(
  context, {
  required String text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(25),
      duration: const Duration(seconds: 1),
      elevation: 10,
      backgroundColor:  Colors.white,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Icon(
              Icons.error_outline_rounded,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void customWorningSnackBar(
  context, {
  required String text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(25),
      duration: const Duration(seconds: 1),
      elevation: 10,
      backgroundColor:  Colors.white,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Icon(
              Icons.warning_amber_rounded,
              color: Colors.amber,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}