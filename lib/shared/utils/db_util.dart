import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtil {
  // Nas colunas de tabelas do tipo data é definida com TEXT e utiliza a função
  // DATETIME() passando uma String no formato ISO8601 YYYY-MM-DD HH:MM:SS.SSS
  // como parâmetro. Exemplo: DATETIME('now','localtime');
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'vis_aquae.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE residencia (
            id_residencia TEXT PRIMARY KEY, 
            nome TEXT,
            qtd_moradores INTEGER,
            pais TEXT,
            estado TEXT,
            cidade TEXT,
            bairro TEXT,
            rua TEXT,
            numero TEXT,
            complemento TEXT,
            cep TEXT
          );

          CREATE TABLE dispositivo (
            id_dispositivo TEXT PRIMARY KEY, 
            nome TEXT,
            consumo REAL
          );

          CREATE TABLE residencia_dispositivo (
            id_residencia TEXT,
            id_dispositivo TEXT, 
            tempo_ligado TEXT,
            FOREIGN KEY (id_residencia) REFERENCES residencia(id_residencia),
            FOREIGN KEY (id_dispositivo) REFERENCES dispositivo(id_dispositivo),
            PRIMARY KEY (id_residencia, id_dispositivo, tempo_ligado)
          );

          CREATE TABLE consumo (
            id_consumo TEXT PRIMARY KEY,
            id_residencia TEXT,
            leitura INTEGER,
            data TEXT, 
            tipo_consumo INTEGER,
            FOREIGN KEY (id_residencia) REFERENCES residencia(id_residencia)
          );

          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('1','Computador', 15.12);
          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('2', 'Forno micro-ondas - 25 L', 13.98);
          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('3', 'Geladeira 1 porta', 25.20);
          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('4', 'Lâmpada fluorescente compacta - 11 W', 1.65);
          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('5', 'Lâmpada fluorescente compacta - 15 W', 2.25);
          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('6', 'Lâmpada fluorescente compacta - 23 W', 3.45);
          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('7', 'Lavadora de roupas', 1.76);
          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('8', 'Monitor LCD', 8.16);
          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('9', 'TV em cores - 32" (LCD)', 14.25);
          INSERT INTO dispositivo(id_dispositivo, nome, consumo)  VALUES ('10', 'TV em cores - 42" (LED)', 30.45);
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

  static Future<void> remove(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    db.delete(
      table,
      where: '${data['column']} = ?',
      whereArgs: [data['id']],
    );
  }
}
