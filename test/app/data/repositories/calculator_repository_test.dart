import 'package:flutter_test/flutter_test.dart';
import 'package:imc_calculator_flutter/app/data/repositories/calculator_repository.dart';
import 'package:imc_calculator_flutter/app/models/user_model.dart';
import 'package:mockito/mockito.dart';


class CalcRepoMock extends Mock implements CalculatorRepository {
  
}
void main() async {
  final calculatorRepo = CalcRepoMock();
  test('Should return a List<UserModel>', () async {
    when(calculatorRepo.getUserCollection()).thenAnswer((_) async => <UserModel>[]);
    final list = await calculatorRepo.getUserCollection();
    expect(list, isA<List<UserModel>>());
  });
}

