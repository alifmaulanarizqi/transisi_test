class BaseResponseDto<T> {
  final List<T> results;
  final int offset;
  final int number;
  final int totalResults;

  const BaseResponseDto({
    required this.results,
    this.offset = 0,
    this.number = 0,
    this.totalResults = 0,
  });

  @override
  String toString() {
    return 'BaseResponseDto{data: $results, page: $offset, totalData: $number, count: $totalResults}';
  }
}