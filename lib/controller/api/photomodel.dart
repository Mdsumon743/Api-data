import 'dart:convert';


PhotoModel photoModelFromJson(String str) => PhotoModel.fromJson(json.decode(str));
String photoModelToJson(PhotoModel data) => json.encode(data.toJson());
class PhotoModel {
  PhotoModel({
      num? albumId, 
      num? id, 
      String? title, 
      String? url, 
      String? thumbnailUrl,}){
    _albumId = albumId;
    _id = id;
    _title = title;
    _url = url;
    _thumbnailUrl = thumbnailUrl;
}

  PhotoModel.fromJson(dynamic json) {
    _albumId = json['albumId'];
    _id = json['id'];
    _title = json['title'];
    _url = json['url'];
    _thumbnailUrl = json['thumbnailUrl'];
  }
  num? _albumId;
  num? _id;
  String? _title;
  String? _url;
  String? _thumbnailUrl;
PhotoModel copyWith({  num? albumId,
  num? id,
  String? title,
  String? url,
  String? thumbnailUrl,
}) => PhotoModel(  albumId: albumId ?? _albumId,
  id: id ?? _id,
  title: title ?? _title,
  url: url ?? _url,
  thumbnailUrl: thumbnailUrl ?? _thumbnailUrl,
);
  num? get albumId => _albumId;
  num? get id => _id;
  String? get title => _title;
  String? get url => _url;
  String? get thumbnailUrl => _thumbnailUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['albumId'] = _albumId;
    map['id'] = _id;
    map['title'] = _title;
    map['url'] = _url;
    map['thumbnailUrl'] = _thumbnailUrl;
    return map;
  }

}