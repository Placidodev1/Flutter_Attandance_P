// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';


class Presencasimples extends StatelessWidget {
  final String? data;
  final String? estado1;
  final String? estado2;
  final int? idpresenca;
  
  const Presencasimples({
    super.key,
    required this.data,
    required this.estado1,
    required this.estado2,
    required this.idpresenca,
  });


  
  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
       
      child: Container(
        // width: containerWidth,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xfffbacadc),
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 3,
              spreadRadius: 0.1,
              offset: Offset(0, 3.5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Ida a escola: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      estado1! ??
                          'Pendente', // Se estado1 for nulo, use um valor padrão,
                      style: TextStyle(
                        color:
                            estado1 == 'presente' ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Data:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      data!, // Se estado1 for nulo, use um valor padrão,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Volta a escola: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      estado1! ?? 'Pendente',
                      style: TextStyle(
                        color:
                            estado2 == 'presente' ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




