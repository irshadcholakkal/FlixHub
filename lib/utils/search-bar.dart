import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchBarss extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const SearchBarss({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: Colors.grey,

        style: TextStyle(color: Colors.white), // Text color
        decoration: InputDecoration(
          prefixIcon: Icon(IconlyBold.search,
              color: Colors.grey.shade200), // Icon color
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5)), // Hint text color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white), // Border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
