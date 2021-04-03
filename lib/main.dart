import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'services/graphql/graphql.dart';
import 'bloc/bloc.dart';

import 'pages/home/home.dart';

void main() async {
  await Hive.initFlutter();

  runApp(
    BlocProvider.value(
      value: HentaiBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter gql',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
