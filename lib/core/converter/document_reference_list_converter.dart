import 'package:json_annotation/json_annotation.dart';

import '../constants/aliases.dart';


class DocumentReferenceListConverter implements JsonConverter<List<FDocumentReference>, List<dynamic>> {
  const DocumentReferenceListConverter();

  @override
  List<FDocumentReference> fromJson(List<dynamic> json) {
    return json.map((e) => e as FDocumentReference).toList();
  }

  @override
  List<dynamic> toJson(List<FDocumentReference> object) {
    return object.map((e) => e).toList();
  }
}
