import 'package:flutter/material.dart';

class NetworkPhoto extends StatelessWidget {
  final String source;
  const NetworkPhoto(this.source);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      source,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: Colors.grey[200],
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          ),
        );
      },
    );
  }
}
