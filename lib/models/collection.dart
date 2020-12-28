import 'package:cocoflo_assessment/models/photo.dart';
import 'package:cocoflo_assessment/models/user.dart';

class Collection {
  String id;
  String title;
  String publishedAt;
  String description;
  String lastCollectedAt;
  String updatedAt;
  Photo coverPhoto;
  User user;
  bool featured;
  int totalPhotos;
  bool private;
  String shareKey;

  Collection(
      {this.id,
      this.title,
      this.publishedAt,
      this.description,
      this.lastCollectedAt,
      this.updatedAt,
      this.coverPhoto,
      this.featured,
      this.private,
      this.shareKey,
      this.totalPhotos,
      this.user});

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    publishedAt = json['published_at'];
    lastCollectedAt = json['last_collected_at'];
    updatedAt = json['updated_at'];
    coverPhoto = Photo.fromJson(Map.from(json['cover_photo']));
    user = User.fromJson(Map.from(json['user']));
    featured = json['featured'];
    private = json['private'];
    shareKey = json['shareKey'];
    totalPhotos = json['totalPhotos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['published_at'] = this.publishedAt;
    data['last_collected_at'] = this.lastCollectedAt;
    data['updated_at'] = this.updatedAt;
    data['cover_photo'] = this.coverPhoto;
    data['user'] = this.user;
    data['description'] = this.description;
    data['featured'] = this.featured;
    data['totalPhotos'] = this.totalPhotos;
    data['shareKey'] = this.shareKey;
    data['private'] = this.private;
    return data;
  }
}
