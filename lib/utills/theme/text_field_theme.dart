import 'package:flutter/material.dart';

class TTextFormField {
  TTextFormField._();

  static InputDecorationTheme lightInputDecoration = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    fillColor: const Color(0x00ffffff),
    filled: true,
    isDense: false,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Color(0xff9e9e9e)),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: Color(0xff9e9e9e)),
      borderRadius: BorderRadius.circular(14),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: Colors.black12),
      borderRadius: BorderRadius.circular(14),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: Colors.red),
      borderRadius: BorderRadius.circular(14),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: Colors.orange),
      borderRadius: BorderRadius.circular(14),
    ),
  );

  static InputDecorationTheme darkInputDecoration = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: Colors.grey),
      borderRadius: BorderRadius.circular(14),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: Colors.white),
      borderRadius: BorderRadius.circular(14),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: Colors.red),
      borderRadius: BorderRadius.circular(14),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: Colors.orange),
      borderRadius: BorderRadius.circular(14),
    ),
  );
}
