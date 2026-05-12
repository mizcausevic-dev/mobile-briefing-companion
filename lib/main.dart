import 'package:flutter/material.dart';

void main() {
  runApp(const BriefingCompanionApp());
}

class BriefingCompanionApp extends StatelessWidget {
  const BriefingCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    const canvas = Color(0xFF060B14);
    const surface = Color(0xFF0F1B2C);
    const card = Color(0xFF142338);
    const edge = Color(0xFF264564);
    const accent = Color(0xFF79C9FF);
    const text = Color(0xFFF4EEE1);

    return MaterialApp(
      title: 'Mobile Briefing Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: canvas,
        colorScheme: const ColorScheme.dark(
          surface: surface,
          primary: accent,
          secondary: Color(0xFFF6BEDA),
          tertiary: Color(0xFFF4D27B),
          onSurface: text,
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            color: text,
            fontSize: 33,
            fontWeight: FontWeight.w800,
            height: 1.02,
          ),
          headlineSmall: TextStyle(
            color: text,
            fontSize: 23,
            fontWeight: FontWeight.w800,
            height: 1.06,
          ),
          titleLarge: TextStyle(
            color: text,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            color: text,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFFB2BDD0),
            fontSize: 16,
            height: 1.45,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFB2BDD0),
            fontSize: 14,
            height: 1.4,
          ),
          labelSmall: TextStyle(
            color: Color(0xFF8BA4BC),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.25,
          ),
        ),
        cardTheme: const CardThemeData(
          color: card,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            side: BorderSide(color: edge, width: 1.2),
          ),
        ),
      ),
      home: const BriefingCompanionHome(),
    );
  }
}

enum AppSection { briefing, signals, actions, anatomy }

class BriefingCompanionHome extends StatefulWidget {
  const BriefingCompanionHome({super.key});

  @override
  State<BriefingCompanionHome> createState() => _BriefingCompanionHomeState();
}

class _BriefingCompanionHomeState extends State<BriefingCompanionHome> {
  AppSection currentSection = AppSection.briefing;

  static const navItems = [
    NavigationDestination(icon: Icon(Icons.dashboard_outlined), label: 'Briefing'),
    NavigationDestination(icon: Icon(Icons.alt_route), label: 'Signals'),
    NavigationDestination(icon: Icon(Icons.checklist_rtl), label: 'Actions'),
    NavigationDestination(icon: Icon(Icons.account_tree_outlined), label: 'Anatomy'),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = {
      AppSection.briefing: const _BriefingPage(),
      AppSection.signals: const _SignalsPage(),
      AppSection.actions: const _ActionsPage(),
      AppSection.anatomy: const _AnatomyPage(),
    };

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF08111E), Color(0xFF060B14)],
          ),
        ),
        child: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            child: Column(
              key: ValueKey(currentSection),
              children: [
                _TopShell(section: currentSection),
                Expanded(child: pages[currentSection]!),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 80,
        selectedIndex: currentSection.index,
        backgroundColor: const Color(0xFF0F1B2C),
        indicatorColor: const Color(0xFF203651),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: navItems,
        onDestinationSelected: (value) {
          setState(() => currentSection = AppSection.values[value]);
        },
      ),
    );
  }
}

class _TopShell extends StatelessWidget {
  const _TopShell({required this.section});

  final AppSection section;

  String get title => switch (section) {
        AppSection.briefing => 'Executive Briefing',
        AppSection.signals => 'Signal Lanes',
        AppSection.actions => 'Action Queue',
        AppSection.anatomy => 'Repo Anatomy',
      };

