part of onboarding_screens;

class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = ref.watch(appLocalizationsControllerPod);
    final pageCont = usePageController();
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [ThemeSwitcher(), ChangeLocaleWidget()],
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageCont,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const AppLottie(
                        animJson: AnimJson.technyPieChartWithWhitePart,
                        height: 240,
                      ),
                      const Spacer(),
                      Text(
                        loc.onboardingFirstStatement,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          HomeScreenRoute().go(context);
                        },
                        child: Text(loc.next),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
