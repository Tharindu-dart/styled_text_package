import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StyledText Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  void _alert(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tapped'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openLink(BuildContext context, Map<String, String> attrs) {
    final String link = attrs['href'];

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Open Link'),
          content: Text(link),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StyledText Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Simple formatted text
            StyledText(
              text: 'Test: <b>bold</b> text.',
              styles: {
                'b': TextStyle(fontWeight: FontWeight.bold),
              },
            ),

            // Text with quotes
            const SizedBox(height: 20),
            StyledText(
              text: 'Quoted Test: <b>&quot;bold&quot;</b> text.',
              styles: {
                'b': TextStyle(fontWeight: FontWeight.bold),
              },
            ),

            // Multiline text without breaks
            const SizedBox(height: 20),
            StyledText(
              text: """Multiline text 
(wo breaks)""",
              styles: {
                'b': TextStyle(fontWeight: FontWeight.bold),
              },
            ),

            // Multiline text with breaks
            const SizedBox(height: 20),
            StyledText(
              text: """Multiline text
(with breaks)""",
              newLineAsBreaks: true,
              styles: {
                'b': TextStyle(fontWeight: FontWeight.bold),
              },
            ),

            // Custom tags styles
            const SizedBox(height: 20),
            StyledText(
              text: 'Test: <bold>bold</bold> and <red>red color</red> text.',
              styles: {
                'bold': TextStyle(fontWeight: FontWeight.bold),
                'red':
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              },
            ),

            // Text with icon
            const SizedBox(height: 20),
            StyledText(
              text: 'Text with alarm <alarm/> icon.',
              styles: {
                'alarm': IconStyle(Icons.alarm),
              },
            ),

            // Text with action
            const SizedBox(height: 20),
            StyledText(
              text: 'Text with <action>action</action> inside.',
              styles: {
                'action': ActionTextStyle(
                  decoration: TextDecoration.underline,
                  onTap: (_, __) => _alert(context),
                ),
              },
            ),

            // Text with link
            const SizedBox(height: 20),
            StyledText(
              text:
                  'Text with <link href="https://flutter.dev">link</link> inside.',
              styles: {
                'link': ActionTextStyle(
                  decoration: TextDecoration.underline,
                  onTap: (_, attrs) => _openLink(context, attrs),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
