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

 List<ToDoModel> get toDoList; bool get isCompleted;
/// Create a copy of ToDoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToDoStateCopyWith<ToDoState> get copyWith => _$ToDoStateCopyWithImpl<ToDoState>(this as ToDoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToDoState&&const DeepCollectionEquality().equals(other.toDoList, toDoList)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(toDoList),isCompleted);

@override
String toString() {
  return 'ToDoState(toDoList: $toDoList, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $ToDoStateCopyWith<$Res>  {
  factory $ToDoStateCopyWith(ToDoState value, $Res Function(ToDoState) _then) = _$ToDoStateCopyWithImpl;
@useResult
$Res call({
 List<ToDoModel> toDoList, bool isCompleted
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
@pragma('vm:prefer-inline') @override $Res call({Object? toDoList = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
toDoList: null == toDoList ? _self.toDoList : toDoList // ignore: cast_nullable_to_non_nullable
as List<ToDoModel>,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _ToDoState implements ToDoState {
   _ToDoState({final  List<ToDoModel> toDoList = const [], this.isCompleted = false}): _toDoList = toDoList;
  

 final  List<ToDoModel> _toDoList;
@override@JsonKey() List<ToDoModel> get toDoList {
  if (_toDoList is EqualUnmodifiableListView) return _toDoList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_toDoList);
}

@override@JsonKey() final  bool isCompleted;

/// Create a copy of ToDoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToDoStateCopyWith<_ToDoState> get copyWith => __$ToDoStateCopyWithImpl<_ToDoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToDoState&&const DeepCollectionEquality().equals(other._toDoList, _toDoList)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_toDoList),isCompleted);

@override
String toString() {
  return 'ToDoState(toDoList: $toDoList, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$ToDoStateCopyWith<$Res> implements $ToDoStateCopyWith<$Res> {
  factory _$ToDoStateCopyWith(_ToDoState value, $Res Function(_ToDoState) _then) = __$ToDoStateCopyWithImpl;
@override @useResult
$Res call({
 List<ToDoModel> toDoList, bool isCompleted
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
@override @pragma('vm:prefer-inline') $Res call({Object? toDoList = null,Object? isCompleted = null,}) {
  return _then(_ToDoState(
toDoList: null == toDoList ? _self._toDoList : toDoList // ignore: cast_nullable_to_non_nullable
as List<ToDoModel>,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