  String get subtitle => switch (section) {
        AppSection.briefing => 'Mobile sync active',
        AppSection.signals => 'Cross-functional feed',
        AppSection.actions => 'Owner alignment',
        AppSection.anatomy => 'How the project is built',
      };

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelSmall;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Text(
              'MC',
              style: TextStyle(
                color: Color(0xFF08111E),
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 2),
                Text(subtitle.toUpperCase(), style: labelStyle),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1C3654),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Row(
              children: [
                Icon(Icons.sync, color: Color(0xFF79C9FF), size: 14),
                SizedBox(width: 6),
                Text(
                  'LIVE',
                  style: TextStyle(
                    color: Color(0xFF79C9FF),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BriefingPage extends StatelessWidget {
  const _BriefingPage();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
      children: const [
        _HeroPanel(),
        SizedBox(height: 18),
        _MetricGrid(),
        SizedBox(height: 18),
        _TrendAndQueueRow(),
        SizedBox(height: 18),
        _BriefingPackSection(),
      ],
    );
  }
}

class _SignalsPage extends StatelessWidget {
  const _SignalsPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
      children: [
        Text(
          'Every lane explains what changed, why it matters, and which operator should move next.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 18),
        const _SignalCard(
          tone: Color(0xFFF6BEDA),
          label: 'Revenue',
          title: 'Pipeline pressure is moving from the weekly review into the board deck.',
          body:
              'Northstar coverage is down to 2.7x while expansion confidence still holds. Keep new-logo spend disciplined.',
          tag: '+14% drift',
        ),
        const SizedBox(height: 14),
        const _SignalCard(
          tone: Color(0xFFF4D27B),
          label: 'Risk',
          title: 'Legal hold scope widened in the finance lane.',
          body:
              'Deletion is paused for 1,882 artifacts until the export backlog clears and residency checks are complete.',
          tag: 'Freeze lane',
        ),
        const SizedBox(height: 14),
        const _SignalCard(
          tone: Color(0xFF93E3B1),
          label: 'AI Ops',
          title: 'Model release is healthy, but briefing guidance needs a footnote.',
          body:
              'Guardrail drift is stable. Add one executive note before the morning pack leaves the device.',
          tag: 'Stable',
        ),
      ],
    );
  }
}

class _ActionsPage extends StatelessWidget {
  const _ActionsPage();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
      children: const [
        _ActionTile(
          priority: 'P1',
          title: 'Freeze finance deletion jobs',
          owner: 'Records Management',
          eta: 'Today',
          note: 'Prevent scheduler drift from catching legal-hold artifacts before export completes.',
        ),
        SizedBox(height: 14),
        _ActionTile(
          priority: 'P1',
          title: 'Update board note on pipeline compression',
          owner: 'Revenue Operations',
          eta: 'Before 4:30 PM',
          note: 'Translate the coverage drop into one sentence of commercial guidance for the mobile deck.',
        ),
        SizedBox(height: 14),
        _ActionTile(
          priority: 'P2',
          title: 'Attach model-risk note to briefing pack',
          owner: 'AI Governance',
          eta: 'This sprint',
          note: 'Keep the release status green, but make the operator dependency visible to leadership.',
        ),
      ],
    );
  }
}

