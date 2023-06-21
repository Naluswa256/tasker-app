import "package:flutter/material.dart";
import "package:kuunganatask/src/styles.dart";
import "package:kuunganatask/src/features/widgets/project_widget.dart";
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';

import "../../projects/presentation/project_create.dart";

class ItemModel {
  String title;
  Widget icon;
  int id;
  ItemModel(this.title, this.icon, {required this.id});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<ItemModel> menuItems = [
    ItemModel('Create task', AppStyles.taskDark, id: 1),
    ItemModel('Create project', AppStyles.gridDark, id: 2),
    ItemModel(
      'Create team',
      AppStyles.users,
      id: 3,
    ),
    ItemModel('Create meeting', AppStyles.meeting, id: 4),
  ];
  final CustomPopupMenuController _controller = CustomPopupMenuController();
  final List<Map<String, String>> items = List<Map<String, String>>.generate(
      2, (index) => {'title': 'Task Title $index', 'subtitle': 'Date $index'});
  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Text(
                      'Dashboard',
                      style: TextStyle(
                          color: AppStyles.neutralDark,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    AppStyles.tIcon,
                  ]),
                  CustomPopupMenu(
                    showArrow: false,
                    barrierColor: AppStyles.neutralDark.withOpacity(0.5),
                    menuBuilder: () => Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 216,
                          width: 199,
                          padding: const EdgeInsets.only(top: 24),
                          decoration: BoxDecoration(
                            color: AppStyles.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: IntrinsicWidth(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: menuItems
                                  .map(
                                    (item) => GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        _showBottomSheet(context, item);
                                        _controller.hideMenu();
                                      },
                                      child: Container(
                                        height: 40,
                                        padding:
                                            const EdgeInsets.only(left: 24),
                                        child: Row(
                                          children: <Widget>[
                                            item.icon,
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Text(
                                                  item.title,
                                                  style: const TextStyle(
                                                    color:
                                                        AppStyles.neutralDark,
                                                    fontSize: 16,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    pressType: PressType.singleClick,
                    verticalMargin: -45,
                    controller: _controller,
                    child: Container(
                        padding: const EdgeInsets.all(17),
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppStyles.primary,
                        ),
                        child: Center(child: AppStyles.plus)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              margin: const EdgeInsets.only(right: 24, left: 24),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: TextField(
                  controller: _searchController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: AppStyles.filterIcon,
                        )),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 12),
                      child: AppStyles.search,
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    hintText: 'search',
                    hintStyle: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: AppStyles.paleDark,
                    ),
                    filled: true,
                    fillColor: AppStyles.whiteColor,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16)),
                  )),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(right: 123, left: 24),
              child: TabBar(
                labelStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelColor: AppStyles.paleDark,
                tabs: const [
                  Tab(
                    text: "Overview",
                  ),
                  Tab(
                    text: "Analytics",
                  ),
                ],
                labelColor: Colors.white,
                // add it here
                indicator: RectangularIndicator(
                  paintingStyle: PaintingStyle.fill,
                  color: AppStyles.primary,
                  topRightRadius: 12,
                  topLeftRadius: 12,
                  bottomLeftRadius: 12,
                  bottomRightRadius: 12,
                ),
              ),
            ),
            Expanded(
                child: TabBarView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        AppStyles.grid,
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Your Projects',
                          style: TextStyle(
                              color: AppStyles.neutralDark,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ]),
                      AppStyles.arrowRight
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: Stack(children: [
                    Container(
                        height: 84,
                        margin: const EdgeInsets.symmetric(horizontal: 48),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppStyles.neutralLight.withOpacity(0.5))),
                    Positioned(
                        top: 8,
                        left: 0,
                        right: 0,
                        child: Container(
                            height: 92,
                            margin: const EdgeInsets.symmetric(horizontal: 36),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppStyles.paleDark.withOpacity(0.2)))),
                    const Positioned(
                        top: 16, left: 0, right: 0, child: ProjectTemplate()),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 24,
                    left: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        AppStyles.task,
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Your recent tasks',
                          style: TextStyle(
                              color: AppStyles.neutralDark,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ]),
                      AppStyles.arrowRight
                    ],
                  ),
                ),
                //const SizedBox(height: 24),
                SizedBox(
                  height: 150, // set a fixed height for the ListView.builder
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      // return ListTile(
                      //   title: Text('${items[index]['title']}'),
                      //   subtitle: Text('${items[index]['subtitle']}'),
                      // );
                      if (index == items.length - 1) {
                        // render last item with custom UI settings
                        return Container(
                            height: 100,
                            padding: const EdgeInsets.only(left: 24),
                            margin: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppStyles.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  const SizedBox(width: 16),
                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${items[index]['title']}',
                                          style: const TextStyle(
                                              color: AppStyles.neutralDark,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              AppStyles.calendar,
                                              const SizedBox(width: 8),
                                              Text(
                                                'Deadline : ${items[index]['subtitle']}',
                                                style: const TextStyle(
                                                    color: AppStyles.paleDark,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ])
                                      ])
                                ]));
                      } else {
                        // render other items with default UI settings
                        return Container(
                            height: 100,
                            padding: const EdgeInsets.only(left: 24),
                            margin: const EdgeInsets.only(
                                left: 24, right: 24, top: 24, bottom: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppStyles.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  const SizedBox(width: 16),
                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${items[index]['title']}',
                                          style: const TextStyle(
                                              color: AppStyles.neutralDark,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              AppStyles.calendar,
                                              const SizedBox(width: 8),
                                              Text(
                                                'Deadline : ${items[index]['subtitle']}',
                                                style: const TextStyle(
                                                    color: AppStyles.paleDark,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ])
                                      ])
                                ]));
                      }
                    },
                  ),
                ),
              ]),
              Column(
                children: [
                  const SizedBox(height: 40),
                ],
              )
            ]))
          ])),
    ));
  }

  void _showBottomSheet(BuildContext context, ItemModel item) {
    Widget content = Container();
    if (item.id == 1) {
      content = Container();
    } else if (item.id == 2) {
      content = const ProjectCreate();
    } else if (item.id == 3) {
      content = Container();
    } else if (item.id == 4) {
      content = Container();
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: AppStyles.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      builder: (BuildContext context) {
        return content;
      },
    );
  }
}
