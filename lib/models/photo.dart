import 'package:cocoflo_assessment/models/collection.dart';
import 'package:cocoflo_assessment/models/photo_links.dart';
import 'package:cocoflo_assessment/models/tag.dart';
import 'package:cocoflo_assessment/models/url.dart';
import 'package:cocoflo_assessment/models/user.dart';

import 'exif.dart';
import 'location.dart';

class Photo {
  String id;
  String createdAt;
  String updatedAt;
  int width;
  int height;
  String color;
  String blurHash;
  int downloads;
  int likes;
  bool likedByUser;
  String description;
  Exif exif;
  Location location;
  List<Tag> tags;
  List<Collection> currentUserCollections;
  Urls urls;
  PhotoLinks links;
  User user;

  Photo(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.width,
      this.height,
      this.color,
      this.blurHash,
      this.downloads,
      this.likes,
      this.likedByUser,
      this.description,
      this.exif,
      this.location,
      this.tags,
      this.currentUserCollections,
      this.urls,
      this.links,
      this.user});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    downloads = json['downloads'];
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    description = json['description'];
    exif = json['exif'] != null ? new Exif.fromJson(json['exif']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    if (json['tags'] != null) {
      tags = new List<Tag>();
      json['tags'].forEach((v) {
        tags.add(new Tag.fromJson(v));
      });
    }
    if (json['current_user_collections'] != null) {
      currentUserCollections = new List<Collection>();
      json['current_user_collections'].forEach((v) {
        currentUserCollections.add(new Collection.fromJson(v));
      });
    }
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links =
        json['links'] != null ? new PhotoLinks.fromJson(json['links']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['blur_hash'] = this.blurHash;
    data['downloads'] = this.downloads;
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    data['description'] = this.description;
    if (this.exif != null) {
      data['exif'] = this.exif.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.currentUserCollections != null) {
      data['current_user_collections'] =
          this.currentUserCollections.map((v) => v.toJson()).toList();
    }
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
