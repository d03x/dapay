part of 'widget.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(firebaseAuthStateProvider);
    return state.when(
      data: (data) {
        if (data == null) {
          return AuthLoginScreen();
        }
        return HomePersentationUi();
      },
      error: (error, stackTrace) {
        return Text("ERROR");
      },
      loading: () => Scaffold(
        body: Scaffold(body: Center(child: Text("Loading"))),
      ),
    );
  }
}
