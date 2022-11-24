import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'financas_record.g.dart';

abstract class FinancasRecord
    implements Built<FinancasRecord, FinancasRecordBuilder> {
  static Serializer<FinancasRecord> get serializer =>
      _$financasRecordSerializer;

  String? get uid;

  int? get ganho;

  int? get gasto;

  int? get total;

  DateTime? get data;

  int? get mes;

  String? get categoria;

  int? get idFinanca;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FinancasRecordBuilder builder) => builder
    ..uid = ''
    ..ganho = 0
    ..gasto = 0
    ..total = 0
    ..mes = 0
    ..categoria = ''
    ..idFinanca = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('financas');

  static Stream<FinancasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FinancasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FinancasRecord._();
  factory FinancasRecord([void Function(FinancasRecordBuilder) updates]) =
      _$FinancasRecord;

  static FinancasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFinancasRecordData({
  String? uid,
  int? ganho,
  int? gasto,
  int? total,
  DateTime? data,
  int? mes,
  String? categoria,
  int? idFinanca,
}) {
  final firestoreData = serializers.toFirestore(
    FinancasRecord.serializer,
    FinancasRecord(
      (f) => f
        ..uid = uid
        ..ganho = ganho
        ..gasto = gasto
        ..total = total
        ..data = data
        ..mes = mes
        ..categoria = categoria
        ..idFinanca = idFinanca,
    ),
  );

  return firestoreData;
}
