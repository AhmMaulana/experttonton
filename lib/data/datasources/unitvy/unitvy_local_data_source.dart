
import 'package:sub1experttonton/data/datasources/db/database_helper_unitvy.dart';

import 'package:sub1experttonton/common/exception.dart';

import 'package:sub1experttonton/data/models/unitvy/unitvy_table.dart';


abstract class UnitvyLocalDataSource {

  Future<String>
    insertWatchlistTv(
      UnitvyTable tv
      );

  Future<String>
    removeWatchlistTv(
      UnitvyTable tv
      );

  Future<UnitvyTable?>
    getTvById(
      int id
      );

  Future<List<UnitvyTable>>
    getWatchlistTv(
      );

}


class UnitvyLocalDataSourceImpl
    implements
    UnitvyLocalDataSource {

  final DatabaseHelperUnitvy
     databaseHelperunitvy;

  UnitvyLocalDataSourceImpl(
      {
        required this
            .databaseHelperunitvy
      }
      );


  @override
  Future<String>
    insertWatchlistTv(
      UnitvyTable tv

      )
  async
  {

    try
    {
      await databaseHelperunitvy
          .insertWatchlistTv(
          tv
      );


      return
        'Added to Watchlist';
    }

    catch
    (e)
    {

      throw DatabaseException(
          e.toString(

          )
      );
    }
  }


  @override
  Future<String>
  removeWatchlistTv(
      UnitvyTable tv
      )
  async
  {

    try
    {

      await databaseHelperunitvy
          .removeWatchlistTv(
          tv
      );

      return
        'Removed from Watchlist';
    }

    catch
    (e)

    {

      throw DatabaseException(
          e.toString(

          )
      );
    }
  }


  @override
  Future<UnitvyTable?>
    getTvById(
      int id
      )

  async
  {

    final result =
    await databaseHelperunitvy
        .getTvById(
        id
    );


    if (
    result != null
    )
    {


      return UnitvyTable
          .fromMap(
          result
      );

    }
    else
    {

      return null;
    }
  }


  @override
  Future<List<UnitvyTable>>
  getWatchlistTv(
      )

  async
  {

    final result =
      await databaseHelperunitvy
        .getWatchlistTv(
    );

    return result.map(
            (data) => UnitvyTable
                .fromMap(data)
    )
        .toList(

    );
  }
}
