import 'package:briefcase/constants/constants.dart';
import 'package:briefcase/lib/pages/detail_info_page.dart';
import 'package:briefcase/lib/pages/mepet_page.dart';
import 'package:briefcase/lib/pages/virtual_office_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/name_widget.dart';
import '../widgets/text_option_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Función para abrir el enlace
  Future<void> _launchURL(String url) async {
    final Uri toLaunch = Uri.parse(url);
    if (!await launchUrl(toLaunch, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: ColorTween(
          begin: Colors.grey,
          end: Theme.of(context).scaffoldBackgroundColor,
        ),
        builder: (BuildContext context, dynamic value, Widget? child) {
          return Container(
            color: value,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return _buildWideLayout(context);
                } else {
                  return _buildNarrowLayout(context);
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.paddingH, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const NameWidget(),
              const Gap(30),
              FadeTransition(
                opacity: _animation,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Briefcase of Ivan Gustin',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          'Software Engineer',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pasto, Colombia',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SelectableText(
                          'ivandgustin@gmail.com',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => _launchURL(
                              'https://www.linkedin.com/in/ivandgu/'),
                          child: Row(
                            children: [
                              Text(
                                '01',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 10,
                                    ),
                              ),
                              const Gap(15),
                              Text(
                                'Linkedin',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Gap(50),
                  TextOptionWidget(
                    title: 'MEDICO',
                    subtitle: 'VIRTUAL',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DetailInfoPage(
                            textColor: Colors.white,
                            colorImagesBack:
                                Theme.of(context).scaffoldBackgroundColor,
                            colorBackground: Colors.black,
                            title: 'MEDICO VIRTUAL',
                            description:
                                '¡Descarga Pubs y descubre los mejores lugares de tu ciudad! Con Pubs podrás. Explorar los mejores bares y pubs, ver menús detallados, encontrar eventos y promociones exclusivas, pedir tus canciones favoritas, votar por las canciones que más te gustan (¡las más votadas sonarán en el pub!). Conocer nuevas personas en el lugar donde estés.',
                            coverImage: 'assets/bar.webp',
                            images: const [
                              'assets/pubs_1.png',
                              'assets/pubs_2.png',
                              'assets/pubs_3.png',
                              'assets/pubs_4.png',
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'PUBS',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DetailInfoPage(
                            textColor: Colors.white,
                            colorImagesBack:
                                Theme.of(context).scaffoldBackgroundColor,
                            colorBackground: Colors.black,
                            title: 'PUBS',
                            description:
                                '¡Descarga Pubs y descubre los mejores lugares de tu ciudad! Con Pubs podrás. Explorar los mejores bares y pubs, ver menús detallados, encontrar eventos y promociones exclusivas, pedir tus canciones favoritas, votar por las canciones que más te gustan (¡las más votadas sonarán en el pub!). Conocer nuevas personas en el lugar donde estés.',
                            coverImage: 'assets/bar.webp',
                            images: const [
                              'assets/pubs_1.png',
                              'assets/pubs_2.png',
                              'assets/pubs_3.png',
                              'assets/pubs_4.png',
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'TRIPPSTER',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0XFF00C535),
                            colorBackground: Colors.white,
                            title: 'TRIPPSTER',
                            description:
                                'Bievenido a TRIPPSTER, en Trippster podrás conectar con viajeros de todo el mundo y compartir con ellos experiencias auténticas. Descubre el Alma Viajera: Quiénes Somos en Trippster, En Trippster, somos apasionados exploradores y expertos en hacer realidad tus sueños de viaje. Con años de experiencia en el sector, nos enorgullece ofrecer experiencias únicas y personalizadas que van más allá de lo convencional. Nuestro compromiso es convertir cada viaje en una aventura inolvidable, brindando un servicio excepcional y descubriendo destinos extraordinarios, ¡Bienvenido a Trippster, donde cada viaje es una historia por contar!',
                            coverImage: 'assets/trippster_6.png',
                            images: [
                              'assets/trippster_1.png',
                              'assets/trippster_3.png',
                              'assets/trippster_5.png',
                              'assets/trippster_4.png',
                              'assets/trippster_2.png'
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'MEPET',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const MepetPage(),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'CONSULTORIO',
                    subtitle: 'VIRUTAL',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const VirtualOfficePage(),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  const Gap(50),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'PUBS',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DetailInfoPage(
                            textColor: Colors.white,
                            colorImagesBack:
                                Theme.of(context).scaffoldBackgroundColor,
                            colorBackground: Colors.black,
                            title: 'PUBS',
                            description:
                                '¡Descarga Pubs y descubre los mejores lugares de tu ciudad! Con Pubs podrás. Explorar los mejores bares y pubs, ver menús detallados, encontrar eventos y promociones exclusivas, pedir tus canciones favoritas, votar por las canciones que más te gustan (¡las más votadas sonarán en el pub!). Conocer nuevas personas en el lugar donde estés.',
                            coverImage: 'assets/bar.webp',
                            images: const [
                              'assets/pubs_1.png',
                              'assets/pubs_2.png',
                              'assets/pubs_3.png',
                              'assets/pubs_4.png',
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'TRIPPSTER',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0XFF00C535),
                            colorBackground: Colors.white,
                            title: 'TRIPPSTER',
                            description:
                                'Bievenido a TRIPPSTER, en Trippster podrás conectar con viajeros de todo el mundo y compartir con ellos experiencias auténticas. Descubre el Alma Viajera: Quiénes Somos en Trippster, En Trippster, somos apasionados exploradores y expertos en hacer realidad tus sueños de viaje. Con años de experiencia en el sector, nos enorgullece ofrecer experiencias únicas y personalizadas que van más allá de lo convencional. Nuestro compromiso es convertir cada viaje en una aventura inolvidable, brindando un servicio excepcional y descubriendo destinos extraordinarios, ¡Bienvenido a Trippster, donde cada viaje es una historia por contar!',
                            coverImage: 'assets/trippster_6.png',
                            images: [
                              'assets/trippster_1.png',
                              'assets/trippster_3.png',
                              'assets/trippster_5.png',
                              'assets/trippster_4.png',
                              'assets/trippster_2.png'
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'MEPET',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const MepetPage(),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'CONSULTORIO',
                    subtitle: '     VIRUTAL',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const VirtualOfficePage(),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  const Gap(20),
                ],
              ),
            ),
            const Gap(90),
            const NameWidget(),
            const Gap(20),
            FadeTransition(
              opacity: _animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Briefcase of Ivan Gustin',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Software Engineer',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Gap(20),
                  Text(
                    'Pasto, Colombia',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SelectableText(
                    'ivandgustin@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () =>
                        _launchURL('https://www.linkedin.com/in/ivandgu/'),
                    child: Row(
                      children: [
                        Text(
                          '01',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 10,
                                  ),
                        ),
                        const Gap(10),
                        Text(
                          'Linkedin',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
