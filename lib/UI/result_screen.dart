import 'package:cocoflo_assessment/UI/network_photo.dart';
import 'package:cocoflo_assessment/UI/photo_card.dart';
import 'package:cocoflo_assessment/models/collection.dart';
import 'package:cocoflo_assessment/models/photo.dart';
import 'package:cocoflo_assessment/models/search_result.dart';
import 'package:cocoflo_assessment/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

enum FutureType { collectionSearch, photoSearch, photoList }

class ResultScreen extends StatefulWidget {
  final bool collectionSelected;

  const ResultScreen({@required this.collectionSelected});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<PhotoSearchResult> _loadPhotos() {
    var apiProvider = Provider.of<ApiProvider>(context, listen: false);
    return apiProvider.searchImages();
  }

  Future<CollectionSearchResult> _loadCollections() {
    var apiProvider = Provider.of<ApiProvider>(context, listen: false);
    return apiProvider.searchCollections();
  }

  List<String> _sortMethods = [
    'Most Popular',
    'Less Popular',
    'Latest Entry',
    'Earliest Entry',
  ];

  String _currentSort;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("result screen")),
      body: Column(
        children: [
          _dropdown(),
          Expanded(
            child: widget.collectionSelected
                ? _futureBuilder(context,
                    future: _loadCollections(),
                    type: FutureType.collectionSearch)
                : _futureBuilder(context,
                    future: _loadPhotos(), type: FutureType.photoSearch),
          ),
        ],
      ),
    );
  }

  Align _dropdown({ValueChanged<String> onChanged}) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Colors.black, width: 0.6)),
          child: DropdownButtonFormField(
            hint: Text('Sort By'),
            decoration: InputDecoration(contentPadding: EdgeInsets.all(4)),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            isExpanded: false,
            value: _currentSort,
            itemHeight: 50,
            items: _sortMethods.map((sort) {
              return DropdownMenuItem<String>(
                child: Text(sort),
                value: sort,
              );
            }).toList(),
            onChanged:
                onChanged ?? (sort) => setState(() => _currentSort = sort),
          ),
        ),
      ),
    );
  }

  FutureBuilder _futureBuilder(context, {Future future, FutureType type}) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData && !snapshot.hasError) {
            switch (type) {
              case FutureType.photoSearch:
                return ListView(
                    padding: EdgeInsets.all(16),
                    addAutomaticKeepAlives: true,
                    children: _sortResults(photos: snapshot.data.results));
              case FutureType.photoList:
                return ListView(
                  addAutomaticKeepAlives: true,
                  padding: EdgeInsets.all(16),
                  children: _sortResults(photos: snapshot.data),
                );
              case FutureType.collectionSearch:
                return GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    children: _sortResults(collections: snapshot.data.results));
              default:
                return Center(
                  child: Text(
                      'UNEXPECTED TYPE ' + snapshot.runtimeType.toString()),
                );
            }
          } else {
            return Center(
              child: Text('An error occurred ' + snapshot.error.toString()),
            );
          }
        });
  }

  List<Widget> _sortResults(
      {List<Photo> photos, List<Collection> collections}) {
    if (collections == null) {
      if (_currentSort != null) {
        switch (_currentSort) {
          case "Less Popular":
            photos.sort((a, b) => a.likes.compareTo(b.likes));
            break;
          case "Most Popular":
            photos.sort((a, b) => b.likes.compareTo(a.likes));
            break;
          case "Earliest Entry":
            photos.sort((a, b) => DateTime.parse(a.createdAt)
                .compareTo(DateTime.parse(b.createdAt)));
            break;
          case "Latest Entry":
            photos.sort((a, b) => DateTime.parse(b.createdAt)
                .compareTo(DateTime.parse(a.createdAt)));
            break;
        }
      }

      List<Widget> children =
          photos.map((e) => PhotoCard(e)).toList().cast<Widget>();
      return children;
    } else {
      if (_currentSort != null) {
        switch (_currentSort) {
          case "Less Popular":
            collections.sort((a, b) => DateTime.parse(a.lastCollectedAt)
                .compareTo(DateTime.parse(b.lastCollectedAt)));
            break;
          case "Most Popular":
            collections.sort((a, b) => DateTime.parse(b.lastCollectedAt)
                .compareTo(DateTime.parse(a.lastCollectedAt)));
            break;
          case "Earliest Entry":
            collections.sort((a, b) => DateTime.parse(a.publishedAt)
                .compareTo(DateTime.parse(b.publishedAt)));
            break;
          case "Latest Entry":
            collections.sort((a, b) => DateTime.parse(b.publishedAt)
                .compareTo(DateTime.parse(a.publishedAt)));
            break;
        }
      }

      List<Widget> children = collections
          .map((e) => GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Dialog(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Stack(
                                overflow: Overflow.visible,
                                alignment: Alignment.topCenter,
                                children: [
                                  Positioned(
                                    left: -8,
                                    top: -8,
                                    child: IconButton(
                                      alignment: Alignment.center,
                                      iconSize: 24,
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  Positioned(
                                    right: 8,
                                    top: 8,
                                    child: _dropdown(
                                        onChanged: (sort) => setState(
                                            () => _currentSort = sort)),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: _futureBuilder(context,
                                    future: Provider.of<ApiProvider>(context,
                                            listen: false)
                                        .getCollectionPhotos(e.id),
                                    type: FutureType.photoList),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: NetworkPhoto(e.coverPhoto.urls.full)),
              ))
          .toList();

      return children;
    }
  }
}
