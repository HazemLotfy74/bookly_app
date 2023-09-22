

import 'AccessInfo.dart';
import 'SaleInfo.dart';
import 'SearchInfo.dart';
import 'VolumeInfo.dart';

/// kind : "books#volume"
/// id : "rOCfDwAAQBAJ"
/// etag : "XZ4+bIMQJGM"
/// selfLink : "https://www.googleapis.com/books/v1/volumes/rOCfDwAAQBAJ"
/// volumeInfo : {"title":"Elements of Programming","authors":["Alexander Stepanov","Paul McJones"],"publisher":"Lulu.com","publishedDate":"2019-06-27","description":"Elements of Programming provides a different understanding of programming than is presented elsewhere. Its major premise is that practical programming, like other areas of science and engineering, must be based on a solid mathematical foundation. The book shows that algorithms implemented in a real programming language, such as C++, can operate in the most general mathematical setting. For example, the fast exponentiation algorithm is defined to work with any associative operation. Using abstract algorithms leads to efficient, reliable, secure, and economical software.","industryIdentifiers":[{"type":"ISBN_13","identifier":"9780578222141"},{"type":"ISBN_10","identifier":"0578222140"}],"readingModes":{"text":false,"image":true},"pageCount":282,"printType":"BOOK","categories":["Computers"],"maturityRating":"NOT_MATURE","allowAnonLogging":false,"contentVersion":"0.0.1.0.preview.1","panelizationSummary":{"containsEpubBubbles":false,"containsImageBubbles":false},"imageLinks":{"smallThumbnail":"http://books.google.com/books/content?id=rOCfDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api","thumbnail":"http://books.google.com/books/content?id=rOCfDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"},"language":"en","previewLink":"http://books.google.com/books?id=rOCfDwAAQBAJ&printsec=frontcover&dq=programming&hl=&cd=1&source=gbs_api","infoLink":"http://books.google.com/books?id=rOCfDwAAQBAJ&dq=programming&hl=&source=gbs_api","canonicalVolumeLink":"https://books.google.com/books/about/Elements_of_Programming.html?hl=&id=rOCfDwAAQBAJ"}
/// saleInfo : {"country":"US","saleability":"NOT_FOR_SALE","isEbook":false}
/// accessInfo : {"country":"US","viewability":"PARTIAL","embeddable":true,"publicDomain":false,"textToSpeechPermission":"ALLOWED","epub":{"isAvailable":false},"pdf":{"isAvailable":true,"acsTokenLink":"http://books.google.com/books/download/Elements_of_Programming-sample-pdf.acsm?id=rOCfDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"},"webReaderLink":"http://play.google.com/books/reader?id=rOCfDwAAQBAJ&hl=&source=gbs_api","accessViewStatus":"SAMPLE","quoteSharingAllowed":false}
/// searchInfo : {"textSnippet":"This book shows that algorithms implemented in a real programming language, such as C++, can operate in the most general mathematical setting. For example, the fast exponentiation algorithm is defined to work with any associative operation."}

class BookModel {
  BookModel({
      String? kind, 
      String? id, 
      String? etag, 
      String? selfLink, 
      VolumeInfo? volumeInfo, 
      SaleInfo? saleInfo, 
      AccessInfo? accessInfo, 
      SearchInfo? searchInfo,}){
    _kind = kind;
    _id = id;
    _etag = etag;
    _selfLink = selfLink;
    _volumeInfo = volumeInfo;
    _saleInfo = saleInfo;
    _accessInfo = accessInfo;
    _searchInfo = searchInfo;
}

  BookModel.fromJson(dynamic json) {
    _kind = json['kind'];
    _id = json['id'];
    _etag = json['etag'];
    _selfLink = json['selfLink'];
    _volumeInfo = json['volumeInfo'] != null ? VolumeInfo.fromJson(json['volumeInfo']) : null;
    _saleInfo = json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    _accessInfo = json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null;
    _searchInfo = json['searchInfo'] != null ? SearchInfo.fromJson(json['searchInfo']) : null;
  }
  String? _kind;
  String? _id;
  String? _etag;
  String? _selfLink;
  VolumeInfo? _volumeInfo;
  SaleInfo? _saleInfo;
  AccessInfo? _accessInfo;
  SearchInfo? _searchInfo;

  String? get kind => _kind;
  String? get id => _id;
  String? get etag => _etag;
  String? get selfLink => _selfLink;
  VolumeInfo? get volumeInfo => _volumeInfo;
  SaleInfo? get saleInfo => _saleInfo;
  AccessInfo? get accessInfo => _accessInfo;
  SearchInfo? get searchInfo => _searchInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = _kind;
    map['id'] = _id;
    map['etag'] = _etag;
    map['selfLink'] = _selfLink;
    if (_volumeInfo != null) {
      map['volumeInfo'] = _volumeInfo?.toJson();
    }
    if (_saleInfo != null) {
      map['saleInfo'] = _saleInfo?.toJson();
    }
    if (_accessInfo != null) {
      map['accessInfo'] = _accessInfo?.toJson();
    }
    if (_searchInfo != null) {
      map['searchInfo'] = _searchInfo?.toJson();
    }
    return map;
  }

}