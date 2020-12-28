import 'dart:convert';

import 'package:cocoflo_assessment/models/photo.dart';
import 'package:cocoflo_assessment/models/search_result.dart';
import 'package:cocoflo_assessment/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ApiProvider extends ChangeNotifier {
  IOClient _client = IOClient();

  HttpServices _services = HttpServices();

  searchImages() {
    return _services.searchImages(_client);
  }

  searchCollections() {
    return _services.searchCollections(_client);
  }

  getCollectionPhotos(id) {
    return _services.getPhotosFromCollection(_client, id);
  }
}

@visibleForTesting
class HttpServices {
  static String url = Constants.API_URL;

  Future<PhotoSearchResult> searchImages(http.Client client) async {
    print('GET METHOD STARTED');

    http.Response response = await client.get(
      '${url}search/photos?page=1&query=office&client_id=${Constants.ACCESS_KEY}',
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      PhotoSearchResult result =
          PhotoSearchResult.fromJson(Map.from(jsonDecode(response.body)));

      return result;
    }
    return null;
  }

  Future<List<Photo>> getPhotosFromCollection(
      http.Client client, String id) async {
    print('GET METHOD STARTED');

    http.Response response = await client.get(
      '${url}collections/$id/photos?client_id=${Constants.ACCESS_KEY}',
    );

    print(response.statusCode);

    if (response.statusCode == 200) return _parsePhotos(response.bodyBytes);

    return null;
  }

  List<Photo> _parsePhotos(responseBody) {
    final parsed =
        json.decode(utf8.decode(responseBody)).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  Future<CollectionSearchResult> searchCollections(
    http.Client client,
  ) async {
    print('GET METHOD STARTED');

    http.Response response = await client.get(
      '${url}search/collections?page=1&query=office&client_id=${Constants.ACCESS_KEY}',
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      CollectionSearchResult result =
          CollectionSearchResult.fromJson(Map.from(jsonDecode(response.body)));

      return result;
    }

    return null;
  }
}
