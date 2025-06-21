import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/models/note_model.dart';
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/usecases/create_note_usecase.dart';
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/usecases/decrease_count_usecase.dart';
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/usecases/delete_note_usecase.dart';
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/usecases/get_notes_usecase.dart';
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/domain/usecases/increase_count_usecase.dart';
import 'package:flutter_clean_architecture_mvvm/src/app/features/notes/presentation/bloc/viewmodels/notes_view_model.dart';
import 'package:injectable/injectable.dart';

part 'notes_state.dart';

@injectable
class NotesCubit extends Cubit<NotesState> {
  final GetNotesUsecase _getNotesUsecase;
  final CreateNoteUsecase _createNoteUsecase;
  final DeleteNoteUsecase _deleteNoteUsecase;
  final IncreaseCountUsecase _increaseCountUsecase;
  final DecreaseCountUsecase _decreaseCountUsecase;

  NotesCubit({
    required GetNotesUsecase getNotesUsecase,
    required CreateNoteUsecase createNoteUsecase,
    required DeleteNoteUsecase deleteNoteUsecase,
    required IncreaseCountUsecase increaseCountUsecase,
    required DecreaseCountUsecase decreaseCountUsecase,
  }) : _getNotesUsecase = getNotesUsecase,
       _createNoteUsecase = createNoteUsecase,
       _deleteNoteUsecase = deleteNoteUsecase,
       _increaseCountUsecase = increaseCountUsecase,
       _decreaseCountUsecase = decreaseCountUsecase,
       super(NotesInitial());

  var _notes = <NoteModel>[];

  Future<void> initialize() async {
    _emiteloading();
    await _getNotes();
  }

  Future<void> _geNotes() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    final response = await _getNotesUsecase.call();

    response.fold(
      (error){
        _emitMain(overlay: overlay)
      } , onRight)
  }

  void _emitLoading() {
    emit(NotesLoading());
  }

  void _emitMain({NotesNavigation? navigation, 
    NotesOverlay? overlay,}) {
    emit(
        NotesMain(viewModel: NotesViewModel.formSuccessState(
          notes: _notes, 
          navigation: navigation, 
          overlay: overlay),
           ),
        
    );
    }

    void onExitTapped() {
      _emitMain(navigation: ExitNavigation());
    }

    void onProfileTapped() {
      _emitMain(navigation: ProfileNavigation());
    }

    void onCreateNoteTapped() {
      _emitMain(overlay: CreateNoteFormOverlay());
    }

    void createNote({required String title, required String content }) {
      final note = NoteModel(
        id: _notes.length,
        title: title,
        content: content
      );
      _createNote(note);
    }

    Future<void> _createNote(NoteModel note) async {
      final response = await _createNoteUsecase.call(note: note);

     response.fold(
      (error) {
        _emitMain(overlay: ServiceErrorOverlay());
      }, 
      
      (createdNote) {
        _notes.add(createdNote);
        _emitMain();
      }); 
    }
  }




