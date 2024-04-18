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

class FieldType extends $pb.ProtobufEnum {
  static const FieldType FT_DEFAULT = FieldType._(0, _omitEnumNames ? '' : 'FT_DEFAULT');
  static const FieldType FT_CALLBACK = FieldType._(1, _omitEnumNames ? '' : 'FT_CALLBACK');
  static const FieldType FT_POINTER = FieldType._(4, _omitEnumNames ? '' : 'FT_POINTER');
  static const FieldType FT_STATIC = FieldType._(2, _omitEnumNames ? '' : 'FT_STATIC');
  static const FieldType FT_IGNORE = FieldType._(3, _omitEnumNames ? '' : 'FT_IGNORE');
  static const FieldType FT_INLINE = FieldType._(5, _omitEnumNames ? '' : 'FT_INLINE');

  static const $core.List<FieldType> values = <FieldType> [
    FT_DEFAULT,
    FT_CALLBACK,
    FT_POINTER,
    FT_STATIC,
    FT_IGNORE,
    FT_INLINE,
  ];

  static final $core.Map<$core.int, FieldType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FieldType? valueOf($core.int value) => _byValue[value];

  const FieldType._($core.int v, $core.String n) : super(v, n);
}

class IntSize extends $pb.ProtobufEnum {
  static const IntSize IS_DEFAULT = IntSize._(0, _omitEnumNames ? '' : 'IS_DEFAULT');
  static const IntSize IS_8 = IntSize._(8, _omitEnumNames ? '' : 'IS_8');
  static const IntSize IS_16 = IntSize._(16, _omitEnumNames ? '' : 'IS_16');
  static const IntSize IS_32 = IntSize._(32, _omitEnumNames ? '' : 'IS_32');
  static const IntSize IS_64 = IntSize._(64, _omitEnumNames ? '' : 'IS_64');

  static const $core.List<IntSize> values = <IntSize> [
    IS_DEFAULT,
    IS_8,
    IS_16,
    IS_32,
    IS_64,
  ];

  static final $core.Map<$core.int, IntSize> _byValue = $pb.ProtobufEnum.initByValue(values);
  static IntSize? valueOf($core.int value) => _byValue[value];

  const IntSize._($core.int v, $core.String n) : super(v, n);
}

class TypenameMangling extends $pb.ProtobufEnum {
  static const TypenameMangling M_NONE = TypenameMangling._(0, _omitEnumNames ? '' : 'M_NONE');
  static const TypenameMangling M_STRIP_PACKAGE = TypenameMangling._(1, _omitEnumNames ? '' : 'M_STRIP_PACKAGE');
  static const TypenameMangling M_FLATTEN = TypenameMangling._(2, _omitEnumNames ? '' : 'M_FLATTEN');
  static const TypenameMangling M_PACKAGE_INITIALS = TypenameMangling._(3, _omitEnumNames ? '' : 'M_PACKAGE_INITIALS');

  static const $core.List<TypenameMangling> values = <TypenameMangling> [
    M_NONE,
    M_STRIP_PACKAGE,
    M_FLATTEN,
    M_PACKAGE_INITIALS,
  ];

  static final $core.Map<$core.int, TypenameMangling> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TypenameMangling? valueOf($core.int value) => _byValue[value];

  const TypenameMangling._($core.int v, $core.String n) : super(v, n);
}

class DescriptorSize extends $pb.ProtobufEnum {
  static const DescriptorSize DS_AUTO = DescriptorSize._(0, _omitEnumNames ? '' : 'DS_AUTO');
  static const DescriptorSize DS_1 = DescriptorSize._(1, _omitEnumNames ? '' : 'DS_1');
  static const DescriptorSize DS_2 = DescriptorSize._(2, _omitEnumNames ? '' : 'DS_2');
  static const DescriptorSize DS_4 = DescriptorSize._(4, _omitEnumNames ? '' : 'DS_4');
  static const DescriptorSize DS_8 = DescriptorSize._(8, _omitEnumNames ? '' : 'DS_8');

  static const $core.List<DescriptorSize> values = <DescriptorSize> [
    DS_AUTO,
    DS_1,
    DS_2,
    DS_4,
    DS_8,
  ];

  static final $core.Map<$core.int, DescriptorSize> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DescriptorSize? valueOf($core.int value) => _byValue[value];

  const DescriptorSize._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
