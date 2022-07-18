
import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';

class GetWatchListStatusUnitvy {

  final UnitvyRepository
  repository;

  GetWatchListStatusUnitvy(
      this.
      repository
      );


  Future<bool>
  execute(
      int id
      )
  async
  {

    return repository.
    isAddedToWatchlistTv
      (id);
  }
}
