import 'package:cloud_firestore/cloud_firestore.dart';

typedef MapDynamic = Map<dynamic, dynamic>;

typedef MapStrDynamic = Map<String, dynamic>;

typedef FCollectionReference = CollectionReference<MapStrDynamic>;

typedef FQueryDocumentSnapshot = QueryDocumentSnapshot<MapStrDynamic>;

typedef FDocumentReference = DocumentReference<MapStrDynamic>;

typedef FDocumentSnapshot = DocumentSnapshot<MapStrDynamic>;

typedef FQuerySnapshot = QuerySnapshot<MapStrDynamic>;

typedef FQuerySnapshots = List<FQuerySnapshot>;

typedef FDocumentSnapshots = List<FDocumentSnapshot>;
