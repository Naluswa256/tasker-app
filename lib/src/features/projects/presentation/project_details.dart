

import 'package:flutter/material.dart';
// import 'package:kuunganatask/src/features/widgets/task_widget.dart';
import 'package:kuunganatask/src/styles.dart';

class TaskGroup {
  String groupName;
  List<String> tasks;

  TaskGroup({required this.groupName, required this.tasks});
}



class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
   List<TaskGroup> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:24),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              const SizedBox(height:16),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   AppStyles.backward,
                   const Text(
                     'Project Detail',
                     style: TextStyle(
                         color: AppStyles.neutralDark,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w700,
                         fontSize: 18),
                   ),
                   ElevatedButton(
                       style: ElevatedButton.styleFrom(
                           backgroundColor: AppStyles.primary,
                           padding: const EdgeInsets.all(17),
                           shape: const RoundedRectangleBorder(
                               borderRadius:
                                   BorderRadius.all(Radius.circular(16))),
                           minimumSize: const Size(44, 44)),
                       onPressed: () {},
                       child: Center(child: AppStyles.plus)),
                 ],
               ),
               const SizedBox(height:30),
               Row(
                children: [
                  Container(
                                      width: 52,
                                      height: 52,
                                      padding: EdgeInsets.zero,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppStyles.neutralLight,
                                      ),
                                      child: Center(child: AppStyles.tIcon)),
                   const SizedBox(width:16),
                    const Text(
                     'Mane Ui kit',
                     style: TextStyle(
                         color: AppStyles.neutralDark,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w700,
                         fontSize: 24),
                   ),
                  const  Expanded(child:SizedBox()),
                   IconButton(
                    onPressed: () {
                      // Handle button press
                    },
                    icon: AppStyles.projectNotification,
),
 const SizedBox(width:21),
 IconButton(
                    onPressed: () {
                      // Handle button press
                    },
                    icon: AppStyles.menu,
            ),

                ],
               ),
              const SizedBox(width:40),  
              SizedBox(
                height:500, 
                child: ListView.builder(
                  
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    TaskGroup group = groups[index];
                    return ExpansionTileTheme(
                                        data: const ExpansionTileThemeData(
                    tilePadding: EdgeInsets.zero,
                    collapsedTextColor: AppStyles.neutralDark,
                    collapsedIconColor: AppStyles.neutralDark,
              
                  ),
                      child: ExpansionTile(
                        title: Text(group.groupName, style: const TextStyle(
                         color: AppStyles.neutralDark,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w700,
                         fontSize: 16),),
                        children: group.tasks
                            .map((task) => ListTile(
                                  title: Text(task),
                                ))
                            .toList(),
                      ),
                    );
                  },
                ),
              ),
               const SizedBox(width:24),
              TextButton.icon(
  onPressed: () =>_addNewGroup(),
  icon: const Icon(Icons.add, size:24, color:AppStyles.paleDark),
  label: const Text('Add group',style: TextStyle(
                         color: AppStyles.paleDark,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w500,
                         fontSize: 16),),
),


            ],
          ),
        ),
      ),

    );
  }

  void _addNewGroup() {
    setState(() {
    TaskGroup newGroup;
    if (groups.length == 1) {
      newGroup = TaskGroup(
        groupName: 'Group ${groups.length + 1}',
        tasks: ['Task A', 'Task B', 'Task C'], // Populate tasks for index 1
      );
    } else {
      newGroup = TaskGroup(
        groupName: 'Group ${groups.length + 1}',
        tasks: [],
      );
    }
    groups.add(newGroup);
  });
  }
}