import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:niku/niku.dart';

import '../../bloc/bloc.dart';

import '../../modules/searchHentai/searchHentai.dart';

import '../../components/atoms/imageLoadingIndicator.dart';

import '../../services/graphql/graphql.dart';
import '../../services/graphql/queries/queries.dart';

import 'services/extractHentaiData.dart';

class HomePage extends HookWidget {
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: NikuColumn([
        SearchHentai(),
        BlocBuilder<HentaiBloc, HentaiModel>(builder: (context, hentai) {
          return GetHentaiById(hentai.id, (hentai) {
            final extracted = extractHentaiData(hentai);

            return NikuColumn([
              Image.network(
                extracted.coverImage,
                fit: BoxFit.cover,
                loadingBuilder: imageLoadingIndicator,
              ).niku()
                ..rounded(8)
                ..aspectRatio(extracted.coverRatio)
                ..shadows([
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 32,
                  )
                ])
                ..py(16),
              NikuText(extracted.title)..fontSize(21),
              NikuColumn(
                extracted.pages.map<Widget>((page) {
                  final link = page.link!;
                  final aspectRatio = page.info!.width / page.info!.height;

                  return Image.network(
                    link,
                    fit: BoxFit.cover,
                    loadingBuilder: imageLoadingIndicator,
                  ).niku()
                    ..aspectRatio(aspectRatio);
                }).toList(),
              ).mb(20),
            ]);
          });
        }),
      ]).niku()
        ..px(16)
        ..py(8)
        ..scrollable(),
    );
  }
}
