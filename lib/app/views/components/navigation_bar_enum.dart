enum NavigationBarPosition {
  newCalculation(page: 'newCalculation'),
  information(page: 'informationPage');

  const NavigationBarPosition({this.page});
  final String? page;
}