class _AnatomyPage extends StatelessWidget {
  const _AnatomyPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Built as a real Flutter surface, not a screenshot shell.', style: theme.textTheme.headlineSmall),
                const SizedBox(height: 14),
                Text(
                  'The app keeps the mobile artifact honest: one codebase, real bottom navigation, widget tests, web build validation, and a proof layer for the repo homepage.',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 18),
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _ChipLabel(text: 'Flutter 3.41.5', color: Color(0xFF79C9FF)),
                    _ChipLabel(text: 'Windows + Web', color: Color(0xFFF4D27B)),
                    _ChipLabel(text: 'Widget tests', color: Color(0xFF93E3B1)),
                    _ChipLabel(text: 'PNG proof', color: Color(0xFFF6BEDA)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        const _AnatomyFlow(),
        const SizedBox(height: 18),
        const _ValidationPanel(),
      ],
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionLabel('MOBILE BRIEFING COMPANION'),
            const SizedBox(height: 14),
            Text(
              'Strategy now has\nan on-device control room.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 14),
            Text(
              'The companion compresses revenue, risk, AI, and operator pressure into a mobile workflow that leadership can actually carry.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _ChipLabel(text: 'Board prep 16:30', color: Color(0xFF79C9FF)),
                _ChipLabel(text: 'Risk lane freeze', color: Color(0xFFFF9D8F)),
                _ChipLabel(text: 'Sync active', color: Color(0xFF93E3B1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricGrid extends StatelessWidget {
  const _MetricGrid();

  @override
  Widget build(BuildContext context) {
    const metrics = [
      ('Briefing packs', '6'),
      ('Signals translated', '41'),
      ('Decision pressure', '9'),
      ('Owners attached', '14'),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: metrics.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        final metric = metrics[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionLabel(metric.$1.toUpperCase()),
                const Spacer(),
                Text(
                  metric.$2,
                  style: const TextStyle(
                    color: Color(0xFFF4EEE1),
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TrendAndQueueRow extends StatelessWidget {
  const _TrendAndQueueRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TrendCard(),
        SizedBox(height: 14),
        _MiniQueueCard(),
      ],
    );
  }
}

class _TrendCard extends StatelessWidget {
  const _TrendCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionLabel('MOBILE TREND VIEW'),
            const SizedBox(height: 12),
            const Text(
              'Revenue pack momentum',
              style: TextStyle(color: Color(0xFFF4EEE1), fontSize: 24, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            const Text(
              'The board pack should emphasize signal compression, not raw dashboard sprawl.',
              style: TextStyle(color: Color(0xFFB2BDD0), fontSize: 15, height: 1.45),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 110,
              child: CustomPaint(
                painter: _SparklinePainter(),
                child: const SizedBox.expand(),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text('+14% signal lift', style: TextStyle(color: Color(0xFF93E3B1), fontWeight: FontWeight.w700)),
                Spacer(),
                Text('7-day view', style: TextStyle(color: Color(0xFF8BA4BC))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniQueueCard extends StatelessWidget {
  const _MiniQueueCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _SectionLabel('IMMEDIATE QUEUE'),
            SizedBox(height: 12),
            Text(
              'Freeze finance deletion jobs',
              style: TextStyle(color: Color(0xFFF4EEE1), fontSize: 22, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 8),
            Text(
              'Records Management · Today',
              style: TextStyle(color: Color(0xFFB2BDD0), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class _BriefingPackSection extends StatelessWidget {
  const _BriefingPackSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Briefing packs', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 14),
        SizedBox(
          height: 286,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _PackCard(
                title: 'Board',
                subtitle: 'Revenue, risk, and AI summary',
                note: '3 pages · ready to send',
                tone: Color(0xFFF6BEDA),
              ),
              SizedBox(width: 14),
              _PackCard(
                title: 'Launch',
                subtitle: 'Release note and dependency watch',
                note: '2 blockers · 1 rollback note',
                tone: Color(0xFF79C9FF),
              ),
              SizedBox(width: 14),
              _PackCard(
                title: 'Governance',
                subtitle: 'Legal hold and retention posture',
                note: '2 freeze lanes · 1 watch lane',
                tone: Color(0xFFF4D27B),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PackCard extends StatelessWidget {
  const _PackCard({
    required this.title,
    required this.subtitle,
    required this.note,
    required this.tone,
  });

  final String title;
  final String subtitle;
  final String note;
  final Color tone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 248,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: tone.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(title, style: TextStyle(color: tone, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Text(
                  subtitle,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 23,
                    color: Color(0xFFF5EEDD),
                    fontWeight: FontWeight.w700,
                    height: 1.08,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(note, style: const TextStyle(color: Color(0xFFB1BED0), fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignalCard extends StatelessWidget {
  const _SignalCard({
    required this.tone,
    required this.label,
    required this.title,
    required this.body,
    required this.tag,
  });

  final Color tone;
  final String label;
  final String title;
  final String body;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _ChipLabel(text: label, color: tone),
                const Spacer(),
                Text(tag, style: TextStyle(color: tone, fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                color: Color(0xFFF5EEDD),
                fontWeight: FontWeight.w700,
                height: 1.05,
              ),
            ),
            const SizedBox(height: 14),
            Text(body, style: const TextStyle(color: Color(0xFFB1BED0), fontSize: 16, height: 1.45)),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.priority,
    required this.title,
    required this.owner,
    required this.eta,
    required this.note,
  });

  final String priority;
  final String title;
  final String owner;
  final String eta;
  final String note;

  @override
  Widget build(BuildContext context) {
    final color = priority == 'P1' ? const Color(0xFFFF9D8F) : const Color(0xFF79C9FF);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: Text(
                priority,
                style: const TextStyle(color: Color(0xFFF5EEDD), fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 20, color: Color(0xFFF5EEDD), fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text('$owner · $eta', style: const TextStyle(color: Color(0xFFB1BED0), fontSize: 15)),
                  const SizedBox(height: 10),
                  Text(note, style: const TextStyle(color: Color(0xFF8BA4BC), fontSize: 14, height: 1.35)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnatomyFlow extends StatelessWidget {
  const _AnatomyFlow();

  @override
  Widget build(BuildContext context) {
    const items = [
      ('Flutter shell', 'Bottom navigation, view switching, and mobile-first control-room framing.'),
      ('Signal modes', 'Briefing, signals, actions, and anatomy all live in one device-friendly flow.'),
      ('Repo proof', 'Widget tests, web build validation, and generated PNG proof keep the project portable.'),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionLabel('PROJECT FLOW'),
            const SizedBox(height: 14),
            ...items.asMap().entries.map(
              (entry) => Padding(
                padding: EdgeInsets.only(bottom: entry.key == items.length - 1 ? 0 : 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C3654),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${entry.key + 1}',
                        style: const TextStyle(
                          color: Color(0xFF79C9FF),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.value.$1,
                            style: const TextStyle(color: Color(0xFFF4EEE1), fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            entry.value.$2,
                            style: const TextStyle(color: Color(0xFFB2BDD0), fontSize: 14, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ValidationPanel extends StatelessWidget {
  const _ValidationPanel();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _SectionLabel('VALIDATION STACK'),
            SizedBox(height: 14),
            _ValidationRow(label: 'flutter analyze', value: 'Static checks'),
            SizedBox(height: 12),
            _ValidationRow(label: 'flutter test', value: 'Widget shell'),
            SizedBox(height: 12),
            _ValidationRow(label: 'flutter build web', value: 'Portable proof target'),
            SizedBox(height: 12),
            _ValidationRow(label: 'PNG proof', value: 'README screenshots'),
          ],
        ),
      ),
    );
  }
}

class _ValidationRow extends StatelessWidget {
  const _ValidationRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF79C9FF), fontWeight: FontWeight.w700),
          ),
        ),
        Text(value, style: const TextStyle(color: Color(0xFFB2BDD0))),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF8BA4BC),
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.25,
      ),
    );
  }
}

class _ChipLabel extends StatelessWidget {
  const _ChipLabel({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const points = [0.18, 0.24, 0.22, 0.38, 0.44, 0.42, 0.63, 0.76];

    final linePaint = Paint()
      ..color = const Color(0xFF79C9FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x4479C9FF), Color(0x0079C9FF)],
      ).createShader(Offset.zero & size);

    final gridPaint = Paint()
      ..color = const Color(0xFF223B59)
      ..strokeWidth = 1;

    for (var i = 1; i < 4; i++) {
      final y = size.height * i / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final path = Path();
    final fillPath = Path();
    for (var i = 0; i < points.length; i++) {
      final x = size.width * i / (points.length - 1);
      final y = size.height - (size.height * points[i]);
      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }
    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);

    for (var i = 0; i < points.length; i++) {
      final x = size.width * i / (points.length - 1);
      final y = size.height - (size.height * points[i]);
      canvas.drawCircle(
        Offset(x, y),
        4,
        Paint()..color = const Color(0xFFF4EEE1),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
