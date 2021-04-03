import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

@immutable
class HentaiModel {
  final int id;
  final Hentai hentai;

  const HentaiModel({
    required this.id,
    required this.hentai,
  });
}

@immutable
abstract class HentaiEvent {}

@immutable
class SetHentai extends HentaiEvent {
  final Hentai hentai;

  SetHentai(this.hentai);
}

@immutable
class SetHentaiId extends HentaiEvent {
  final int id;

  SetHentaiId(this.id);
}

class HentaiBloc extends Bloc<HentaiEvent, HentaiModel> {
  HentaiBloc()
      : super(HentaiModel(
          id: 229345,
          hentai: Hentai.fromJson({
            "success": false,
            "info": "Initialize",
          }),
        ));

  @override
  Stream<HentaiModel> mapEventToState(HentaiEvent event) async* {
    if (event is SetHentaiId) {
      yield HentaiModel(
        id: event.id,
        hentai: state.hentai,
      );
    }

    if (event is SetHentai) {
      yield HentaiModel(
        id: state.id,
        hentai: event.hentai,
      );
    }
  }
}
