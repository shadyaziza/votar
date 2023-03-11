part of app_router;

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSiwtcherControllerPod);
    final loc = ref.watch(appLocalizationsControllerPod);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [ThemeSwitcher(), ChangeLocaleWidget()],
            ),
            const Spacer(),
            Center(
              child: Text(
                'Votar',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                      color: themeMode.mode == ThemeMode.dark
                          ? Colors.white54
                          : Colors.black54,
                    ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(loc.startPolling),
                  ),
                  TextButton(
                    onPressed: () {
                      const OtherScreenRoute(id: 2).go(context);
                    },
                    child: Text(loc.joinAnActivePoll),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
