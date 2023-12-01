class SupportDto {
  final String url;
  final String text;

  const SupportDto({
    this.url = '',
    this.text = '',
  });

  @override
  String toString() {
    return 'SupportDto{url: $url, text: $text}';
  }
}