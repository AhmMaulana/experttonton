import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:sub1experttonton/common/failure.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_unitvy_detail.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/detail_unitvy_bloc/detail_unitvy_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/unitvy/dummy_objects_unitvy.dart';
import 'unitvy_detail_bloc_test.mocks.dart';


@GenerateMocks(
    [
      GetUnitvyDetail,
      DetailUnitvyBloc
    ]
)


void main() {
  late MockGetUnitvyDetail
  mockGetUnitvyDetail;

  late DetailUnitvyBloc
  detailUnitvyBloc;


  setUp(() {
    mockGetUnitvyDetail =
        MockGetUnitvyDetail();

    detailUnitvyBloc = DetailUnitvyBloc(
        getDetailUnitvy: mockGetUnitvyDetail
    );
  }
  );

  const unitvyId = 1;

  test("initial state should be empty", ()
  {
    expect(detailUnitvyBloc.state,
        DetailUnitvyEmpty()
    );
  }
  );


  group('Top Rated Movies BLoC Test', ()
  {
    blocTest<DetailUnitvyBloc,
        DetailUnitvyState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetUnitvyDetail
            .execute(unitvyId))
            .thenAnswer((_) async =>
            const Right(testUnitvyDetail));
        return detailUnitvyBloc;
      },

      act: (bloc) => bloc.add(
          const GetDetailUnitvyEvent(
              unitvyId)
      ),

      expect: () => [
        DetailUnitvyLoading(),
        const DetailUnitvyLoaded(
            testUnitvyDetail)
      ],

      verify: (bloc) {
        verify(mockGetUnitvyDetail
            .execute(unitvyId)
        );
      },
    );


    blocTest<DetailUnitvyBloc,
        DetailUnitvyState>(
      'Should emit [Loading, Error] when get detail is unsuccessful',
      build: () {
        when(mockGetUnitvyDetail
            .execute(unitvyId)
        )
            .thenAnswer((_) async =>
            const Left(ServerFailure(
                'Server Failure')
            )
        );

        return detailUnitvyBloc;
      },

      act: (bloc) => bloc.add(
          const GetDetailUnitvyEvent(
              unitvyId)
      ),

      expect: () => [DetailUnitvyLoading(),
        const DetailUnitvyError(
            'Server Failure')
      ],

      verify: (bloc) {
        verify(mockGetUnitvyDetail
            .execute(unitvyId)
          );
        },
      );
    },
  );
}