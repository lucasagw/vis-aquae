import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtil {
  //TODO: Ajustar retrições de chave na tabela residencia_dispositivo e validar
  //modelagem dela se vai continuar como está ou vai tirar coluna qtd_dispositivos
  //e acrescentar id para cada registro de residencia_dispositivo para que seja
  //definido o tempo ligado de cada dispositivo individualmente.

  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'vis_aquae.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE residencia (
            id_residencia INTEGER PRIMARY KEY, 
            nome TEXT,
            qtd_moradores INTEGER,
            pais TEXT,
            estado TEXT,
            cidade TEXT,
            bairro TEXT,
            rua TEXT,
            numero TEXT,
            complemento TEXT
          );

          CREATE TABLE dispositivo (
            id_dispositivo INTEGER PRIMARY KEY, 
            nome TEXT,
            consumo REAL
          );

          CREATE TABLE residencia_dispositivo (
            id_residencia INTEGER,
            id_dispositivo INTEGER, 
            qtd_dispositivos INTEGER,
            tempo_ligado TEXT,
            FOREIGN KEY (id_residencia) REFERENCES residencia(id_residencia),
            FOREIGN KEY (id_dispositivo) REFERENCES dispositivo(id_dispositivo)
          );

          CREATE TABLE consumo (
            id_consumo INTEGER PRIMARY KEY,
            id_residencia INTEGER,
            qtd_dispositivos INTEGER,
            tempo_ligado TEXT,
            FOREIGN KEY (id_residencia) REFERENCES residencia(id_residencia)
          );
          ''',
        );
      },
    );
  }

  // A chave do map data é o nome da coluna
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }
}
