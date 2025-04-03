import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:to_do/src/constant/app_color.dart';
import 'package:to_do/src/core/util/loader.dart';
import 'package:to_do/src/feature/controller/to_do_controller.dart';
import 'package:to_do/src/feature/data/model/to_do_model.dart';
import 'package:to_do/src/feature/view/widgets/add_bottom_sheet.dart';
import 'package:to_do/src/feature/view/widgets/confirm_sheet.dart';
import 'package:to_do/src/feature/view/widgets/sliver_app_bar.dart';

class ToDoScreen extends ConsumerWidget {
  const ToDoScreen({super.key});

  void _saveTodo(context, WidgetRef ref, {required String toDo}) async {
    final isAdded = await ref.read(toDoProvider.notifier).addToDo(toDo: toDo);
    if (!isAdded) return;
    // ignore: unused_result
    ref.refresh(toDoProvider);
    Navigator.pop(context);
  }

  Future<void> _onUpdate(WidgetRef ref, {required int? id}) async {
    if (id == null) return;
    await ref.read(toDoProvider.notifier).updateToDo(id: id);
  }

  Future<void> _onDismissed(WidgetRef ref, {required ToDoModel toDo}) async {
    await ref.read(toDoProvider.notifier).deleteToDo(toDo: toDo);
  }

  Future<void> _onRefresh(WidgetRef ref) async => ref.refresh(toDoProvider);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(toDoProvider);
    return RefreshIndicator.adaptive(
      backgroundColor: AppColor.primaryColor,
      color: Colors.white,
      onRefresh: () => _onRefresh(ref),
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add, color: Colors.white),
          onPressed:
              () => showAddSheet(
                context,
                onSave: (value) => _saveTodo(context, ref, toDo: value),
              ),
        ),
        body: CustomScrollView(
          slivers: [
            BuildAppBar(),
            asyncValue.when(
              data: (state) {
                return SliverPadding(
                  padding: EdgeInsets.all(10),
                  sliver: SliverList.separated(
                    itemCount: state.toDoList.length,
                    itemBuilder: (context, index) {
                      final toDo = state.toDoList[index];
                      return Dismissible(
                        key: ObjectKey(toDo.id),
                        background: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(7),
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                        confirmDismiss: (direction) async {
                          final isDelete = await ConfirmSheet.show(context);
                          return isDelete;
                        },
                        onDismissed:
                            (value) async =>
                                await _onDismissed(ref, toDo: toDo),

                        ///To do tile
                        child: _BuildTile(
                          task: toDo.task ?? '',
                          isChecked: toDo.isCompleted ?? false,
                          tickOnTap: () {
                            _onUpdate(ref, id: toDo.id);
                          },
                        ),
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 10),
                  ),
                );
              },
              loading: () {
                return _Shimmer();
              },
              error: (error, stackTrace) {
                return SliverFillRemaining(child: Center(child: Text('Oops!')));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Shimmer extends StatelessWidget {
  const _Shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Shimmer.fromColors(
        baseColor: AppColor.secondaryColor,
        highlightColor: AppColor.secondaryColor.withAlpha(2),
        child: Column(
          children: List.generate(5, (index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.all(16),
                  height: 40,

                  padding: EdgeInsets.all(7),
                ),
                if (index < 4) SizedBox(height: 10),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _BuildTile extends StatelessWidget {
  const _BuildTile({
    required this.tickOnTap,
    required this.task,
    required this.isChecked,
  });

  final String task;
  final bool isChecked;
  final VoidCallback tickOnTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.secondaryColor,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          spacing: 10,
          children: [
            GestureDetector(
              onTap: tickOnTap,
              child: Container(
                height: 20,
                width: 20,
                decoration:
                    !isChecked
                        ? BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey, width: 2),
                          shape: BoxShape.circle,
                        )
                        : null,
                child:
                    isChecked
                        ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        )
                        : null,
              ),
            ),
            Flexible(child: Text(task, style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
