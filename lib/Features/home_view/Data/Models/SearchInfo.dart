/// textSnippet : "This book shows that algorithms implemented in a real programming language, such as C++, can operate in the most general mathematical setting. For example, the fast exponentiation algorithm is defined to work with any associative operation."

class SearchInfo {
  SearchInfo({
      String? textSnippet,}){
    _textSnippet = textSnippet;
}

  SearchInfo.fromJson(dynamic json) {
    _textSnippet = json['textSnippet'];
  }
  String? _textSnippet;

  String? get textSnippet => _textSnippet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textSnippet'] = _textSnippet;
    return map;
  }

}