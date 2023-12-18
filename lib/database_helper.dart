
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper{
  static const _databaseName = "AssociationDetialsDB.db";
  static const _databaseVersion = 12;

  static const associationDetialsTable = 'Associationtable';

  static const colId = '_id';
  static const colSocietyName = '_societyName';
  static const colDataOfIncorporation = '_dateOfIncorporation';
  static const colPanNumber = '_panNumber';
  static const colRegnNo = '_registeredNo';
  static const colaRegistrationNo = '_aRegistrationNo';
  static const colgRegistrationNo = '_gRegistrationNo';
  static const colRegisteredOffice = '_registeredOffice';
  static const colBranchOffice = '_branchOffice';

  late Database _db;

  Future<void> initializatrion() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database database, int version) async {
    await database.execute(
      '''CREATE TABLE $associationDetialsTable(
      $colId INTEGER PRIMARY KEY,
      $colSocietyName TEXT,
      $colDataOfIncorporation TEXT,
      $colPanNumber TEXT,
      $colRegnNo TEXT,
      $colaRegistrationNo TEXT,
      $colgRegistrationNo TEXT,
      $colRegisteredOffice TEXT,
      $colBranchOffice TEXT
     )''',
    );
  }
  _onUpgrade(Database database, int oldVersion, int  newVersion) async{
    await database.execute('drop table $associationDetialsTable');
    _onCreate(database, newVersion);
  }
  Future<int> insertAssociationDetials(
      Map<String, dynamic> row, String tableName)async{
    return await _db.insert(tableName, row);

  }
  Future<List<Map<String,dynamic>>> queryAllRows(String tableName) async {
    return await _db.query(tableName);
  }
  Future<int> UpdateAssociationDetials(
      Map<String, dynamic> row, String tableName)async{
    int id = row[colId];
    return await _db.update(tableName,
        row,
    where: '$colId=?',
    whereArgs: [id],);
  }
  Future<int> deleteAssociationDetials(int id, String tableName) async{
    return await _db.delete(tableName,
    where:  '$colId=?',
    whereArgs: [id],
    );
  }

}