import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:niku/niku.dart';

import '../../../bloc/bloc.dart';

import '../queries.dart';

import '../../../models/models.dart';

class GetHentaiById extends StatelessWidget {
  final int id;
  final Widget Function(Hentai hentai) builder;

  const GetHentaiById(
    this.id,
    this.builder,
  );

  @override
  build(context) {
    final hentaiBloc = context.read<HentaiBloc>();

    return Query(
      options: QueryOptions(
        document: gql(getHentaiById),
        variables: {
          'id': id,
        },
        pollInterval: Duration(seconds: 10),
      ),
      builder: (result, {refetch, fetchMore}) {
        if (result.hasException)
          return NikuText(result.exception.toString())
              .fontSize(21)
              .niku()
              .center();

        if (result.isLoading)
          return CircularProgressIndicator().niku().center();

        final jsonResult = result.data!['getHentaiById'];
        final hentai = Hentai.fromJson(jsonResult);

        hentaiBloc.add(SetHentai(hentai));

        // ? If no 'success' is requested, always end as success.
        if (!(hentai.success ?? true))
          return Text(hentai.info ?? "Something went wrong");

        return builder(hentai);
      },
    );
  }
}
