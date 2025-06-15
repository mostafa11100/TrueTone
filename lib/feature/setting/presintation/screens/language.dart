import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String? selectedLanguage = 'English(US)';

  final List<String> languages = [
    'English(UK)',
    'English(US)',
    'Russian',
    'Spanish',
    'Hindi',
    'French',
    'German',
    'Portuguese',
    'Polish',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 7.w),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                SizedBox(width: 85.w),
                Text(
                  'Language',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if (index == 2) Divider(thickness: 0.4),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLanguage = languages[index];
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    languages[index],
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 1.17,
                                child: Radio<String>(
                                  value: languages[index],
                                  groupValue: selectedLanguage,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedLanguage = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}