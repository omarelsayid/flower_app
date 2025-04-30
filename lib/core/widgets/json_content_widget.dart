// lib/widgets/json_content_bottom_sheet.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Section {
  final String section;
  final Map<String, dynamic>? title;
  final Map<String, dynamic> content;
  final Map<String, dynamic> style;

  Section({
    required this.section,
    this.title,
    required this.content,
    required this.style,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      section: json['section'] as String,
      title:
          json['title'] != null
              ? Map<String, dynamic>.from(json['title'])
              : null,
      content: Map<String, dynamic>.from(json['content']),
      style: Map<String, dynamic>.from(
        json['style'] is Map<String, dynamic>
            ? json['style']
            : json['style']['content'],
      ),
    );
  }

  static Future<List<Section>> load(String assetPath, String rootKey) async {
    final rawData = await rootBundle.loadString(assetPath);
    final jsonData = json.decode(rawData) as Map<String, dynamic>;
    final list = jsonData[rootKey] as List;
    return list
        .map((e) => Section.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class JsonContentBottomSheet extends StatelessWidget {
  final String assetPath;
  final String rootKey;

  const JsonContentBottomSheet({
    Key? key,
    required this.assetPath,
    required this.rootKey,
  }) : super(key: key);

  static void show(
    BuildContext context, {
    required String assetPath,
    required String rootKey,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (_) => JsonContentBottomSheet(assetPath: assetPath, rootKey: rootKey),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 1.0,
      builder: (ctx, scrollController) {
        return FutureBuilder<List<Section>>(
          future: Section.load(assetPath, rootKey),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: \${snapshot.error}'));
            }
            final sections = snapshot.data!;

            return ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: sections.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, i) {
                final sec = sections[i];
                String pick(Map<String, dynamic> map) =>
                    (map[locale] ?? map['en']) as String;

                final rawStyle = sec.style;
                final nestedTitle = rawStyle['title'] is Map<String, dynamic>;
                final nestedContent =
                    rawStyle['content'] is Map<String, dynamic>;

                Map<String, dynamic> styleFor(bool isTitle) {
                  if (nestedTitle && nestedContent) {
                    return isTitle
                        ? Map<String, dynamic>.from(rawStyle['title'])
                        : Map<String, dynamic>.from(rawStyle['content']);
                  }
                  return Map<String, dynamic>.from(rawStyle);
                }

                Widget buildText(String text, Map<String, dynamic> style) {
                  final fontSize = (style['fontSize'] as num).toDouble();
                  final fontWeight =
                      style['fontWeight'] == 'bold'
                          ? FontWeight.bold
                          : FontWeight.normal;
                  final color = Color(
                    int.parse(
                          (style['color'] as String).substring(1),
                          radix: 16,
                        ) |
                        0xFF000000,
                  );
                  final alignStr =
                      (style['textAlign'][locale] ?? style['textAlign']['en'])
                          as String;
                  final textAlign = TextAlign.values.firstWhere(
                    (t) => t.toString().endsWith(alignStr),
                    orElse: () => TextAlign.left,
                  );

                  return Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: color,
                    ),
                    textAlign: textAlign,
                  );
                }

                final titleMap = sec.title;
                final contentRaw = sec.content[locale] ?? sec.content['en'];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (titleMap != null) ...[
                      buildText(pick(titleMap), styleFor(true)),
                      const SizedBox(height: 8),
                    ],
                    if (contentRaw is String)
                      buildText(contentRaw, styleFor(false))
                    else if (contentRaw is List)
                      ...contentRaw.map<Widget>((item) {
                        final text =
                            item is String
                                ? item
                                : (item[locale] ?? item['en']) as String;
                        return buildText(text, styleFor(false));
                      }),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
