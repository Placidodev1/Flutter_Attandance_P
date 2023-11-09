import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
class PresencaFuncionario extends StatelessWidget {
  final String? name;
  final bool? estado;
  const PresencaFuncionario({
    Key? key,
    required this.name,
    required this.estado,
  });

  void _navigate(BuildContext context) {
    // Navegue para onde desejar quando ocorrer um toque.
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigate(context),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xfffBACADC),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: const Color(0xFFFCBD5E0),
                  child: const Iconify(
                    Zondicons.user,
                    size: 15,
                    color: Color(0xFFF112D4E),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(
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
                  if (estado == true)
                    const CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Color(0xFFFCBD5E0),
                      child: Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 20,
                      ),
                    )
                  else if (estado == false)
                    const CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Color(0xFFFCBD5E0),
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 20,
                      ),
                    )
                  else
                    const CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Color(0xFFFCBD5E0),
                      child: Icon(
                        Icons.remove,
                        color: Colors.amber,
                        size: 20,
                      ),
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
