
import 'package:mockito/mockito.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/search_unitvy_bloc/search_unitvy_bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sub1experttonton/common/failure.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:sub1experttonton/domain/usecases/unitvy/search_unitvy.dart';
import 'package:bloc_test/bloc_test.dart';

import 'unitvy_search_bloc_test.mocks.dart';
import 'package:mockito/annotations.dart';


@GenerateMocks(
    [
      SearchUnitvyBloc,
      SearchUnitvy
    ]
)


void main() {
  late MockSearchUnitvy
  mockSearchUnitvy;

  late SearchUnitvyBloc
  searchUnitvyBloc;

  setUp(() {
    mockSearchUnitvy =
        MockSearchUnitvy();

    searchUnitvyBloc =
        SearchUnitvyBloc(
      searchUnitvy: mockSearchUnitvy,
    );
  }
  );

  const query =
      "originalTitle";
  final unitvyList =
      <Unitvy>[];


  test("initial state should be empty", ()
  {
    expect(searchUnitvyBloc.state,
        SearchUnitvyEmpty()
    );
  }
  );


  blocTest<SearchUnitvyBloc,
      SearchUnitvyState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockSearchUnitvy
          .execute(query)
      )
          .thenAnswer((_) async =>
          Right(unitvyList)
      );
      return searchUnitvyBloc;
    },

    act: (bloc) => bloc.add(
        const SearchUnitvyQueryEvent(query)
    ),

    expect: () => [
      SearchUnitvyLoading(),
      SearchUnitvyLoaded(unitvyList)
    ],

    verify: (bloc) {
      verify(mockSearchUnitvy
          .execute(query)
      );
    },
  );


  group('Search Tv BLoC Test', () {
    blocTest<SearchUnitvyBloc,
        SearchUnitvyState>(
      'Should emit [Loading, Error] when get search is unsuccessful',

      build: () {
        when(mockSearchUnitvy
            .execute(query)
        )
            .thenAnswer((_) async =>
            const Left(ServerFailure(
                'Server Failure')
            )
        );

        return searchUnitvyBloc;
      },

      act: (bloc) => bloc.add(
          const SearchUnitvyQueryEvent(
              query)
      ),

      expect: () =>
      [SearchUnitvyLoading(),
        const SearchUnitvyError(
            'Server Failure')
      ],

      verify: (bloc) {
        verify(mockSearchUnitvy
            .execute(query)
        );
      },
    );
  },
  );
}