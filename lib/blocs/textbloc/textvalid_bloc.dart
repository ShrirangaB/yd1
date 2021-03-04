import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'textvalid_event.dart';
part 'textvalid_state.dart';

class TextvalidBloc extends Bloc<TextvalidEvent, TextvalidState> {
  bool isFieldEmpty(String fieldValue) => fieldValue?.isEmpty ?? true;

  TextvalidBloc() : super(TextvalidInitial());

  @override
  Stream<TextvalidState> mapEventToState(
    TextvalidEvent event,
  ) async* {
    if (event is TextvalidEventSubmit) {
      yield TextvalidState(isFull: true);

      if (this.isFieldEmpty(event.fName)) {
        yield TextvalidState(fNameError: FieldError.Empty);
        //return;
      }
      if (this.isFieldEmpty(event.lName)) {
        yield TextvalidState(lNameError: FieldError.Empty);
        //return;
      }
      if (this.isFieldEmpty(event.description)) {
        yield TextvalidState(descriptionError: FieldError.Empty);
        //return;
      }
      yield TextvalidState(submissionSuccess: true);
    }
  }
}
