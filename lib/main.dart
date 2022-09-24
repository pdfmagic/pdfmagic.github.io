import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfmagic/data/repository.dart';
import 'package:pdfmagic/data/types.dart';
import 'package:reorderable_grid/reorderable_grid.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'bloc/app_cubit.dart';

void main() {
  Repository repository = Repository();
  runApp(BlocProvider<AppCubit>(
    create: ((context) => AppCubit(
        const AppState(documentMode: true, documents: [], pages: []),
        repository)),
    child: MaterialApp(
      home: LayoutBuilder(builder: (context, constraints) {
        if (constraints.minWidth < constraints.minHeight)
          return PDFMagicMobileApp(repository: repository);
        return PDFMagicApp(
          repository: repository,
        );
      }),
    ),
  ));
}

class PDFMagicApp extends StatelessWidget {
  final Repository repository;

  const PDFMagicApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFECECEC),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            int itemCount = state.documentMode
                ? state.documents.length
                : state.pages.length;

            return Column(
              children: [
                const MyAppBar(),
                Expanded(
                  child: itemCount == 0
                      ? PromoWidget()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                          child: ReorderableGridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 1.4142,
                                    crossAxisCount: 8,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemCount: itemCount,
                            onReorder: (oldIndex, newIndex) {
                              state.documentMode
                                  ? AppCubit.of(context)
                                      .reorderDocument(oldIndex, newIndex)
                                  : AppCubit.of(context)
                                      .reorderPage(oldIndex, newIndex);
                            },
                            itemBuilder: ((context, index) {
                              if (state.documentMode) {
                                return ItemOverlay(
                                  key: ValueKey(index),
                                  onDelete: () => AppCubit.of(context)
                                      .removeDocument(index),
                                  onDuplicate: () => AppCubit.of(context)
                                      .duplicateDocument(index),
                                  onRotate: () => AppCubit.of(context)
                                      .rotateDocument(index),
                                  child: Center(
                                    child: RotatedBox(
                                      quarterTurns:
                                          state.documents[index].rotation ~/ 90,
                                      child: Image.network(
                                          state.documents[index].thumbnailUrl),
                                    ),
                                  ),
                                );
                              } else {
                                return ItemOverlay(
                                  key: ValueKey(index),
                                  onDelete: () =>
                                      AppCubit.of(context).removePage(index),
                                  onDuplicate: () =>
                                      AppCubit.of(context).duplicatePage(index),
                                  onRotate: () =>
                                      AppCubit.of(context).rotatePage(index),
                                  child: Center(
                                    child: RotatedBox(
                                      quarterTurns:
                                          state.pages[index].rotation ~/ 90,
                                      child: Image.network(
                                          state.pages[index].thumbnailUrl!),
                                    ),
                                  ),
                                );
                              }
                            }),
                          ),
                        ),
                ),
                AdsWebView()
              ],
            );
          },
        ));
  }
}

class PromoWidget extends StatelessWidget {
  const PromoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          Text(
            "Du hast noch keine Dokumente ausgewählt.",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 40),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  side: MaterialStateProperty.all(BorderSide.none),
                  textStyle: MaterialStateProperty.all(
                      GoogleFonts.roboto(fontSize: 24))),
              onPressed: AppCubit.of(context).addDocuments,
              child: Text("Dokumente hinzufügen")),
          Spacer(flex: 2)
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.deepPurple, offset: Offset(0, 1), blurRadius: 4)
          ]),
          height: 100,
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: OutlinedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                            side: MaterialStateProperty.all(BorderSide.none),
                            textStyle: MaterialStateProperty.all(
                                GoogleFonts.roboto(fontSize: 24))),
                        onPressed: AppCubit.of(context).addDocuments,
                        child: Text("Dokumente hinzufügen")),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("PDF Magic",
                        style: GoogleFonts.rampartOne(fontSize: 40)),
                    // Text(
                    //   "Einfach, Schnell und völlig offline",
                    //   style: GoogleFonts.rampartOne(fontSize: 18),
                    // )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: PopupMenuButton<bool>(
                        onSelected: (value) {
                          value
                              ? AppCubit.of(context).downloadPdf()
                              : AppCubit.of(context).downloadZip();
                        },
                        itemBuilder: ((context) {
                          return [
                            const PopupMenuItem(
                                child: Text("Als ein PDF"), value: true),
                            const PopupMenuItem(
                                child: Text("Jede Seite einzeln"), value: false)
                          ];
                        }),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 32,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Speichern",
                              style: GoogleFonts.roboto(fontSize: 24),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        BlocBuilder<AppCubit, AppState>(builder: (context, state) {
          return ToggleSwitch(
            minHeight: 30,
            minWidth: 150.0,
            cornerRadius: 20.0,
            activeBgColors: const [
              [Colors.white],
              [Colors.white]
            ],
            activeFgColor: Colors.black,
            inactiveBgColor: const Color(0xFFD9D9D9),
            inactiveFgColor: Colors.black,
            initialLabelIndex: state.documentMode ? 0 : 1,
            totalSwitches: 2,
            labels: const ['Dokumente', 'Seiten'],
            radiusStyle: true,
            fontSize: 20,
            onToggle: (index) => AppCubit.of(context).toggleMode(),
          );
        }),
      ],
    );
  }
}

