import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:niku/niku.dart';

import '../../bloc/bloc.dart';

class SearchHentai extends HookWidget {
  @override
  build(context) {
    final idController = useTextEditingController();

    final idForm = GlobalKey<FormState>();

    final hentai = context.read<HentaiBloc>();

    return NikuRow([
      NikuTextField("Id")
          .controller(idController)
          .validator((value) {
            if (value == null) return "Something went wrong";
            if (value.isEmpty) return "ID can't be empty";
            if (value.length > 6) return "ID is limit at 6 digits";
          })
          .phoneKeyboard()
          .inputFormatters([
            FilteringTextInputFormatter.digitsOnly,
          ])
          .maxLength(6)
          .counter(SizedBox.shrink())
          .niku()
            ..flex(),
      NikuButton(Text("Search"))
        ..onPressed(() {
          final form = idForm.currentState!;

          form.validate();

          final id = int.parse(idController.text);

          hentai.add(SetHentaiId(id));
        }),
    ]).niku()
      ..form(key: idForm);
  }
}
