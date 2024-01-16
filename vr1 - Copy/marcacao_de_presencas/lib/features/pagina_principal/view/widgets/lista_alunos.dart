// ignore_for_file: use_full_hex_values_for_flutter_colors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

class PresencaFuncionario extends StatelessWidget {
  const PresencaFuncionario({super.key});

 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xfffbacadc),
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 3,
              spreadRadius: 0.1,
              offset: Offset(0, 3.5),
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Color(0xfffcbd5e0),
                  child: Iconify(
                    Zondicons.user,
                    size: 15,
                    color: Color(0xfff112d4e),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Por redifinir",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Color(0xfffcbd5e0),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(0xfff003459),
                        size: 20,)
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


