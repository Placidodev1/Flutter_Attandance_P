import 'package:marcacao_de_presenca/features/presenca_detalhes/controller/requesicao_detalhes_api.dart';

class DetalhesDaPresenca {
  static dynamic momentos = [];
  static dynamic resposta = [];
  static dynamic presenca = [];
  static String entradaACarinhaIdaAEscola = '';
  static String descidaACarinhaIdaAEscola = '';
  static String entradaACarinhaIdaACasa = '';
  static String descidaACarinhaIdaACasa = '';
  static String horaEntradaACarinhaIdaAEscola = '-';
  static String horaDescidaACarinhaIdaAEscola = '-';
  static String horaEntradaACarinhaIdaACasa = '-';
  static String horaDescidaACarinhaIdaACasa = '-';

  static buscaDados(int idpresenca) async {
    resposta = await HttpServiceDetalhesPresenca.detalhes(idpresenca);

    presenca = await HttpServiceDetalhesPresenca.presenca(idpresenca);
    print(presenca);
    print(
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(resposta);
    print(
        "respossssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssta");
    // print(presenca);
    // print("presenca");
    // resposta = resposta["data"];
    if (resposta != null) {
      // Usa Future.delayed para agendar a atualização após a construção inicial
      Future.delayed(Duration.zero, () {
        String dataString = resposta[0]['Data de marcacao'] ?? "nenhuma";
        String data;
        if (dataString == "nenhuma") {
          data = "nenhuma";
        } else {
          data = dataString.substring(17, 22);
        }

        entradaACarinhaIdaAEscola = presenca[0]['Local_subida_casa_escola'];
        horaEntradaACarinhaIdaAEscola = data;

        String dataString1 = resposta[1]['Data de marcacao'] ?? "nenhuma";
        String data1;
        if (dataString1 == "nenhuma") {
          data1 = "nenhuma";
        } else {
          data1 = dataString1.substring(17, 22);
        }
        descidaACarinhaIdaAEscola = presenca[0]["Local_descida_casa_escola"];
        horaDescidaACarinhaIdaAEscola = data1;

        String dataString2 = resposta[2]['Data de marcacao'] ?? "nenhuma";
        String data2;
        if (dataString2 == "nenhuma") {
          data2 = "nenhuma";
        } else {
          data2 = dataString2.substring(17, 22);
        }
        entradaACarinhaIdaACasa = presenca[0]["Local_subida_escola_casa"];
        horaEntradaACarinhaIdaACasa = data2;

        String dataString3 = resposta[3]['Data de marcacao'] ?? "nenhuma";
        String data3;
        if (dataString3 == "nenhuma") {
          data3 = "nenhuma";
        } else {
          data3 = dataString.substring(17, 22);
        }
        horaDescidaACarinhaIdaACasa = data3;
        descidaACarinhaIdaACasa = presenca[0]["Local_descida_escola_casa"];
      });
      return "done";
    }
  }
}
