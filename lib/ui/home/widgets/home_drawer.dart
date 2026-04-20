import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:News/core/resources/strings_Manager.dart';
import 'package:News/ui/home/widgets/theme_or_language_item.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../providers/theme_provider.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    List<String> themeItems = [StringsManager.light, StringsManager.dark];
    List<String> languagesItems = [StringsManager.english, StringsManager.arabic];

    String selectedTheme = themeProvider.mode == ThemeMode.dark
        ? StringsManager.dark
        : StringsManager.light;
    String selectedLanguage = context.locale.languageCode == "en"
        ? StringsManager.english
        : StringsManager.arabic;

    return Drawer(
      child: Column(
        spacing: 16.h,
        children: [
          Container(
            height: 166.h,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            alignment: Alignment.center,
            child: Text(
              StringsManager.appTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              spacing: 24.h,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.home,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        StringsManager.goToHome,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Divider(),
                ThemeOrLanguageItem(
                  onChanged: (value) {
                    if (value == StringsManager.dark) {
                      themeProvider.changhMode(ThemeMode.dark);
                    } else {
                      themeProvider.changhMode(ThemeMode.light);
                    }
                  },
                  selectedValue: selectedTheme,
                  items: themeItems,
                  title: StringsManager.theme,
                  iconPath: AssetsManager.themeIcon,
                ),
                Divider(),
                ThemeOrLanguageItem(
                  onChanged: (value) {
                    if (value == StringsManager.english) {
                      context.setLocale(Locale("en"));
                    } else {
                      context.setLocale(Locale("ar"));
                    }
                  },
                  selectedValue: selectedLanguage,
                  items: languagesItems,
                  title: StringsManager.language,
                  iconPath: AssetsManager.languageIcon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
