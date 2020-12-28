import 'package:cocoflo_assessment/models/profile_image.dart';

import 'user_links.dart';

class User {
  String id;
  String updatedAt;
  String username;
  String name;
  String portfolioUrl;
  String bio;
  String location;
  int totalLikes;
  int totalPhotos;
  int totalCollections;
  UserLinks links;
  ProfileImage profileImage;

  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.totalLikes,
    this.totalPhotos,
    this.totalCollections,
    this.links,
    this.profileImage,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalCollections = json['total_collections'];
    profileImage = ProfileImage.fromJson(Map.from(json['profile_image']));
    links =
        json['links'] != null ? new UserLinks.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    data['total_collections'] = this.totalCollections;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}
