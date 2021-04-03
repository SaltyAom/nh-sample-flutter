import 'package:flutter/material.dart';

import 'package:niku/niku.dart';

Widget imageLoadingIndicator(
  BuildContext context,
  Widget child,
  ImageChunkEvent? loadingProgress,
) =>
    loadingProgress == null
        ? child
        : CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ).niku().center();
