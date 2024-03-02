import 'package:flutter/material.dart';
import 'package:prototype_assignment/widgets/widgetcreation.dart';

class WidgetSelectionScreen extends StatefulWidget {
  const WidgetSelectionScreen({Key? key}) : super(key: key);

  @override
  WidgetSelectionScreenState createState() => WidgetSelectionScreenState();
}

class WidgetSelectionScreenState extends State<WidgetSelectionScreen> {
  bool _isSelectedTextbox = false;
  bool _isSelectedImagebox = false;
  bool _isSelectedSaveButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 255, 237, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 170),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    child: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (!states.contains(MaterialState.selected)) {
                            return const Color.fromRGBO(234, 234, 234, 1);
                          }
                          return null;
                        }),
                        side: BorderSide.none,
                        checkColor: const Color.fromRGBO(135, 231, 116, 1),
                        hoverColor: const Color.fromRGBO(135, 231, 116, 1),
                        activeColor: const Color.fromRGBO(135, 231, 116, 1),
                        shape: const CircleBorder(),
                        value: _isSelectedTextbox,
                        onChanged: (value) =>
                            setState(() => _isSelectedTextbox = value ?? false),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(234, 234, 234, 1),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 120, 10),
                      child: Text(
                        'Text Widget',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(40)),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    child: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (!states.contains(MaterialState.selected)) {
                            return const Color.fromRGBO(234, 234, 234, 1);
                          }
                          return null;
                        }),
                        side: BorderSide.none,
                        checkColor: const Color.fromRGBO(135, 231, 116, 1),
                        hoverColor: const Color.fromRGBO(135, 231, 116, 1),
                        activeColor: const Color.fromRGBO(135, 231, 116, 1),
                        shape: const CircleBorder(),
                        value: _isSelectedImagebox,
                        onChanged: (value) => setState(
                            () => _isSelectedImagebox = value ?? false),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(234, 234, 234, 1),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 108, 10),
                      child: Text(
                        'Image Widget',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(40)),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    child: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (!states.contains(MaterialState.selected)) {
                            return const Color.fromRGBO(234, 234, 234, 1);
                          }
                          return null;
                        }),
                        side: BorderSide.none,
                        checkColor: const Color.fromRGBO(135, 231, 116, 1),
                        hoverColor: const Color.fromRGBO(135, 231, 116, 1),
                        activeColor: const Color.fromRGBO(135, 231, 116, 1),
                        shape: const CircleBorder(),
                        value: _isSelectedSaveButton,
                        onChanged: (value) => setState(
                            () => _isSelectedSaveButton = value ?? false),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(234, 234, 234, 1),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 105, 10),
                      child: Text(
                        'Button Widget',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(217, 251, 210, 1),
                  foregroundColor: Colors.black,
                  side: const BorderSide(width: 2)),
              onPressed: () {
                List<Widget> selectedWidgets = [];
                if (_isSelectedTextbox) selectedWidgets.add(const TextWidget());
                if (_isSelectedImagebox) {
                  selectedWidgets.add(const ImageWidget());
                }
                if (_isSelectedSaveButton) {
                  selectedWidgets.add(const ButtonWidget());
                }
                Navigator.pop(context, selectedWidgets);
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Import Widgets',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 115),
            ),
          ],
        ),
      ),
    );
  }
}
