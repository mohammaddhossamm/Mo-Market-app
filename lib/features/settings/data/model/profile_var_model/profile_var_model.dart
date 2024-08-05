import 'package:flutter/material.dart';

class ProfileVarModel {
  final IconData icon;
  final String title;
  final String content;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;

  final TextEditingController controller;
  final String? hintText;
 

  const ProfileVarModel({
    required this.icon,
    required this.title,
    required this.content,
    this.validator,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.hintText = '',
  });
}
