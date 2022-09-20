// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Document {
  PDFDocument get pdf => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  int get rotation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res>;
  $Res call({PDFDocument pdf, String thumbnailUrl, int rotation});
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res> implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  final Document _value;
  // ignore: unused_field
  final $Res Function(Document) _then;

  @override
  $Res call({
    Object? pdf = freezed,
    Object? thumbnailUrl = freezed,
    Object? rotation = freezed,
  }) {
    return _then(_value.copyWith(
      pdf: pdf == freezed
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as PDFDocument,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rotation: rotation == freezed
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DocumentCopyWith<$Res> implements $DocumentCopyWith<$Res> {
  factory _$$_DocumentCopyWith(
          _$_Document value, $Res Function(_$_Document) then) =
      __$$_DocumentCopyWithImpl<$Res>;
  @override
  $Res call({PDFDocument pdf, String thumbnailUrl, int rotation});
}

/// @nodoc
class __$$_DocumentCopyWithImpl<$Res> extends _$DocumentCopyWithImpl<$Res>
    implements _$$_DocumentCopyWith<$Res> {
  __$$_DocumentCopyWithImpl(
      _$_Document _value, $Res Function(_$_Document) _then)
      : super(_value, (v) => _then(v as _$_Document));

  @override
  _$_Document get _value => super._value as _$_Document;

  @override
  $Res call({
    Object? pdf = freezed,
    Object? thumbnailUrl = freezed,
    Object? rotation = freezed,
  }) {
    return _then(_$_Document(
      pdf: pdf == freezed
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as PDFDocument,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rotation: rotation == freezed
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Document implements _Document {
  const _$_Document(
      {required this.pdf, required this.thumbnailUrl, required this.rotation});

  @override
  final PDFDocument pdf;
  @override
  final String thumbnailUrl;
  @override
  final int rotation;

  @override
  String toString() {
    return 'Document(pdf: $pdf, thumbnailUrl: $thumbnailUrl, rotation: $rotation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Document &&
            const DeepCollectionEquality().equals(other.pdf, pdf) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailUrl, thumbnailUrl) &&
            const DeepCollectionEquality().equals(other.rotation, rotation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pdf),
      const DeepCollectionEquality().hash(thumbnailUrl),
      const DeepCollectionEquality().hash(rotation));

  @JsonKey(ignore: true)
  @override
  _$$_DocumentCopyWith<_$_Document> get copyWith =>
      __$$_DocumentCopyWithImpl<_$_Document>(this, _$identity);
}

abstract class _Document implements Document {
  const factory _Document(
      {required final PDFDocument pdf,
      required final String thumbnailUrl,
      required final int rotation}) = _$_Document;

  @override
  PDFDocument get pdf;
  @override
  String get thumbnailUrl;
  @override
  int get rotation;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentCopyWith<_$_Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Page {
  PDFDocument get pdf => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  int get rotation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageCopyWith<Page> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageCopyWith<$Res> {
  factory $PageCopyWith(Page value, $Res Function(Page) then) =
      _$PageCopyWithImpl<$Res>;
  $Res call({PDFDocument pdf, int page, String? thumbnailUrl, int rotation});
}

/// @nodoc
class _$PageCopyWithImpl<$Res> implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._value, this._then);

  final Page _value;
  // ignore: unused_field
  final $Res Function(Page) _then;

  @override
  $Res call({
    Object? pdf = freezed,
    Object? page = freezed,
    Object? thumbnailUrl = freezed,
    Object? rotation = freezed,
  }) {
    return _then(_value.copyWith(
      pdf: pdf == freezed
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as PDFDocument,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rotation: rotation == freezed
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PageCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$$_PageCopyWith(_$_Page value, $Res Function(_$_Page) then) =
      __$$_PageCopyWithImpl<$Res>;
  @override
  $Res call({PDFDocument pdf, int page, String? thumbnailUrl, int rotation});
}

/// @nodoc
class __$$_PageCopyWithImpl<$Res> extends _$PageCopyWithImpl<$Res>
    implements _$$_PageCopyWith<$Res> {
  __$$_PageCopyWithImpl(_$_Page _value, $Res Function(_$_Page) _then)
      : super(_value, (v) => _then(v as _$_Page));

  @override
  _$_Page get _value => super._value as _$_Page;

  @override
  $Res call({
    Object? pdf = freezed,
    Object? page = freezed,
    Object? thumbnailUrl = freezed,
    Object? rotation = freezed,
  }) {
    return _then(_$_Page(
      pdf: pdf == freezed
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as PDFDocument,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rotation: rotation == freezed
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Page implements _Page {
  const _$_Page(
      {required this.pdf,
      required this.page,
      required this.thumbnailUrl,
      required this.rotation});

  @override
  final PDFDocument pdf;
  @override
  final int page;
  @override
  final String? thumbnailUrl;
  @override
  final int rotation;

  @override
  String toString() {
    return 'Page(pdf: $pdf, page: $page, thumbnailUrl: $thumbnailUrl, rotation: $rotation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Page &&
            const DeepCollectionEquality().equals(other.pdf, pdf) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailUrl, thumbnailUrl) &&
            const DeepCollectionEquality().equals(other.rotation, rotation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pdf),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(thumbnailUrl),
      const DeepCollectionEquality().hash(rotation));

  @JsonKey(ignore: true)
  @override
  _$$_PageCopyWith<_$_Page> get copyWith =>
      __$$_PageCopyWithImpl<_$_Page>(this, _$identity);
}

abstract class _Page implements Page {
  const factory _Page(
      {required final PDFDocument pdf,
      required final int page,
      required final String? thumbnailUrl,
      required final int rotation}) = _$_Page;

  @override
  PDFDocument get pdf;
  @override
  int get page;
  @override
  String? get thumbnailUrl;
  @override
  int get rotation;
  @override
  @JsonKey(ignore: true)
  _$$_PageCopyWith<_$_Page> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  bool get documentMode => throw _privateConstructorUsedError;
  List<Document> get documents => throw _privateConstructorUsedError;
  List<Page> get pages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({bool documentMode, List<Document> documents, List<Page> pages});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? documentMode = freezed,
    Object? documents = freezed,
    Object? pages = freezed,
  }) {
    return _then(_value.copyWith(
      documentMode: documentMode == freezed
          ? _value.documentMode
          : documentMode // ignore: cast_nullable_to_non_nullable
              as bool,
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<Page>,
    ));
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  $Res call({bool documentMode, List<Document> documents, List<Page> pages});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, (v) => _then(v as _$_AppState));

  @override
  _$_AppState get _value => super._value as _$_AppState;

  @override
  $Res call({
    Object? documentMode = freezed,
    Object? documents = freezed,
    Object? pages = freezed,
  }) {
    return _then(_$_AppState(
      documentMode: documentMode == freezed
          ? _value.documentMode
          : documentMode // ignore: cast_nullable_to_non_nullable
              as bool,
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<Page>,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  const _$_AppState(
      {required this.documentMode,
      required this.documents,
      required this.pages});

  @override
  final bool documentMode;
  @override
  final List<Document> documents;
  @override
  final List<Page> pages;

  @override
  String toString() {
    return 'AppState(documentMode: $documentMode, documents: $documents, pages: $pages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            const DeepCollectionEquality()
                .equals(other.documentMode, documentMode) &&
            const DeepCollectionEquality().equals(other.documents, documents) &&
            const DeepCollectionEquality().equals(other.pages, pages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(documentMode),
      const DeepCollectionEquality().hash(documents),
      const DeepCollectionEquality().hash(pages));

  @JsonKey(ignore: true)
  @override
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required final bool documentMode,
      required final List<Document> documents,
      required final List<Page> pages}) = _$_AppState;

  @override
  bool get documentMode;
  @override
  List<Document> get documents;
  @override
  List<Page> get pages;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
