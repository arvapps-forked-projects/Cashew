import 'package:budget/database/tables.dart';
import 'package:budget/functions.dart';
import 'package:budget/main.dart';
import 'package:budget/pages/accountsPage.dart';
import 'package:budget/pages/addTransactionPage.dart';
import 'package:budget/pages/debugPage.dart';
import 'package:budget/pages/detailedChangelogPage.dart';
import 'package:budget/pages/onBoardingPage.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/languageMap.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/framework/popupFramework.dart';
import 'package:budget/widgets/moreIcons.dart';
import 'package:budget/widgets/openBottomSheet.dart';
import 'package:budget/widgets/openPopup.dart';
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:budget/widgets/outlinedButtonStacked.dart';
import 'package:budget/widgets/showChangelog.dart';
import 'package:budget/widgets/tappable.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:budget/colors.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color containerColor = appStateSettings["materialYou"]
        ? dynamicPastel(
            context, Theme.of(context).colorScheme.secondaryContainer,
            amountLight: 0.2, amountDark: 0.6)
        : getColor(context, "lightDarkAccent");
    return PageFramework(
      dragDownToDismiss: true,
      title: "about".tr(),
      horizontalPadding: getHorizontalPaddingConstrained(context),
      listWidgets: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 7),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              Image(
                image: AssetImage("assets/icon/icon-small.png"),
                height: 70,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Tappable(
                    borderRadius: getPlatform() == PlatformOS.isIOS ? 10 : 15,
                    onLongPress: () {
                      if (allowDebugFlags)
                        pushRoute(
                          context,
                          DebugPage(),
                        );
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 3, horizontal: 10),
                      child: TextFont(
                        text: globalAppName,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        textAlign: TextAlign.center,
                        maxLines: 5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: 0, horizontal: 10),
                    child: TextFont(
                      text: getVersionString(),
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 5),
        AboutLinks(containerColor: containerColor),
        SizedBox(height: 10),
        HorizontalBreak(),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 7),
          child: Center(
            child: TextFont(
              text: "development-team".tr(),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 5),
          child: Tappable(
            onTap: () {
              openUrl('mailto:dapperappdeveloper@gmail.com');
            },
            onLongPress: () {
              copyToClipboard("dapperappdeveloper@gmail.com");
            },
            color: containerColor,
            borderRadius: getPlatform() == PlatformOS.isIOS ? 10 : 15,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 13, vertical: 15),
              child: Column(
                children: [
                  TextFont(
                    text: "lead-developer".tr(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                  TextFont(
                    text: "James",
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                  TextFont(
                    text: "dapperappdeveloper@gmail.com",
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    textColor: getColor(context, "textLight"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 5),
          child: Tappable(
            onTap: () {},
            color: containerColor,
            borderRadius: getPlatform() == PlatformOS.isIOS ? 10 : 15,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 13, vertical: 15),
              child: Column(
                children: [
                  TextFont(
                    text: "database-designer".tr(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                  TextFont(
                    text: "YuYing",
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 7),
          child: Center(
            child: TextFont(
              text: "made-in-canada".tr() + " " + "🍁",
              fontSize: 14,
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
          ),
        ),
        SizedBox(height: 10),
        if (getPlatform(ignoreEmulation: true) == PlatformOS.isAndroid ||
            kIsWeb)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
            child: HorizontalBreakAbove(
                child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 15, vertical: 7),
                  child: Center(
                    child: TextFont(
                      text: "advanced-automation".tr(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                    ),
                  ),
                ),
                AboutDeepLinking(),
              ],
            )),
          ),
        SizedBox(height: 10),
        HorizontalBreak(),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 7),
          child: Center(
            child: TextFont(
              text: "graphics".tr(),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
          ),
        ),
        AboutInfoBox(
          title: "freepik-credit".tr(),
          link: "https://www.flaticon.com/authors/freepik",
        ),
        AboutInfoBox(
          title: "font-awesome-credit".tr(),
          link: "https://fontawesome.com/",
        ),
        AboutInfoBox(
          title: "pch-vector-credit".tr(),
          link: "https://www.freepik.com/author/pch-vector",
        ),
        Container(height: 15),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 7),
          child: Center(
            child: TextFont(
              text: "major-tools".tr(),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
          ),
        ),
        AboutInfoBox(
          title: "Flutter",
          link: "https://flutter.dev/",
        ),
        AboutInfoBox(
          title: "Google Cloud APIs",
          link: "https://cloud.google.com/",
        ),
        AboutInfoBox(
          title: "Drift SQL Database",
          link: "https://drift.simonbinder.eu/",
        ),
        AboutInfoBox(
          title: "FL Charts",
          link: "https://github.com/imaNNeoFighT/fl_chart",
        ),
        AboutInfoBox(
          title: "exchange-rates-api".tr(),
          link: "https://github.com/fawazahmed0/exchange-api",
        ),
        Container(height: 15),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 7),
          child: Center(
            child: TextFont(
              text: "translations".tr().capitalizeFirst,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 5),
          child: TranslationsHelp(
            showIcon: false,
            backgroundColor: containerColor,
          ),
        ),
        TranslationInfoBox(
          title: "Italian",
          list: ["Thomas B.", "Mattia A."],
        ),
        TranslationInfoBox(
          title: "Polish",
          list: ["Michał S.", "Michał P."],
        ),
        TranslationInfoBox(
          title: "Serbian",
          list: ["Jovan P."],
        ),
        TranslationInfoBox(
          title: "Swahili",
          list: ["Anthony K."],
        ),
        TranslationInfoBox(
          title: "German",
          list: ["Fabian S.", "Christian R.", "Samuel R."],
        ),
        TranslationInfoBox(
          title: "Arabic",
          list: ["Dorra Y."],
        ),
        TranslationInfoBox(
          title: "Portuguese",
          list: [
            "Alexander G.",
            "Jean J.",
            "João P.",
            "Junior M.",
            "Leandro",
            "Xavier B."
          ],
        ),
        TranslationInfoBox(
          title: "Bulgarian",
          list: ["Денислав C."],
        ),
        TranslationInfoBox(
          title: "Chinese (Simplified)",
          list: ["Clyde"],
        ),
        TranslationInfoBox(
          title: "Chinese (Traditional)",
          list: ["qazlll456"],
        ),
        TranslationInfoBox(
          title: "Hindi",
          list: ["Dikshant S.", "Nikunj K."],
        ),
        TranslationInfoBox(
          title: "Vietnamese",
          list: ["Ng. Anh"],
        ),
        TranslationInfoBox(
          title: "French",
          list: ["Antoine C.", "Fabien H."],
        ),
        TranslationInfoBox(
          title: "Indonesian",
          list: ["Gusairi P."],
        ),
        TranslationInfoBox(
          title: "Ukrainian",
          list: ["Chris M.", "Yurii S."],
        ),
        TranslationInfoBox(
          title: "Russian",
          list: ["Ilya A.", "Konstantin B.", "Dennis Q"],
        ),
        TranslationInfoBox(
          title: "Romanian",
          list: ["Valentin G."],
        ),
        TranslationInfoBox(
          title: "Spanish",
          list: ["Pablo S.", "Gonzalo R.", "Ramon M."],
        ),
        TranslationInfoBox(
          title: "Swedish",
          list: ["Anna M."],
        ),
        TranslationInfoBox(
          title: "Danish",
          list: ["Mittheo"],
        ),
        TranslationInfoBox(
          title: "Turkish",
          list: ["Serdar A."],
        ),
        TranslationInfoBox(
          title: "Slovak",
          list: ["Igor V."],
        ),
        TranslationInfoBox(
          title: "Macedonian",
          list: ["Andrej A."],
        ),
        TranslationInfoBox(
          title: "Arabic",
          list: ["Ammar N."],
        ),
        TranslationInfoBox(
          title: "Czech",
          list: ["Kamil T."],
        ),
        TranslationInfoBox(
          title: "Hebrew",
          list: ["Happy Bear"],
        ),
        TranslationInfoBox(
          title: "Afrikaans",
          list: ["Andrè B."],
        ),
        TranslationInfoBox(
          title: "Filipino",
          list: ["Waren G."],
        ),
        TranslationInfoBox(
          title: "Tamil",
          list: ["Mohamed A."],
        ),
        TranslationInfoBox(
          title: "Japanese",
          list: ["Tetta N."],
        ),
        TranslationInfoBox(
          title: "Hungarian",
          list: ["Döbröntei S."],
        ),
        TranslationInfoBox(
          title: "Thai",
          list: ["Jateniphat U."],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

void showChangelogForce(BuildContext context) {
  showChangelog(
    context,
    forceShow: true,
    majorChangesOnly: true,
    extraWidget: Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: 10,
      ),
      child: Button(
        label: "view-detailed-changelog".tr(),
        onTap: () {
          Navigator.pop(context);
          pushRoute(context, DetailedChangelogPage());
        },
      ),
    ),
  );
}

void openOnBoarding(BuildContext context) {
  pushRoute(
    context,
    OnBoardingPage(
      popNavigationWhenDone: true,
      showPreviewDemoButton: false,
    ),
  );
}

void openLicensesPage(BuildContext context) {
  showLicensePage(
      context: context,
      applicationVersion: getVersionString(),
      applicationLegalese:
          "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." +
              "\n\n" +
              "exchange-rate-notice-description".tr());
}

void deleteAllDataFlow(BuildContext context) {
  openPopup(
    context,
    title: "erase-everything".tr(),
    description: "erase-everything-description".tr(),
    icon: appStateSettings["outlinedIcons"]
        ? Icons.warning_outlined
        : Icons.warning_rounded,
    onExtraLabel2: "erase-synced-data-and-cloud-backups".tr(),
    onExtra2: () {
      Navigator.pop(context);
      openBottomSheet(
        context,
        PopupFramework(
          title: "erase-cloud-data".tr(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 18,
                  start: 5,
                  end: 5,
                ),
                child: TextFont(
                  text: "erase-cloud-data-description".tr(),
                  fontSize: 18,
                  textAlign: TextAlign.center,
                  maxLines: 10,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SyncCloudBackupButton(
                      onTap: () async {
                        Navigator.pop(context);
                        pushRoute(context, AccountsPage());
                      },
                    ),
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: BackupsCloudBackupButton(
                      onTap: () async {
                        Navigator.pop(context);
                        pushRoute(context, AccountsPage());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
    onSubmit: () async {
      Navigator.pop(context);
      openPopup(
        context,
        title: "erase-everything-warning".tr(),
        description: "erase-everything-warning-description".tr(),
        icon: appStateSettings["outlinedIcons"]
            ? Icons.warning_amber_outlined
            : Icons.warning_amber_rounded,
        onSubmit: () async {
          Navigator.pop(context);
          clearDatabase(context);
        },
        onSubmitLabel: "erase".tr(),
        onCancelLabel: "cancel".tr(),
        onCancel: () {
          Navigator.pop(context);
        },
      );
    },
    onSubmitLabel: "erase".tr(),
    onCancelLabel: "cancel".tr(),
    onCancel: () {
      Navigator.pop(context);
    },
  );
}

class AboutLinks extends StatelessWidget {
  const AboutLinks({required this.containerColor, Key? key}) : super(key: key);
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          getPlatform() == PlatformOS.isIOS ? 10 : 15,
        ),
        child: Column(
          children: [
            _buildTappable(
              context: context,
              isExternalLink: true,
              onTap: () => openUrl("https://github.com/jameskokoska/Cashew"),
              icon: MoreIcons.github,
              text: "app-is-open-source".tr(namedArgs: {"app": globalAppName}),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: true,
              onTap: () => openUrl("https://cashewapp.web.app/faq.html"),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.live_help_outlined
                  : Icons.live_help_rounded,
              text: "guide-and-faq".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () => showChangelogForce(context),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.list_alt_outlined
                  : Icons.list_alt_rounded,
              text: "changelog".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () => openOnBoarding(context),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.door_front_door_outlined
                  : Icons.door_front_door_rounded,
              text: "view-app-intro".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: true,
              onTap: () => openUrl("http://cashewapp.web.app/policy.html"),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.policy_outlined
                  : Icons.policy_rounded,
              text: "privacy-policy".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () => openLicensesPage(context),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.account_balance_outlined
                  : Icons.account_balance_rounded,
              text: "view-licenses-and-legalese".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () => deleteAllDataFlow(context),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.delete_sweep_outlined
                  : Icons.delete_sweep_rounded,
              text: "delete-all-data".tr(),
              color: Colors.red.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTappable(
      {required BuildContext context,
      required VoidCallback onTap,
      required IconData icon,
      required String text,
      required bool isExternalLink,
      Color? color}) {
    return Tappable(
      onTap: onTap,
      borderRadius: 0,
      color: color ?? containerColor,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 18, end: 18, top: 11, bottom: 11),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFont(
                text: text,
                fontSize: 17,
                maxLines: 5,
              ),
            ),
            Icon(
              isExternalLink
                  ? appStateSettings["outlinedIcons"]
                      ? Icons.open_in_new_outlined
                      : Icons.open_in_new_rounded
                  : appStateSettings["outlinedIcons"]
                      ? Icons.keyboard_arrow_right_outlined
                      : Icons.keyboard_arrow_right_rounded,
              size: 22,
              color: getColor(context, "black").withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutDeepLinking extends StatelessWidget {
  const AboutDeepLinking({super.key});

  @override
  Widget build(BuildContext context) {
    return AboutInfoBox(
      title: "deep-linking".tr(),
      showLink: false,
      link:
          "https://github.com/jameskokoska/Cashew?tab=readme-ov-file#app-links",
      list: [
        "deep-linking-description".tr(),
      ],
    );
  }
}

// Note that this is different than forceDeleteDB()
Future clearDatabase(BuildContext context) async {
  openLoadingPopup(context);
  await Future.wait([database.deleteEverything(), sharedPreferences.clear()]);
  await database.close();
  Navigator.pop(context);
  restartAppPopup(context);
}

class TranslationInfoBox extends StatelessWidget {
  const TranslationInfoBox({
    Key? key,
    required this.title,
    this.list,
  }) : super(key: key);

  final String title;
  final List<String>? list;

  @override
  Widget build(BuildContext context) {
    return AboutInfoBox(
      title: title,
      list: list,
      listTextColor: getColor(context, "black").withOpacity(0.5),
    );
  }
}

class AboutInfoBox extends StatelessWidget {
  const AboutInfoBox({
    Key? key,
    required this.title,
    this.link,
    this.list,
    this.color,
    this.listTextColor,
    this.padding,
    this.showLink = true,
  }) : super(key: key);

  final String title;
  final String? link;
  final List<String>? list;
  final Color? color;
  final Color? listTextColor;
  final EdgeInsetsDirectional? padding;
  final bool showLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
      child: Tappable(
        onTap: () async {
          if (link != null) openUrl(link ?? "");
        },
        onLongPress: () {
          if (link != null) copyToClipboard(link ?? "");
        },
        color: color ??
            (appStateSettings["materialYou"]
                ? dynamicPastel(
                    context, Theme.of(context).colorScheme.secondaryContainer,
                    amountLight: 0.2, amountDark: 0.6)
                : getColor(context, "lightDarkAccent")),
        borderRadius: getPlatform() == PlatformOS.isIOS ? 10 : 15,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 13, vertical: 15),
          child: Column(
            children: [
              TextFont(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
              SizedBox(height: 6),
              if (link != null && showLink)
                TextFont(
                  text: link ?? "",
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  textColor: getColor(context, "textLight"),
                  maxLines: 1,
                ),
              for (String item in list ?? [])
                TextFont(
                  text: item,
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  textColor: listTextColor ?? getColor(context, "textLight"),
                  maxLines: 10,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
