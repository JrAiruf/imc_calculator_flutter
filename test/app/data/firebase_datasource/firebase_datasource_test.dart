import 'package:flutter_test/flutter_test.dart';
import 'package:imc_calculator_flutter/app/data/firebase_datasource/firebase_datasource.dart';
import 'package:mockito/mockito.dart';

class FirebaseMock extends Mock implements FirebaseDatabase {}

void main() {
  final firebaseMock = FirebaseMock();

  test('Should return List<Map<String, dynamic>>', () async {
    when(firebaseMock.getCollection())
        .thenAnswer((realInvocation) async => listMock);

    final result = await firebaseMock.getCollection();
    expect(result?.first['currentImc'], 23.88);
  });
}

const listMock = [
  {
    'currentImc': 23.88,
    'email': 'js.pd2022@gmail.com',
    'id': 'haeytJaCk0FWr88ABXVI',
  },
];
