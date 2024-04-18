//
//  Generated code. Do not modify.
//  source: nanopb.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/descriptor.pbenum.dart' as $9;
import 'nanopb.pbenum.dart';

export 'nanopb.pbenum.dart';

/// This is the inner options message, which basically defines options for
/// a field. When it is used in message or file scope, it applies to all
/// fields.
class NanoPBOptions extends $pb.GeneratedMessage {
  factory NanoPBOptions({
    $core.int? maxSize,
    $core.int? maxCount,
    FieldType? type,
    $core.bool? longNames,
    $core.bool? packedStruct,
    $core.bool? skipMessage,
    IntSize? intSize,
    $core.bool? noUnions,
    $core.int? msgid,
    $core.bool? packedEnum,
    $core.bool? anonymousOneof,
    $core.bool? proto3,
    $core.bool? enumToString,
    $core.int? maxLength,
    $core.bool? fixedLength,
    $core.bool? fixedCount,
    TypenameMangling? mangleNames,
    $core.String? callbackDatatype,
    $core.String? callbackFunction,
    DescriptorSize? descriptorsize,
    $core.bool? proto3SingularMsgs,
    $core.bool? submsgCallback,
    $core.bool? defaultHas,
    $core.Iterable<$core.String>? include,
    $core.String? package,
    $core.Iterable<$core.String>? exclude,
    $9.FieldDescriptorProto_Type? typeOverride,
    $core.bool? sortByTag,
    FieldType? fallbackType,
  }) {
    final $result = create();
    if (maxSize != null) {
      $result.maxSize = maxSize;
    }
    if (maxCount != null) {
      $result.maxCount = maxCount;
    }
    if (type != null) {
      $result.type = type;
    }
    if (longNames != null) {
      $result.longNames = longNames;
    }
    if (packedStruct != null) {
      $result.packedStruct = packedStruct;
    }
    if (skipMessage != null) {
      $result.skipMessage = skipMessage;
    }
    if (intSize != null) {
      $result.intSize = intSize;
    }
    if (noUnions != null) {
      $result.noUnions = noUnions;
    }
    if (msgid != null) {
      $result.msgid = msgid;
    }
    if (packedEnum != null) {
      $result.packedEnum = packedEnum;
    }
    if (anonymousOneof != null) {
      $result.anonymousOneof = anonymousOneof;
    }
    if (proto3 != null) {
      $result.proto3 = proto3;
    }
    if (enumToString != null) {
      $result.enumToString = enumToString;
    }
    if (maxLength != null) {
      $result.maxLength = maxLength;
    }
    if (fixedLength != null) {
      $result.fixedLength = fixedLength;
    }
    if (fixedCount != null) {
      $result.fixedCount = fixedCount;
    }
    if (mangleNames != null) {
      $result.mangleNames = mangleNames;
    }
    if (callbackDatatype != null) {
      $result.callbackDatatype = callbackDatatype;
    }
    if (callbackFunction != null) {
      $result.callbackFunction = callbackFunction;
    }
    if (descriptorsize != null) {
      $result.descriptorsize = descriptorsize;
    }
    if (proto3SingularMsgs != null) {
      $result.proto3SingularMsgs = proto3SingularMsgs;
    }
    if (submsgCallback != null) {
      $result.submsgCallback = submsgCallback;
    }
    if (defaultHas != null) {
      $result.defaultHas = defaultHas;
    }
    if (include != null) {
      $result.include.addAll(include);
    }
    if (package != null) {
      $result.package = package;
    }
    if (exclude != null) {
      $result.exclude.addAll(exclude);
    }
    if (typeOverride != null) {
      $result.typeOverride = typeOverride;
    }
    if (sortByTag != null) {
      $result.sortByTag = sortByTag;
    }
    if (fallbackType != null) {
      $result.fallbackType = fallbackType;
    }
    return $result;
  }
  NanoPBOptions._() : super();
  factory NanoPBOptions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NanoPBOptions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NanoPBOptions', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'maxSize', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'maxCount', $pb.PbFieldType.O3)
    ..e<FieldType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: FieldType.FT_DEFAULT, valueOf: FieldType.valueOf, enumValues: FieldType.values)
    ..a<$core.bool>(4, _omitFieldNames ? '' : 'longNames', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..aOB(5, _omitFieldNames ? '' : 'packedStruct')
    ..aOB(6, _omitFieldNames ? '' : 'skipMessage')
    ..e<IntSize>(7, _omitFieldNames ? '' : 'intSize', $pb.PbFieldType.OE, defaultOrMaker: IntSize.IS_DEFAULT, valueOf: IntSize.valueOf, enumValues: IntSize.values)
    ..aOB(8, _omitFieldNames ? '' : 'noUnions')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'msgid', $pb.PbFieldType.OU3)
    ..aOB(10, _omitFieldNames ? '' : 'packedEnum')
    ..aOB(11, _omitFieldNames ? '' : 'anonymousOneof')
    ..aOB(12, _omitFieldNames ? '' : 'proto3')
    ..aOB(13, _omitFieldNames ? '' : 'enumToString')
    ..a<$core.int>(14, _omitFieldNames ? '' : 'maxLength', $pb.PbFieldType.O3)
    ..aOB(15, _omitFieldNames ? '' : 'fixedLength')
    ..aOB(16, _omitFieldNames ? '' : 'fixedCount')
    ..e<TypenameMangling>(17, _omitFieldNames ? '' : 'mangleNames', $pb.PbFieldType.OE, defaultOrMaker: TypenameMangling.M_NONE, valueOf: TypenameMangling.valueOf, enumValues: TypenameMangling.values)
    ..a<$core.String>(18, _omitFieldNames ? '' : 'callbackDatatype', $pb.PbFieldType.OS, defaultOrMaker: 'pb_callback_t')
    ..a<$core.String>(19, _omitFieldNames ? '' : 'callbackFunction', $pb.PbFieldType.OS, defaultOrMaker: 'pb_default_field_callback')
    ..e<DescriptorSize>(20, _omitFieldNames ? '' : 'descriptorsize', $pb.PbFieldType.OE, defaultOrMaker: DescriptorSize.DS_AUTO, valueOf: DescriptorSize.valueOf, enumValues: DescriptorSize.values)
    ..aOB(21, _omitFieldNames ? '' : 'proto3SingularMsgs')
    ..aOB(22, _omitFieldNames ? '' : 'submsgCallback')
    ..aOB(23, _omitFieldNames ? '' : 'defaultHas')
    ..pPS(24, _omitFieldNames ? '' : 'include')
    ..aOS(25, _omitFieldNames ? '' : 'package')
    ..pPS(26, _omitFieldNames ? '' : 'exclude')
    ..e<$9.FieldDescriptorProto_Type>(27, _omitFieldNames ? '' : 'typeOverride', $pb.PbFieldType.OE, defaultOrMaker: $9.FieldDescriptorProto_Type.TYPE_DOUBLE, valueOf: $9.FieldDescriptorProto_Type.valueOf, enumValues: $9.FieldDescriptorProto_Type.values)
    ..a<$core.bool>(28, _omitFieldNames ? '' : 'sortByTag', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..e<FieldType>(29, _omitFieldNames ? '' : 'fallbackType', $pb.PbFieldType.OE, defaultOrMaker: FieldType.FT_CALLBACK, valueOf: FieldType.valueOf, enumValues: FieldType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NanoPBOptions clone() => NanoPBOptions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NanoPBOptions copyWith(void Function(NanoPBOptions) updates) => super.copyWith((message) => updates(message as NanoPBOptions)) as NanoPBOptions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NanoPBOptions create() => NanoPBOptions._();
  NanoPBOptions createEmptyInstance() => create();
  static $pb.PbList<NanoPBOptions> createRepeated() => $pb.PbList<NanoPBOptions>();
  @$core.pragma('dart2js:noInline')
  static NanoPBOptions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NanoPBOptions>(create);
  static NanoPBOptions? _defaultInstance;

  /// Allocated size for 'bytes' and 'string' fields.
  /// For string fields, this should include the space for null terminator.
  @$pb.TagNumber(1)
  $core.int get maxSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMaxSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxSize() => clearField(1);

  /// Allocated number of entries in arrays ('repeated' fields)
  @$pb.TagNumber(2)
  $core.int get maxCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxCount() => clearField(2);

  /// Force type of field (callback or static allocation)
  @$pb.TagNumber(3)
  FieldType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(FieldType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  /// Use long names for enums, i.e. EnumName_EnumValue.
  @$pb.TagNumber(4)
  $core.bool get longNames => $_getB(3, true);
  @$pb.TagNumber(4)
  set longNames($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLongNames() => $_has(3);
  @$pb.TagNumber(4)
  void clearLongNames() => clearField(4);

  /// Add 'packed' attribute to generated structs.
  /// Note: this cannot be used on CPUs that break on unaligned
  /// accesses to variables.
  @$pb.TagNumber(5)
  $core.bool get packedStruct => $_getBF(4);
  @$pb.TagNumber(5)
  set packedStruct($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPackedStruct() => $_has(4);
  @$pb.TagNumber(5)
  void clearPackedStruct() => clearField(5);

  /// Skip this message
  @$pb.TagNumber(6)
  $core.bool get skipMessage => $_getBF(5);
  @$pb.TagNumber(6)
  set skipMessage($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSkipMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearSkipMessage() => clearField(6);

  /// Size of integer fields. Can save some memory if you don't need
  /// full 32 bits for the value.
  @$pb.TagNumber(7)
  IntSize get intSize => $_getN(6);
  @$pb.TagNumber(7)
  set intSize(IntSize v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasIntSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearIntSize() => clearField(7);

  /// Generate oneof fields as normal optional fields instead of union.
  @$pb.TagNumber(8)
  $core.bool get noUnions => $_getBF(7);
  @$pb.TagNumber(8)
  set noUnions($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNoUnions() => $_has(7);
  @$pb.TagNumber(8)
  void clearNoUnions() => clearField(8);

  /// integer type tag for a message
  @$pb.TagNumber(9)
  $core.int get msgid => $_getIZ(8);
  @$pb.TagNumber(9)
  set msgid($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMsgid() => $_has(8);
  @$pb.TagNumber(9)
  void clearMsgid() => clearField(9);

  /// Add 'packed' attribute to generated enums.
  @$pb.TagNumber(10)
  $core.bool get packedEnum => $_getBF(9);
  @$pb.TagNumber(10)
  set packedEnum($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPackedEnum() => $_has(9);
  @$pb.TagNumber(10)
  void clearPackedEnum() => clearField(10);

  /// decode oneof as anonymous union
  @$pb.TagNumber(11)
  $core.bool get anonymousOneof => $_getBF(10);
  @$pb.TagNumber(11)
  set anonymousOneof($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAnonymousOneof() => $_has(10);
  @$pb.TagNumber(11)
  void clearAnonymousOneof() => clearField(11);

  /// Proto3 singular field does not generate a "has_" flag
  @$pb.TagNumber(12)
  $core.bool get proto3 => $_getBF(11);
  @$pb.TagNumber(12)
  set proto3($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasProto3() => $_has(11);
  @$pb.TagNumber(12)
  void clearProto3() => clearField(12);

  /// Generate an enum->string mapping function (can take up lots of space).
  @$pb.TagNumber(13)
  $core.bool get enumToString => $_getBF(12);
  @$pb.TagNumber(13)
  set enumToString($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasEnumToString() => $_has(12);
  @$pb.TagNumber(13)
  void clearEnumToString() => clearField(13);

  /// Maximum length for 'string' fields. Setting this is equivalent
  /// to setting max_size to a value of length+1.
  @$pb.TagNumber(14)
  $core.int get maxLength => $_getIZ(13);
  @$pb.TagNumber(14)
  set maxLength($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasMaxLength() => $_has(13);
  @$pb.TagNumber(14)
  void clearMaxLength() => clearField(14);

  /// Generate bytes arrays with fixed length
  @$pb.TagNumber(15)
  $core.bool get fixedLength => $_getBF(14);
  @$pb.TagNumber(15)
  set fixedLength($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasFixedLength() => $_has(14);
  @$pb.TagNumber(15)
  void clearFixedLength() => clearField(15);

  /// Generate repeated field with fixed count
  @$pb.TagNumber(16)
  $core.bool get fixedCount => $_getBF(15);
  @$pb.TagNumber(16)
  set fixedCount($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasFixedCount() => $_has(15);
  @$pb.TagNumber(16)
  void clearFixedCount() => clearField(16);

  /// Shorten or remove package names from type names.
  /// This option applies only on the file level.
  @$pb.TagNumber(17)
  TypenameMangling get mangleNames => $_getN(16);
  @$pb.TagNumber(17)
  set mangleNames(TypenameMangling v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasMangleNames() => $_has(16);
  @$pb.TagNumber(17)
  void clearMangleNames() => clearField(17);

  /// Data type for storage associated with callback fields.
  @$pb.TagNumber(18)
  $core.String get callbackDatatype => $_getS(17, 'pb_callback_t');
  @$pb.TagNumber(18)
  set callbackDatatype($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasCallbackDatatype() => $_has(17);
  @$pb.TagNumber(18)
  void clearCallbackDatatype() => clearField(18);

  /// Callback function used for encoding and decoding.
  /// Prior to nanopb-0.4.0, the callback was specified in per-field pb_callback_t
  /// structure. This is still supported, but does not work inside e.g. oneof or pointer
  /// fields. Instead, a new method allows specifying a per-message callback that
  /// will be called for all callback fields in a message type.
  @$pb.TagNumber(19)
  $core.String get callbackFunction => $_getS(18, 'pb_default_field_callback');
  @$pb.TagNumber(19)
  set callbackFunction($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasCallbackFunction() => $_has(18);
  @$pb.TagNumber(19)
  void clearCallbackFunction() => clearField(19);

  /// Select the size of field descriptors. This option has to be defined
  /// for the whole message, not per-field. Usually automatic selection is
  /// ok, but if it results in compilation errors you can increase the field
  /// size here.
  @$pb.TagNumber(20)
  DescriptorSize get descriptorsize => $_getN(19);
  @$pb.TagNumber(20)
  set descriptorsize(DescriptorSize v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasDescriptorsize() => $_has(19);
  @$pb.TagNumber(20)
  void clearDescriptorsize() => clearField(20);

  /// Force proto3 messages to have no "has_" flag.
  /// This was default behavior until nanopb-0.4.0.
  @$pb.TagNumber(21)
  $core.bool get proto3SingularMsgs => $_getBF(20);
  @$pb.TagNumber(21)
  set proto3SingularMsgs($core.bool v) { $_setBool(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasProto3SingularMsgs() => $_has(20);
  @$pb.TagNumber(21)
  void clearProto3SingularMsgs() => clearField(21);

  /// Generate message-level callback that is called before decoding submessages.
  /// This can be used to set callback fields for submsgs inside oneofs.
  @$pb.TagNumber(22)
  $core.bool get submsgCallback => $_getBF(21);
  @$pb.TagNumber(22)
  set submsgCallback($core.bool v) { $_setBool(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasSubmsgCallback() => $_has(21);
  @$pb.TagNumber(22)
  void clearSubmsgCallback() => clearField(22);

  /// Set default value for has_ fields.
  @$pb.TagNumber(23)
  $core.bool get defaultHas => $_getBF(22);
  @$pb.TagNumber(23)
  set defaultHas($core.bool v) { $_setBool(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasDefaultHas() => $_has(22);
  @$pb.TagNumber(23)
  void clearDefaultHas() => clearField(23);

  /// Extra files to include in generated `.pb.h`
  @$pb.TagNumber(24)
  $core.List<$core.String> get include => $_getList(23);

  /// Package name that applies only for nanopb.
  @$pb.TagNumber(25)
  $core.String get package => $_getSZ(24);
  @$pb.TagNumber(25)
  set package($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasPackage() => $_has(24);
  @$pb.TagNumber(25)
  void clearPackage() => clearField(25);

  /// Automatic includes to exclude from generated `.pb.h`
  /// Same as nanopb_generator.py command line flag -x.
  @$pb.TagNumber(26)
  $core.List<$core.String> get exclude => $_getList(25);

  /// Override type of the field in generated C code. Only to be used with related field types
  @$pb.TagNumber(27)
  $9.FieldDescriptorProto_Type get typeOverride => $_getN(26);
  @$pb.TagNumber(27)
  set typeOverride($9.FieldDescriptorProto_Type v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasTypeOverride() => $_has(26);
  @$pb.TagNumber(27)
  void clearTypeOverride() => clearField(27);

  /// Due to historical reasons, nanopb orders fields in structs by their tag number
  /// instead of the order in .proto. Set this to false to keep the .proto order.
  /// The default value will probably change to false in nanopb-0.5.0.
  @$pb.TagNumber(28)
  $core.bool get sortByTag => $_getB(27, true);
  @$pb.TagNumber(28)
  set sortByTag($core.bool v) { $_setBool(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasSortByTag() => $_has(27);
  @$pb.TagNumber(28)
  void clearSortByTag() => clearField(28);

  /// Set the FT_DEFAULT field conversion strategy.
  /// A field that can become a static member of a c struct (e.g. int, bool, etc)
  /// will be a a static field.
  /// Fields with dynamic length are converted to either a pointer or a callback.
  @$pb.TagNumber(29)
  FieldType get fallbackType => $_getN(28);
  @$pb.TagNumber(29)
  set fallbackType(FieldType v) { setField(29, v); }
  @$pb.TagNumber(29)
  $core.bool hasFallbackType() => $_has(28);
  @$pb.TagNumber(29)
  void clearFallbackType() => clearField(29);
}

class Nanopb {
  static final nanopbFileopt = $pb.Extension<NanoPBOptions>(_omitMessageNames ? '' : 'google.protobuf.FileOptions', _omitFieldNames ? '' : 'nanopbFileopt', 1010, $pb.PbFieldType.OM, defaultOrMaker: NanoPBOptions.getDefault, subBuilder: NanoPBOptions.create);
  static final nanopbMsgopt = $pb.Extension<NanoPBOptions>(_omitMessageNames ? '' : 'google.protobuf.MessageOptions', _omitFieldNames ? '' : 'nanopbMsgopt', 1010, $pb.PbFieldType.OM, defaultOrMaker: NanoPBOptions.getDefault, subBuilder: NanoPBOptions.create);
  static final nanopbEnumopt = $pb.Extension<NanoPBOptions>(_omitMessageNames ? '' : 'google.protobuf.EnumOptions', _omitFieldNames ? '' : 'nanopbEnumopt', 1010, $pb.PbFieldType.OM, defaultOrMaker: NanoPBOptions.getDefault, subBuilder: NanoPBOptions.create);
  static final nanopb = $pb.Extension<NanoPBOptions>(_omitMessageNames ? '' : 'google.protobuf.FieldOptions', _omitFieldNames ? '' : 'nanopb', 1010, $pb.PbFieldType.OM, defaultOrMaker: NanoPBOptions.getDefault, subBuilder: NanoPBOptions.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(nanopbFileopt);
    registry.add(nanopbMsgopt);
    registry.add(nanopbEnumopt);
    registry.add(nanopb);
  }
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
