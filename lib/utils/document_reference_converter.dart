import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DocumentReferenceConverter implements JsonConverter<DocumentReference, String> {
  const DocumentReferenceConverter();

  @override
  String toJson(DocumentReference documentReference) {
    return documentReference.path ?? ''; // Return empty string if documentReference is null
  }

  @override
  DocumentReference<Object?> fromJson(String? path) {
    if (path == null) {
      throw ArgumentError("path cannot be null");
    }
    return FirebaseFirestore.instance.doc(path);
  }
}