class ItemOverlay extends StatefulWidget {
  final Widget child;
  final Function() onDelete;
  final Function() onDuplicate;
  final Function() onRotate;
  final bool alwaysVisible;

  const ItemOverlay(
      {super.key,
      required this.child,
      required this.onDelete,
      required this.onDuplicate,
      required this.onRotate,
      this.alwaysVisible = false});

  @override
  State<ItemOverlay> createState() => _ItemOverlayState();
}

class _ItemOverlayState extends State<ItemOverlay> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        hovered = true;
      }),
      onExit: (_) => setState(() {
        hovered = false;
      }),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          widget.child,
          if (hovered || widget.alwaysVisible)
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.grey])),
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: widget.onDelete,
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                    IconButton(
                      onPressed: widget.onRotate,
                      icon: Icon(Icons.rotate_90_degrees_cw),
                      color: Colors.white,
                    ),
                    IconButton(
                        onPressed: widget.onDuplicate,
                        icon: Icon(Icons.copy),
                        color: Colors.white),
                  ]),
            )
        ],
      ),
    );
  }
}

class PDFMagicMobileApp extends StatelessWidget {
  final Repository repository;

  const PDFMagicMobileApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECECEC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.deepPurple,
        title: Text("PDF Magic",
            style: GoogleFonts.rampartOne(color: Colors.black)),
        centerTitle: false,
        actions: [
          PopupMenuButton<bool>(
              onSelected: (value) {
                value
                    ? AppCubit.of(context).downloadPdf()
                    : AppCubit.of(context).downloadZip();
              },
              itemBuilder: ((context) {
                return [
                  const PopupMenuItem(child: Text("Als ein PDF"), value: true),
                  const PopupMenuItem(
                      child: Text("Jede Seite einzeln"), value: false)
                ];
              }),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "Speichern",
                    style: GoogleFonts.roboto(color: Colors.black),
                  ),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: AppCubit.of(context).addDocuments,
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          int itemCount =
              state.documentMode ? state.documents.length : state.pages.length;

          return Column(children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ToggleSwitch(
                  minHeight: 22,
                  minWidth: 120.0,
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [Colors.white],
                    [Colors.white]
                  ],
                  activeFgColor: Colors.black,
                  inactiveBgColor: const Color(0xFFD9D9D9),
                  inactiveFgColor: Colors.black,
                  initialLabelIndex: state.documentMode ? 0 : 1,
                  totalSwitches: 2,
                  labels: const ['Dokumente', 'Seiten'],
                  radiusStyle: true,
                  onToggle: (index) => AppCubit.of(context).toggleMode(),
                ),
              ),
            ),
            Expanded(
              child: itemCount == 0
                  ? PromoWidget()
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: ReorderableGridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1 / 1.4142,
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8),
                        itemCount: itemCount,
                        onReorder: (oldIndex, newIndex) {
                          state.documentMode
                              ? AppCubit.of(context)
                                  .reorderDocument(oldIndex, newIndex)
                              : AppCubit.of(context)
                                  .reorderPage(oldIndex, newIndex);
                        },
                        itemBuilder: ((context, index) {
                          if (state.documentMode) {
                            return ItemOverlay(
                              key: ValueKey(index),
                              alwaysVisible: true,
                              onDelete: () =>
                                  AppCubit.of(context).removeDocument(index),
                              onDuplicate: () =>
                                  AppCubit.of(context).duplicateDocument(index),
                              onRotate: () =>
                                  AppCubit.of(context).rotateDocument(index),
                              child: Center(
                                child: RotatedBox(
                                  quarterTurns:
                                      state.documents[index].rotation ~/ 90,
                                  child: Image.network(
                                      state.documents[index].thumbnailUrl),
                                ),
                              ),
                            );
                          } else {
                            return ItemOverlay(
                              key: ValueKey(index),
                              alwaysVisible: true,
                              onDelete: () =>
                                  AppCubit.of(context).removePage(index),
                              onDuplicate: () =>
                                  AppCubit.of(context).duplicatePage(index),
                              onRotate: () =>
                                  AppCubit.of(context).rotatePage(index),
                              child: Center(
                                child: RotatedBox(
                                  quarterTurns:
                                      state.pages[index].rotation ~/ 90,
                                  child: Image.network(
                                    state.pages[index].thumbnailUrl!,
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                      ),
                    ),
            ),
            AdsWebView()
          ]);
        },
      ),
    );
  }
}

class AdsWebView extends StatefulWidget {
  @override
  State<AdsWebView> createState() => _AdsWebViewState();
}

class _AdsWebViewState extends State<AdsWebView> {
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iFrameElement.height = "80px";
    _iFrameElement.width = "800px";
    _iFrameElement.src = "https://pdfmagic.de/ads";
    _iFrameElement.style.border = "none";
    _iFrameElement.style.height = "80px";
    _iFrameElement.style.width = "800px";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 80,
      width: 800,
      child: HtmlElementView(
        key: UniqueKey(),
        viewType: "iframeElement",
      ),
    );
  }
}
