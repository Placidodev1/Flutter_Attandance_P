import 'package:marcacao_de_presenca/features/aluno_detalhes/model/responsavel_model.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/cerinha_model.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/funcionario_model.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/presenca_model.dart';
import 'package:marcacao_de_presenca/utils/local_storage/sqlite/modals/aluno_model.dart';
import 'package:marcacao_de_presenca/utils/logging/logger.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const databaseName = "attandance.db";

  static const String aluno = "aluno";
  static const String funcionario = "funcionario";
  static const String momentoDaPresenca = "momentoDePresenca";
  static const String presenca = "presenca";
  static const String responsavel = "responsavel";
  static const String carinha = "carinha";

  static String alunoTabela =
      """CREATE TABLE $aluno (idAluno INTEGER PRIMARY KEY , Nome TEXT NOT NULL, Telefone_do_responsavel INTEGER NOT NULL,
       Endereco TEXT NOT NULL, codigo_da_escola INTEGER NOT NULL, QRCode TEXT NOT NULL, FaceId TEXT NOT NULL,
        Barcode INTEGER NOT NULL, Id_carrinha INTEGER NOT NULL, id_Responsavel INTEGER NOT NULL, email TEXT NOT NULL,
         filepath TEXT NOT NULL)""";

  static String funcionarioTabela =
      "CREATE TABLE $funcionario (idFuncionario INTEGER PRIMARY KEY , Nome TEXT NOT NULL, Genero TEXT NOT NULL, Email TEXT NOT NULL, Telefone_do_responsavel INTEGER NOT NULL, Endereco TEXT NOT NULL, Senha Inegerr NOT NULL, Cargo TEXT NOT NULL, Departamento TEXT NOT NULL, id_Carrinha INTEGER NOT NULL)";

  static String momentoDaPresencaTabela =
      "CREATE TABLE $momentoDaPresenca (Data_de_marcacao TEXT NOT NULL , idFuncionario INTEGER NOT NULL, RidPresenca INTEGER NOT NULL, PRIMARY KEY (Data_de_marcacao, idFuncionario))";

  static String presencaTabela =
      "CREATE TABLE $presenca (idPresenca INTEGER PRIMARY KEY , Tipo_de_marcacao_subida_casa_escola TEXT, Local_subida_escola_casa TEXT ,  Local_descida_escola_casa TEXT , Tipo_de_marcacao_descida_casa_escola TEXT , IdAluno INTEGER , Tipo_de_marcacao_subida_escola_casa TEXT , Tipo_de_marcacao_descida_escola_casa TEXT , Local_descida_casa_escola TEXT , Local_subida_casa_escola TEXT , Data_presenca TIMESTEMP )";

  static String responsavelTabela =
      "CREATE TABLE $responsavel (idResponsavel INTEGER PRIMARY KEY , Nome TEXT , Endereco TEXT ,  Relacao_com_aluno TEXT )";

  static String carinhaTabela =
      "CREATE TABLE $carinha ( Capacidade_Maxima INTEGER , Detalhes_Adicionais TEXT , Foto TEXT, Tipo_de_Carinha TEXT ,  idCarinha INTEGER PRIMARY KEY  )";

  static Future<Database> initDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, databaseName);

    return openDatabase(path, version: 12, onCreate: (db, version) async {
      try {
        await db.execute(responsavelTabela);
        await db.execute(alunoTabela);
        await db.execute(funcionarioTabela);
        await db.execute(momentoDaPresencaTabela);
        await db.execute(presencaTabela);
        await db.execute(carinhaTabela);
      } catch (e) {
        TloggerHelper.warning('Erro na criação de tabelas: $e');
      }
    });
  }

  // Cria alunos
  static Future<int> insertAluno(ModelAluno aluno) async {
    final Database db = await initDB();
    return db.insert("aluno", aluno.toMap());
  }

  // pega alunosa
  static Future<List<ModelAluno>> getAluno() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query("aluno");
    return result.map((e) => ModelAluno.fromMap(e)).toList();
  }

  // Cria responsavel
  static Future<int> insertResponsavel(ResponsavelModel funcionario) async {
    final Database db = await initDB();
    return db.insert("responsavel", funcionario.toMap());
  }

  // pega responsavel
  static Future<List<ResponsavelModel>> getResponsavel() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query("responsavel");

    return result.map((e) => ResponsavelModel.fromMap(e)).toList();
  }

  // Cria Funcionario
  static Future<int> insertFuncionario(FuncionarioModel funcionario) async {
    final Database db = await initDB();
    try {
      return db.insert("funcionario", funcionario.toMap());
    } catch (e) {
      return 100;
    }
  }

  // pega Funcionarios
  static Future<List<FuncionarioModel>> getFuncionario() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query("funcionario");
    return result.map((e) => FuncionarioModel.fromMap(e)).toList();
  }

// Cria Carinha
  static Future<void> insertCarinha(CarinhaModel carinha) async {
    final Database db = await initDB();
    try {
      await db.insert("carinha", carinha.toMap());
    } catch (e) {
      TloggerHelper.error("Erro ao inserir Carinha: $e");
      throw Exception("Falha ao inserir Carinha");
    }
  }

// Pega Carinha
  static Future<List<CarinhaModel>> getCarinha() async {
    final Database db = await initDB();
    try {
      List<Map<String, Object?>> result = await db.query("carinha");
      return result.map((e) => CarinhaModel.fromMap(e)).toList();
    } catch (e) {
      TloggerHelper.error("Erro ao obter Carinha: $e");
      throw Exception("Falha ao obter Carinha");
    }
  }

// Cria Presenca
  static Future<void> insertPresenca(PresencaModelFunc presenca) async {
    final Database db = await initDB();
    try {
      await db.insert("presenca", presenca.toMap());
    } catch (e) {
      TloggerHelper.error("Erro ao inserir Presenca: $e");
      throw Exception("Falha ao inserir Presenca");
    }
  }

// Pega Presencas
  static Future<List<PresencaModelFunc>> getPresenca() async {
    final Database db = await initDB();
    try {
      List<Map<String, Object?>> result = await db.query("presenca");
      return result.map((e) => PresencaModelFunc.fromMap(e)).toList();
    } catch (e) {
      TloggerHelper.error("Erro ao obter presenca: $e");
      throw Exception("Falha ao obter presenca");
    }
  }

  
// Cria Presenca
  static Future<void> insertMomentos(PresencaModelFunc presenca) async {
    final Database db = await initDB();
    try {
      await db.insert("presenca", presenca.toMap());
    } catch (e) {
      TloggerHelper.error("Erro ao inserir Presenca: $e");
      throw Exception("Falha ao inserir Presenca");
    }
  }

// Pega Presencas
  static Future<List<PresencaModelFunc>> getMomentos() async {
    final Database db = await initDB();
    try {
      List<Map<String, Object?>> result = await db.query("presenca");
      return result.map((e) => PresencaModelFunc.fromMap(e)).toList();
    } catch (e) {
      TloggerHelper.error("Erro ao obter presenca: $e");
      throw Exception("Falha ao obter presenca");
    }
  }
}
