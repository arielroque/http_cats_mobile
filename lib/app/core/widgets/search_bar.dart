import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBar extends StatelessWidget {
  final String hint;
  final TextInputType keyboardType;
  final Function onChange;

  const SearchBar({this.hint = "", required this.onChange, this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      onChanged: (s){onChange(s);},
      decoration: InputDecoration(
          fillColor: Colors.white,
        hintText: hint),
    );
  }
}
