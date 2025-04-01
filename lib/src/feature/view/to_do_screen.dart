import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/src/constant/app_color.dart';
import 'package:to_do/src/feature/controller/to_do_controller.dart';
import 'package:to_do/src/feature/view/widgets/app_text_field.dart';
import 'package:to_do/src/feature/view/widgets/confirm_sheet.dart';

class ToDoScreen extends ConsumerWidget {
  const ToDoScreen({super.key});

  void _saveTodo(context, WidgetRef ref, {required String toDo}) async {
    final isAdded = await ref.read(toDoProvider.notifier).addToDo(toDo: toDo);
    if (!isAdded) return;
    // ignore: unused_result
    ref.refresh(toDoProvider);
    Navigator.pop(context);
  }

  void _onUpdate(
    WidgetRef ref, {
    required int? id,
    required bool isCompleted,
  }) async {
    if (id == null) return;
    final isUpdated = await ref
        .read(toDoProvider.notifier)
        .upDateToDo(id: id, isCompleted: isCompleted);
    // ignore: unused_result
    if (isUpdated) ref.refresh(toDoProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(toDoProvider);
    return Scaffold(
      backgroundColor: Color(0XFF212121),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
        onPressed:
            () => _showBottomSheet(
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
                      onDismissed: (value) async {
                        await ref
                            .read(toDoProvider.notifier)
                            .deleteToDo(toDo: toDo);
                      },
                      child: _BuildTile(
                        task: toDo.task ?? '',
                        isCompleted: toDo.isCompleted ?? false,
                        tickOnTap:
                            () =>
                                _onUpdate(ref, id: toDo.id, isCompleted: true),
                      ),
                    );
                  },
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 10),
                ),
              );
            },
            loading: () {
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    padding: EdgeInsets.only(top: 20),
                  ),
                ),
              );
            },
            error: (error, stackTrace) {
              return SliverToBoxAdapter(child: Text('Oops!'));
            },
          ),
        ],
      ),
    );
  }
}

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: false,
      pinned: false,
      title: const Text('To-Dos', style: TextStyle(color: Colors.white)),
      backgroundColor: Color(0XFF212121),
      centerTitle: false,
      floating: true,
      // s
    );
  }
}

class _BuildTile extends StatelessWidget {
  const _BuildTile({
    required this.tickOnTap,
    required this.task,
    this.isCompleted = false,
  });
  final bool isCompleted;
  final String task;
  final VoidCallback tickOnTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.secondaryColor,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          spacing: 5,
          children: [
            GestureDetector(
              onTap: tickOnTap,
              child: Container(
                height: 20,
                width: 20,
                decoration:
                    !isCompleted
                        ? BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey, width: 2),
                          shape: BoxShape.circle,
                        )
                        : null,
                child:
                    isCompleted
                        ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        )
                        : null,
              ),
            ),
            Text(task, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

_showBottomSheet(
  BuildContext context, {
  required void Function(String) onSave,
}) {
  String toDo = '';
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder:
        (context) => BottomSheet(
          enableDrag: false,
          backgroundColor: AppColor.secondaryColor,
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
              ),
              child: StatefulBuilder(
                builder:
                    (context, setState) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                            Text(
                              'New-To-Do',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () => onSave(toDo),

                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color:
                                      toDo.trim().isEmpty
                                          ? Colors.grey
                                          : Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        AppTextField(
                          onChanged: (value) => setState(() => toDo = value),
                        ),
                      ],
                    ),
              ),
            );
          },
        ),
  );
}
