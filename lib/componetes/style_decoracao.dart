import 'package:flutter/material.dart';

InputDecoration decorationInput(String label){
  return InputDecoration(
    hintText: label,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
      borderSide: const BorderSide(color: Color.fromARGB(255, 48, 31, 197), width: 4),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
      borderSide: const BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
      borderSide: const BorderSide(color: Color.fromARGB(255, 48, 31, 197), width: 4),
    )
  );
}