import "package:flutter/material.dart";
import "package:kuunganatask/src/styles.dart";
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import "../../../common_wdigets/button.dart";
class ProjectCreate extends StatefulWidget {
  const ProjectCreate({super.key});

  @override
  State<ProjectCreate> createState() => _ProjectCreateState();
}

class _ProjectCreateState extends State<ProjectCreate> {
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _projectDescriptionController =
      TextEditingController();

  final List<String> imageUrls = [
    'https://i.pravatar.cc/150?img=1',
    'https://i.pravatar.cc/150?img=2',
    'https://i.pravatar.cc/150?img=3',
    'https://i.pravatar.cc/150?img=4',
    'https://i.pravatar.cc/150?img=5',
    'https://i.pravatar.cc/150?img=6',
  ];
  // Color currentColor = Colors.blue;
  // List<Color> colorList = [];
  Set<Color> uniqueColors = {Colors.blue};
  Color _selectedColor = Colors.blue;

  // void changeColor(Color color) {
  //   setState(() {
  //     _selectedColor = color;

  //   });
  // }

  void _openColorPicker() {
    showDialog<Color>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Pick a color',
            style: TextStyle(
                color: AppStyles.neutralDark,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          content: SingleChildScrollView(
            child: MaterialColorPicker(
              selectedColor: _selectedColor,
              allowShades: false,
              onMainColorChange: (ColorSwatch? color) {
                setState(() {
                  _selectedColor = Color(color!.value);
                  uniqueColors.add(_selectedColor);
                });
              },
              colors: AppStyles.materialColors,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                    color: AppStyles.neutralDark,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _projectNameController.dispose();
    _projectDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 44),
        height: MediaQuery.of(context).size.height * 0.96,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 99),
                Text(
                  'Create Project',
                  style: TextStyle(
                      color: AppStyles.neutralDark,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                SizedBox(width: 74),
                Icon(Icons.close, color: AppStyles.neutralDark, size: 24),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Name',
              style: TextStyle(
                  color: AppStyles.neutralDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
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
              child: TextFormField(
                controller: _projectNameController,
                cursorColor: AppStyles.primary,
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal:15.w),
                  hintText: 'Enter a project Name',
                  hintStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: AppStyles.paleDark,
                  ),
                  filled: true,
                  fillColor: AppStyles.whiteColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppStyles.primary),
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Add Member',
              style: TextStyle(
                  color: AppStyles.neutralDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                height: 70,
                width: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SizedBox(
                        height: 44,
                        width: 44,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(imageUrls[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              DottedBorder(
                dashPattern: const [4, 4],
                strokeWidth: 1,
                strokeCap: StrokeCap.round,
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                child: const SizedBox(
                    height: 44,
                    width: 44,
                    child: Center(
                        child: Icon(Icons.add,
                            color: AppStyles.primary, size: 24))),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Calendar',
              style: TextStyle(
                  color: AppStyles.neutralDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
                // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppStyles.neutralDark,
                        ),
                        child: Center(child: AppStyles.calendarWhite)),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Jan 1 2021',
                    style: TextStyle(
                        color: AppStyles.neutralDark,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  const SizedBox(width: 28),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppStyles.primary,
                        ),
                        child: Center(child: AppStyles.calendarWhite)),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Jan 1 2021',
                    style: TextStyle(
                        color: AppStyles.neutralDark,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ]),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Description',
              style: TextStyle(
                  color: AppStyles.neutralDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
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
              child: TextFormField(
                controller: _projectDescriptionController,
                cursorColor: AppStyles.primary,
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal:15.w),
                  hintText: 'Project description',
                  hintStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: AppStyles.paleDark,
                  ),
                  filled: true,
                  fillColor: AppStyles.whiteColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppStyles.primary),
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Add Label',
              style: TextStyle(
                  color: AppStyles.neutralDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: uniqueColors
                      .map((color) => Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(right:16,),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ))
                      .toList(),
                ),
                // const SizedBox(
                //   width: 16,
                // ),
                InkWell(
                  onTap: () => _openColorPicker(),
                  child: DottedBorder(
                    dashPattern: const [4, 4],
                    strokeWidth: 1,
                    strokeCap: StrokeCap.round,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    child: const SizedBox(
                        height: 44,
                        width: 44,
                        child: Center(
                            child: Icon(Icons.add,
                                color: AppStyles.primary, size: 24))),
                  ),
                )
              ],
            ),
          ),
           const SizedBox(
            height: 32,
          ),
          Button(
              onPressed: (){},
              child:Row(
                mainAxisAlignment:MainAxisAlignment.center, 
                children: [
                  const Text(
                    'Create',
                    style: TextStyle(
                        color: AppStyles.whiteColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  const SizedBox(width:8),
                  AppStyles.forward
                ],
              ),
            ),
        ]));
  }
}
