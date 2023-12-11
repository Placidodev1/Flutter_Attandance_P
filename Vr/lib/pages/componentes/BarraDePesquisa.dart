import 'package:Registoflutterattandance/Api/api_filtro.dart';
import 'package:flutter/material.dart';

class MyTextInputField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String labelText;
  final IconData? sufIcon;
  final bool isObscure;

  MyTextInputField({
    Key? key,
    required this.controller,
    this.onChanged,
    required this.labelText,
    this.sufIcon,
    this.isObscure = false,
  }) : super(key: key);

  @override
  State<MyTextInputField> createState() => _MyTextInputFieldState();
}

class _MyTextInputFieldState extends State<MyTextInputField> {
  List<String> alunos = []; // Lista para armazenar os resultados da pesquisa

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          
          controller: widget.controller,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
            fetchAlunos();
          },
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(fontSize: 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  fetchAlunos();
                },
                child: Icon(widget.sufIcon)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          obscureText: widget.isObscure,
        ),
        
        SizedBox(height: 16),
        
        Container(
          height: 200,
          child: ListView.builder(
            
            itemCount: alunos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(alunos[index]),
                
                onTap: () {
                  
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void fetchAlunos() async {
    List<dynamic> dados =
        await HttpFiltroPesquisa.filtro(widget.controller.text, context);
    print(dados);
    // Fazemos um cast para List<String> usando map e toString
    List<String> nomes = dados.map((item) => item["Nome"].toString()).toList();
    print(nomes);
    // Atualiza a lista de resultados e reconstrói o widget
    setState(() {
      alunos = nomes;
    });
  }
}
