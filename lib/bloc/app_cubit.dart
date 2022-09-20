import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdfmagic/data/repository.dart';

import '../data/pdf.dart';
import '../data/types.dart' as types;

class AppCubit extends Cubit<types.AppState> {
  final Repository _repository;

  static AppCubit of(BuildContext context) =>
      BlocProvider.of<AppCubit>(context);

  AppCubit(super.initialState, this._repository);

  /// documents mode
  Future<void> addDocuments() async {
    List<PDFDocument> docs = await _repository.addDocuments();

    for (PDFDocument pdf in docs) {
      String thumbnailUrl = await pdf.getPageImageUrl(1, scale: 0.4);
      types.Document doc = types.Document(pdf: pdf, thumbnailUrl: thumbnailUrl, rotation: 0);
      emit(state.copyWith(documents: List<types.Document>.from(state.documents)..add(doc)));
    }

    for (PDFDocument pdf in docs) {
        for (int i = 0; i < pdf.pageCount; i++) {
          String? thumbnailUrl = await pdf.getPageImageUrl(i+1, scale: 0.4);
          types.Page page = types.Page(pdf: pdf, page: i, thumbnailUrl: thumbnailUrl, rotation: 0);
          emit(state.copyWith(pages: List<types.Page>.from(state.pages)..add(page)));
        }
    }

  }

  Future<void> removeDocument(int index) async {
    List<types.Document> documents = List.from(state.documents);
    documents.removeAt(index);
    emit(state.copyWith(documents: documents));
  }

  Future<void> reorderDocument(int oldIndex, int newIndex) async {
    types.Document document = state.documents.removeAt(oldIndex);
    state.documents.insert(newIndex, document);
  }

  Future<void> duplicateDocument(int index) async {
    List<types.Document> documents = List.from(state.documents);
    types.Document document = documents.elementAt(index);
    documents.insert(index, document);
    emit(state.copyWith(documents: documents));
  }

  Future<void> rotateDocument(int index) async {
    List<types.Document> documents = List.from(state.documents);
    types.Document document = documents.removeAt(index);
    documents.insert(index, document.copyWith(rotation: document.rotation + 90 % 360));
    emit(state.copyWith(documents: documents));
  }

  /// page mode
  Future<void> removePage(int index) async {
    List<types.Page> pages = List.from(state.pages);
    pages.removeAt(index);
    emit(state.copyWith(pages: pages));
  }

  Future<void> reorderPage(int oldIndex, int newIndex) async {
    types.Page page = state.pages.removeAt(oldIndex);
    state.pages.insert(newIndex, page);
  }

  Future<void> duplicatePage(int index) async {
    List<types.Page> pages = List.from(state.pages);
    types.Page page = pages.elementAt(index);
    pages.insert(index, page);
    emit(state.copyWith(pages: pages));
  }

  Future<void> rotatePage(int index) async {
    List<types.Page> pages = List.from(state.pages);
    types.Page page = pages.removeAt(index);

    pages.insert(index, page.copyWith(rotation: page.rotation + 90 % 360));
    emit(state.copyWith(pages: pages));
  }

  /// download options
  Future<void> downloadPdf() async {
    state.documentMode ?
    _repository.mergeDocuments(state.documents) :
    _repository.mergePages(state.pages);
  }

  Future<void> downloadZip() async {
    state.documentMode ?
    _repository.zipDocumentsPages(state.documents) :
    _repository.zipPages(state.pages);
  }

  /// mode switch
  Future<void> toggleMode() async {
    emit(state.copyWith(documentMode: !state.documentMode));
  }
}
