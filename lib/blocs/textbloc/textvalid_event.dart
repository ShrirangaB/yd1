part of 'textvalid_bloc.dart';

// abstract class TextvalidEvent extends Equatable {
//   const TextvalidEvent();

//   @override
//   List<Object> get props => [];
// }

// class FirstNameChanged extends TextvalidEvent {
//   const FirstNameChanged({@required this.fName});

//   final String fName;
//   @override
//   List<Object> get props => [fName];
// }

// class LastNameChanged extends TextvalidEvent {
//   const LastNameChanged({@required this.lName});

//   final String lName;
//   @override
//   List<Object> get props => [lName];
// }

// class DescriptionChanged extends TextvalidEvent {
//   const DescriptionChanged({@required this.description});

//   final String description;
//   @override
//   List<Object> get props => [description];
// }
abstract class TextvalidEvent {}

class TextvalidEventSubmit extends TextvalidEvent {
  final String fName;
  final String lName;
  final String description;

  TextvalidEventSubmit(this.fName, this.lName, this.description);
}
