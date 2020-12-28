import 'package:cocoflo_assessment/UI/network_photo.dart';
import 'package:cocoflo_assessment/models/photo.dart';
import 'package:flutter/material.dart';

class AssociatedCollectionsDialog extends StatelessWidget {
  final Photo photo;
  const AssociatedCollectionsDialog(this.photo);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
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
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Center(child: Text('Associated Collections')),
                ],
              ),
            ),
            photo.currentUserCollections.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text('no associated collections for this picture'),
                    ),
                  )
                : Expanded(
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      children: photo.currentUserCollections
                          .map((d) => NetworkPhoto(d.coverPhoto.urls.full))
                          .toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
