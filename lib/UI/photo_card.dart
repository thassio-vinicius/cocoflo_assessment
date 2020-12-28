import 'package:cocoflo_assessment/UI/associated_collections_dialog.dart';
import 'package:cocoflo_assessment/UI/network_photo.dart';
import 'package:cocoflo_assessment/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatefulWidget {
  final Photo photo;

  const PhotoCard(this.photo);
  @override
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (_) => AssociatedCollectionsDialog(widget.photo)),
      child: Container(
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.25,
          child: NetworkPhoto(widget.photo.urls.full)),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
