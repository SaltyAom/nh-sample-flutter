import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

final httpLink = HttpLink('https://api.opener.studio/graphql');

final client = ValueNotifier(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  ),
);
