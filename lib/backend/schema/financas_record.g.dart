// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FinancasRecord> _$financasRecordSerializer =
    new _$FinancasRecordSerializer();

class _$FinancasRecordSerializer
    implements StructuredSerializer<FinancasRecord> {
  @override
  final Iterable<Type> types = const [FinancasRecord, _$FinancasRecord];
  @override
  final String wireName = 'FinancasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FinancasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ganho;
    if (value != null) {
      result
        ..add('ganho')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.gasto;
    if (value != null) {
      result
        ..add('gasto')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.mes;
    if (value != null) {
      result
        ..add('mes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.categoria;
    if (value != null) {
      result
        ..add('categoria')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idFinanca;
    if (value != null) {
      result
        ..add('idFinanca')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  FinancasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FinancasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ganho':
          result.ganho = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'gasto':
          result.gasto = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'mes':
          result.mes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'categoria':
          result.categoria = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFinanca':
          result.idFinanca = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$FinancasRecord extends FinancasRecord {
  @override
  final String? uid;
  @override
  final int? ganho;
  @override
  final int? gasto;
  @override
  final int? total;
  @override
  final DateTime? data;
  @override
  final int? mes;
  @override
  final String? categoria;
  @override
  final int? idFinanca;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FinancasRecord([void Function(FinancasRecordBuilder)? updates]) =>
      (new FinancasRecordBuilder()..update(updates))._build();

  _$FinancasRecord._(
      {this.uid,
      this.ganho,
      this.gasto,
      this.total,
      this.data,
      this.mes,
      this.categoria,
      this.idFinanca,
      this.ffRef})
      : super._();

  @override
  FinancasRecord rebuild(void Function(FinancasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FinancasRecordBuilder toBuilder() =>
      new FinancasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FinancasRecord &&
        uid == other.uid &&
        ganho == other.ganho &&
        gasto == other.gasto &&
        total == other.total &&
        data == other.data &&
        mes == other.mes &&
        categoria == other.categoria &&
        idFinanca == other.idFinanca &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, uid.hashCode), ganho.hashCode),
                                gasto.hashCode),
                            total.hashCode),
                        data.hashCode),
                    mes.hashCode),
                categoria.hashCode),
            idFinanca.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FinancasRecord')
          ..add('uid', uid)
          ..add('ganho', ganho)
          ..add('gasto', gasto)
          ..add('total', total)
          ..add('data', data)
          ..add('mes', mes)
          ..add('categoria', categoria)
          ..add('idFinanca', idFinanca)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FinancasRecordBuilder
    implements Builder<FinancasRecord, FinancasRecordBuilder> {
  _$FinancasRecord? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  int? _ganho;
  int? get ganho => _$this._ganho;
  set ganho(int? ganho) => _$this._ganho = ganho;

  int? _gasto;
  int? get gasto => _$this._gasto;
  set gasto(int? gasto) => _$this._gasto = gasto;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  DateTime? _data;
  DateTime? get data => _$this._data;
  set data(DateTime? data) => _$this._data = data;

  int? _mes;
  int? get mes => _$this._mes;
  set mes(int? mes) => _$this._mes = mes;

  String? _categoria;
  String? get categoria => _$this._categoria;
  set categoria(String? categoria) => _$this._categoria = categoria;

  int? _idFinanca;
  int? get idFinanca => _$this._idFinanca;
  set idFinanca(int? idFinanca) => _$this._idFinanca = idFinanca;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FinancasRecordBuilder() {
    FinancasRecord._initializeBuilder(this);
  }

  FinancasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _ganho = $v.ganho;
      _gasto = $v.gasto;
      _total = $v.total;
      _data = $v.data;
      _mes = $v.mes;
      _categoria = $v.categoria;
      _idFinanca = $v.idFinanca;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FinancasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FinancasRecord;
  }

  @override
  void update(void Function(FinancasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FinancasRecord build() => _build();

  _$FinancasRecord _build() {
    final _$result = _$v ??
        new _$FinancasRecord._(
            uid: uid,
            ganho: ganho,
            gasto: gasto,
            total: total,
            data: data,
            mes: mes,
            categoria: categoria,
            idFinanca: idFinanca,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
