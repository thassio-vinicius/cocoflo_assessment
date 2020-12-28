import 'package:cocoflo_assessment/models/collection.dart';
import 'package:cocoflo_assessment/models/photo.dart';

class PhotoSearchResult {
  int total;
  int totalPages;
  List<Photo> results;

  PhotoSearchResult({this.total, this.totalPages, this.results});

  PhotoSearchResult.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<Photo>();
      json['results'].forEach((v) {
        results.add(new Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CollectionSearchResult {
  int total;
  int totalPages;
  List<Collection> results;

  CollectionSearchResult({this.total, this.totalPages, this.results});

  CollectionSearchResult.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<Collection>();
      json['results'].forEach((v) {
        results.add(new Collection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
