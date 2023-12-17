import 'package:cloud_firestore/cloud_firestore.dart';

typedef DataBuilder<T> = T Function(dynamic map);
typedef QueryBuilder = Query Function(Query query);
