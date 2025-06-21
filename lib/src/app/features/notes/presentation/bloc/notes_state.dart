part of 'notes_cubit.dart';

sealed class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesMain extends NotesState {
  final NotesViewModel viewModel;
  NotesMain({required this.viewModel});
}
