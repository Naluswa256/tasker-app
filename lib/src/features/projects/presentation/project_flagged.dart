import "package:flutter/material.dart";
import "package:flutter/material.dart";
import "package:kuunganatask/src/features/widgets/project_widget.dart";
import "package:kuunganatask/src/styles.dart";


class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool _isFlagged = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            _isFlagged = true;
          });
        },
        child: Stack(
          children: [
           const  ProjectTemplate(),
            if (_isFlagged)
              Positioned(
                top: 0,
                left: 20,
                child: Container(
                  width:435,
                  height: 148,
                  padding: const EdgeInsets.only(left:8, top:8),
                  decoration: BoxDecoration(
                    color: AppStyles.neutralDark.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                       Align(
                        alignment: Alignment.centerRight,
                      child:IconButton(
                        icon:AppStyles.close,
                        onPressed: () {
                          setState(() {
                            _isFlagged = false;
                          });
                        },
                      ),
                     ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          
                            Icon(Icons.flag, color:Colors.white),
                           
                          SizedBox(width: 8,),
                          Text(
                        'Flag',
                        style: TextStyle(
                            color: AppStyles.whiteColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
