part of 'textvalid_bloc.dart';

// abstract class TextvalidState extends Equatable {
//   // const TextvalidState({this.fName, this.lName, this.description});
//   // final String fName;
//   // final String lName;
//   // final String description;

//   @override
//   List<Object> get props => [];
// }

enum FieldError { Empty, Invalid }

class TextvalidState {
  final bool isFull;
  final FieldError fNameError;
  final FieldError lNameError;
  final FieldError descriptionError;
  final bool submissionSuccess;

  TextvalidState({
    this.isFull: false,
    this.fNameError,
    this.lNameError,
    this.descriptionError,
    this.submissionSuccess,
  });
}

class TextvalidInitial extends TextvalidState {}
