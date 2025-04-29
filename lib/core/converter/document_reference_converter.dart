import 'package:json_annotation/json_annotation.dart';

import '../constants/aliases.dart';


class DocumentReferenceConverter implements JsonConverter<FDocumentReference, FDocumentReference> {
  const DocumentReferenceConverter();

  @override
  FDocumentReference fromJson(FDocumentReference json) {
    return json;
  }

  @override
  FDocumentReference toJson(FDocumentReference object) {
    return object;
  }
}
