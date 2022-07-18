
import 'package:sqflite/sqflite.dart';

import 'dart:async';
import 'package:sub1experttonton/data/models/unitvy/unitvy_table.dart';


class DatabaseHelperUnitvy {
  static DatabaseHelperUnitvy?
  _databaseHelperunitvy;

  DatabaseHelperUnitvy.
  _instance(
      )
  {

    _databaseHelperunitvy =
    this;
  }

  factory DatabaseHelperUnitvy(
      ) =>
      _databaseHelperunitvy ??
          DatabaseHelperUnitvy.
          _instance(
          );

  static Database?
  _databaseunitvy;


  Future<Database?>
    get databaseunitvy
    async
    {

    _databaseunitvy ??= await
      _initDb(

      );

    return _databaseunitvy;
  }

  static const String
  _tblWatchlistunitvy =
      'watchlisttv';

  Future<Database>
  _initDb(
      )
  async
  {

    final path = await
    getDatabasesPath(
    );

    final databasePath =
        '$path/ditontontvs.db';

    var db = await openDatabase(
        databasePath,
        version: 1,
        onCreate: _onCreate
    );

    return db;
  }


  void _onCreate(
      Database db,
      int version
      )
  async
  {


    await db.execute(
        '''
      CREATE TABLE  
      $_tblWatchlistunitvy 
      (  
  
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      
      );
    '''

    );
  }


  Future<int> insertWatchlistTv(
      UnitvyTable tv
      )
  async {


    final db = await
    databaseunitvy;

    return await db!
        .insert(
        _tblWatchlistunitvy,
        tv.toJson(

        )
    );
  }


  Future<int> removeWatchlistTv(
      UnitvyTable tv
      )
  async
  {
    final db =
    await databaseunitvy;

    return await db!.delete(
      _tblWatchlistunitvy,
      where: 'id = ?',
      whereArgs: [
        tv.id
      ],
    );
  }


  Future<Map<String, dynamic>?>
  getTvById(
      int id
      )
  async {

    final db =
    await databaseunitvy;

    final results = await db!
        .query(

      _tblWatchlistunitvy,
      where: 'id = ?',
      whereArgs: [
        id
      ],
    );

    if
    (
    results.isNotEmpty
    )
    {

      return results.first;
    }
    else
    {

      return null;
    }
  }


  Future<List<Map<String, dynamic>>>
  getWatchlistTv(
      )
    async
  {

    final db =
    await databaseunitvy;

    final List<Map<String,
        dynamic>>
    results = await db!
        .query(
        _tblWatchlistunitvy
    );

    return results;
  }
}
