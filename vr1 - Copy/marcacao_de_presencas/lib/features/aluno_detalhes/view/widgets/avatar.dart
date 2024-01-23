
// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 75.0,
      
      backgroundColor: Color(0xFFFCBD5E0),
      child: Iconify(
        Zondicons.user,
        size: 75,
        
        color: Color(0xFFF112D4E),
      ),
    );
  }
}
