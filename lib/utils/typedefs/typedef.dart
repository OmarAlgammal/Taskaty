import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

typedef DataBuilder<T> = T Function(dynamic map);
typedef QuerySnapshotBuilder<T> = T Function(List<QueryDocumentSnapshot> snapshot);
typedef QueryBuilder = Query Function(Query query);
typedef HiveQueryBuilder<T> = T Function(BoxEvent boxEvent);
