import "package:flutter/material.dart";
import 'package:kuunganatask/src/features/projects/presentation/project_flagged.dart';
import "package:kuunganatask/src/styles.dart";
import "package:tab_indicator_styler/tab_indicator_styler.dart";

class ViewProjectsScreen extends StatefulWidget {
  const ViewProjectsScreen({super.key});

  @override
  State<ViewProjectsScreen> createState() => _ViewProjectsScreenState();
}

class _ViewProjectsScreenState extends State<ViewProjectsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: DefaultTabController(
              length: 3,
              child: Column(children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:24,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppStyles.backward,
                      const Text(
                        'Project',
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
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal:24,),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                      controller: _searchController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 24, right: 12),
                          child: AppStyles.search,
                        ),
                        prefixIconConstraints: const BoxConstraints(
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
                  padding: const EdgeInsets.symmetric(horizontal:24,),
                  child: TabBar(
                    labelStyle: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelColor: AppStyles.paleDark,
                    tabs: const [
                      Tab(
                        text: "Projects",
                      ),
                      Tab(
                        text: "Completed",
                      ),
                      Tab(
                        text: "Flag",
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
                const SizedBox(height: 24),
                Expanded(
                    child: TabBarView(children: [
                  SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final text = items[index];
                         return  ItemWidget(text: text);
                        },
                      )),
                  Center(child: Text('tab two ')),
                  Center(child: Text('tab three ')),
                ]))
              ]))),
    );
  }
}

