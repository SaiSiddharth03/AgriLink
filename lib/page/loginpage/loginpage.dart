import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../page/bottomnavigation_bar.dart';
import '../../page/registerPage/letus.dart';
import '../../provider/auth_provider/auth_provider.dart';
import '../../service/nodejs_service/signin_service.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    const Color green1 = Color.fromARGB(255, 135, 193, 89);
    const Color green2 = Color.fromARGB(255, 5, 130, 64);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.86,
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                        fontSize: 30,
                        color: green2,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding:  EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email/Username',
                          style: TextStyle(
                              fontSize: 20,
                              color: green2,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintText: 'user@gmail.com',
                        hintStyle:
                        TextStyle(color: Colors.white.withOpacity(0.7)),
                        filled: true,
                        fillColor: green2,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white.withOpacity(0.7),
                        )),
                    validator: (value) {
                      if (value!.contains('@')) {
                        return null;
                      } else {
                        return 'invalid email';
                      }
                    },
                  ),
                  const Padding(
                    padding:  EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'password',
                          style: TextStyle(
                              fontSize: 20,
                              color: green2,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintText: 'password',
                        hintStyle:
                        TextStyle(color: Colors.white.withOpacity(0.7)),
                        filled: true,
                        fillColor: green2,
                        prefixIcon: Icon(
                          Icons.vpn_key_rounded,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white.withOpacity(0.7),
                        )),
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'password at least 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 4, bottom: 28),
                    child: InkWell(
                      onTap: () {},
                      child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Forgot password?',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: green2,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline))),
                    ),
                  ),
                  authState
                      ? const CircularProgressIndicator()
                      : InkWell(
                    onTap: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      ref
                          .read(authStateProvider.notifier)
                          .signIn(_emailController.text,
                          _passwordController.text)
                          .then((value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const BottomNavigationBarPage(),
                            ));
                        ref
                            .read(authStateProvider.notifier)
                            .changeState();
                        ref
                            .read(signInAccountProvider.notifier)
                            .signInAccount(_emailController.text,
                            _passwordController.text);
                      }).catchError((e) {
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text(e.toString())));

                        return;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                          color: green1,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: green1,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5),
                          child: Text('or, you can continue using',
                              style: TextStyle(color: green2)),
                        ),
                        Expanded(
                            child: Divider(
                              thickness: 1,
                              color: green1,
                            )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          iconSize: 50,
                          onPressed: () {
                            ref
                                .read(authStateProvider.notifier)
                                .googleSignIn()
                                .then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const BottomNavigationBarPage(),
                                  ));
                              ref
                                  .read(authStateProvider.notifier)
                                  .changeState();
                            }).catchError((e) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(
                                    SnackBar(content: Text(e.toString())));

                              return;
                            });
                          },
                          icon: Image.asset(
                            'assets/icons/Google.png',
                          )),
                      IconButton(
                          iconSize: 50,
                          onPressed: () {},
                          icon: Image.asset('assets/icons/Facebook.png')),
                      IconButton(
                          iconSize: 50,
                          onPressed: () {},
                          icon: Image.asset('assets/icons/Twitter.png'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?",
                          style: TextStyle(fontSize: 13)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => const Register()));
                          },
                          child: const Text('Sign Up',
                              style: TextStyle(fontSize: 13)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
