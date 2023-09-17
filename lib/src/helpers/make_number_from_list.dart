int makeNumber(List<int> list) {
  final len = list.length;
  int result = 0;

  for (int i = len - 1; 0 <= i; --i) {
    result = result * 10 + list[i];
  }

  return result;
}
