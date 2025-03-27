// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'to_do_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ToDoState {

 List<ToDoModel> get toDoList;
/// Create a copy of ToDoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToDoStateCopyWith<ToDoState> get copyWith => _$ToDoStateCopyWithImpl<ToDoState>(this as ToDoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToDoState&&const DeepCollectionEquality().equals(other.toDoList, toDoList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(toDoList));

@override
String toString() {
  return 'ToDoState(toDoList: $toDoList)';
}


}

/// @nodoc
abstract mixin class $ToDoStateCopyWith<$Res>  {
  factory $ToDoStateCopyWith(ToDoState value, $Res Function(ToDoState) _then) = _$ToDoStateCopyWithImpl;
@useResult
$Res call({
 List<ToDoModel> toDoList
});




}
/// @nodoc
class _$ToDoStateCopyWithImpl<$Res>
    implements $ToDoStateCopyWith<$Res> {
  _$ToDoStateCopyWithImpl(this._self, this._then);

  final ToDoState _self;
  final $Res Function(ToDoState) _then;

/// Create a copy of ToDoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? toDoList = null,}) {
  return _then(_self.copyWith(
toDoList: null == toDoList ? _self.toDoList : toDoList // ignore: cast_nullable_to_non_nullable
as List<ToDoModel>,
  ));
}

}


/// @nodoc


class _ToDoState implements ToDoState {
   _ToDoState({final  List<ToDoModel> toDoList = const []}): _toDoList = toDoList;
  

 final  List<ToDoModel> _toDoList;
@override@JsonKey() List<ToDoModel> get toDoList {
  if (_toDoList is EqualUnmodifiableListView) return _toDoList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_toDoList);
}


/// Create a copy of ToDoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToDoStateCopyWith<_ToDoState> get copyWith => __$ToDoStateCopyWithImpl<_ToDoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToDoState&&const DeepCollectionEquality().equals(other._toDoList, _toDoList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_toDoList));

@override
String toString() {
  return 'ToDoState(toDoList: $toDoList)';
}


}

/// @nodoc
abstract mixin class _$ToDoStateCopyWith<$Res> implements $ToDoStateCopyWith<$Res> {
  factory _$ToDoStateCopyWith(_ToDoState value, $Res Function(_ToDoState) _then) = __$ToDoStateCopyWithImpl;
@override @useResult
$Res call({
 List<ToDoModel> toDoList
});




}
/// @nodoc
class __$ToDoStateCopyWithImpl<$Res>
    implements _$ToDoStateCopyWith<$Res> {
  __$ToDoStateCopyWithImpl(this._self, this._then);

  final _ToDoState _self;
  final $Res Function(_ToDoState) _then;

/// Create a copy of ToDoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? toDoList = null,}) {
  return _then(_ToDoState(
toDoList: null == toDoList ? _self._toDoList : toDoList // ignore: cast_nullable_to_non_nullable
as List<ToDoModel>,
  ));
}


}

// dart format on
