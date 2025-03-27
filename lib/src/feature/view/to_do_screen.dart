import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/src/feature/controller/to_do_controller.dart';
import 'package:to_do/src/feature/data/repository/to_do_repository.dart';

class ToDoScreen extends ConsumerWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0XFF212121),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          await ref.read(toDoRepositoryProvider).getTodo();
        },
      ),
      body: CustomScrollView(
        slivers: [
          BuildAppBar(),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList.separated(
              itemBuilder:
                  (context, index) => Dismissible(
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(7),
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                    key: Key('key'),
                    onDismissed: (value) {},
                    child: _BuildTile(onTap: () {}),
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
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
  const _BuildTile({super.key, required this.onTap});
  final bool isCompleted = true;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0XFF2D2C2D),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          spacing: 5,
          children: [
            GestureDetector(
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
              onTap: () {},
            ),

            Text('Task', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
