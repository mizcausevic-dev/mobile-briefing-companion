import 'package:flutter/material.dart';

void main() {
  runApp(const BriefingCompanionApp());
}

class BriefingCompanionApp extends StatelessWidget {
  const BriefingCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    const canvas = Color(0xFF07111D);
    const surface = Color(0xFF102033);
    const card = Color(0xFF16283F);
    const accent = Color(0xFF84CBFF);
    const text = Color(0xFFF5EEDD);

    return MaterialApp(
      title: 'Mobile Briefing Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: canvas,
        colorScheme: const ColorScheme.dark(
          surface: surface,
          primary: accent,
          secondary: Color(0xFFF6BFD8),
          tertiary: Color(0xFFF4D17C),
          onSurface: text,
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            color: text,
            fontSize: 34,
            fontWeight: FontWeight.w700,
            height: 1.05,
          ),
          headlineSmall: TextStyle(
            color: text,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            color: text,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFFB1BED0),
            fontSize: 16,
            height: 1.45,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFB1BED0),
            fontSize: 14,
            height: 1.4,
          ),
        ),
        cardTheme: const CardThemeData(
          color: card,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            side: BorderSide(color: Color(0xFF294A70), width: 1.25),
          ),
        ),
      ),
      home: const BriefingCompanionHome(),
    );
  }
}

class BriefingCompanionHome extends StatefulWidget {
  const BriefingCompanionHome({super.key});

  @override
  State<BriefingCompanionHome> createState() => _BriefingCompanionHomeState();
}

class _BriefingCompanionHomeState extends State<BriefingCompanionHome> {
  int currentIndex = 0;

  static const navItems = [
    NavigationDestination(icon: Icon(Icons.dashboard_outlined), label: 'Briefing'),
    NavigationDestination(icon: Icon(Icons.alt_route), label: 'Signals'),
    NavigationDestination(icon: Icon(Icons.checklist_rtl), label: 'Actions'),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      const _BriefingPage(),
      const _SignalsPage(),
      const _ActionsPage(),
    ];

    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: pages[currentIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 76,
        selectedIndex: currentIndex,
        backgroundColor: const Color(0xFF102033),
        indicatorColor: const Color(0xFF223B59),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: navItems,
        onDestinationSelected: (value) => setState(() => currentIndex = value),
      ),
    );
  }
}

class _BriefingPage extends StatelessWidget {
  const _BriefingPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D3550),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  '16:30 board prep',
                  style: TextStyle(color: Color(0xFF84CBFF), fontWeight: FontWeight.w600),
                ),
              ),
              const Spacer(),
              const Icon(Icons.notifications_active_outlined, color: Color(0xFFF6BFD8)),
            ],
          ),
          const SizedBox(height: 26),
          Text('Mobile Briefing\nCompanion', style: theme.textTheme.displaySmall),
          const SizedBox(height: 16),
          Text(
            'Portable briefing packs for revenue, risk, AI, and operations leaders when they need the signal now, not after the next dashboard refresh.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          const _MetricRail(),
          const SizedBox(height: 24),
          const _HeroDecisionCard(),
          const SizedBox(height: 24),
          Text('Briefing packs', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 14),
          const _PackCarousel(),
        ],
      ),
    );
  }
}

class _SignalsPage extends StatelessWidget {
  const _SignalsPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
      children: [
        Text('Signal lanes', style: theme.textTheme.displaySmall),
        const SizedBox(height: 16),
        Text(
          'The feed keeps strategy portable: every lane explains what changed, why it matters, and which team should move next.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        const _SignalCard(
          tone: Color(0xFFF6BFD8),
          badge: 'Revenue',
          title: 'Pipeline pressure is drifting into the board deck.',
          body: 'Northstar coverage is down to 2.7x while expansion confidence holds. Keep new-logo spend disciplined.',
        ),
        const SizedBox(height: 16),
        const _SignalCard(
          tone: Color(0xFFF4D17C),
          badge: 'Risk',
          title: 'Legal hold scope widened in the finance lane.',
          body: 'Message deletion is paused for 1,882 artifacts until export backlog clears and residency checks are done.',
        ),
        const SizedBox(height: 16),
        const _SignalCard(
          tone: Color(0xFF93E3B1),
          badge: 'AI Ops',
          title: 'Model release is clear, but operator guidance needs a note.',
          body: 'Guardrail drift is stable. Add one executive footnote before sending the morning pack.',
        ),
      ],
    );
  }
}

class _ActionsPage extends StatelessWidget {
  const _ActionsPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
      children: [
        Text('Action queue', style: theme.textTheme.displaySmall),
        const SizedBox(height: 16),
        Text(
          'Everything here is briefing-ready: one owner, one deadline, one sentence about why it matters.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        const _ActionTile(
          priority: 'P1',
          title: 'Freeze finance deletion jobs',
          owner: 'Records Management',
          eta: 'Today',
        ),
        const SizedBox(height: 14),
        const _ActionTile(
          priority: 'P1',
          title: 'Update board note on pipeline compression',
          owner: 'Revenue Operations',
          eta: 'Before 4:30 PM',
        ),
        const SizedBox(height: 14),
        const _ActionTile(
          priority: 'P2',
          title: 'Attach model-risk note to mobile briefing pack',
          owner: 'AI Governance',
          eta: 'This sprint',
        ),
      ],
    );
  }
}

class _MetricRail extends StatelessWidget {
  const _MetricRail();

  @override
  Widget build(BuildContext context) {
    const items = [
      ('Packs', '6'),
      ('Signals', '41'),
      ('Escalations', '9'),
    ];

    return Row(
      children: items
          .map(
            (item) => Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.$1.toUpperCase(), style: const TextStyle(color: Color(0xFFB1BED0), fontSize: 12)),
                      const SizedBox(height: 10),
                      Text(item.$2, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Color(0xFFF5EEDD))),
                    ],
                  ),
                ),
              ),
            ),
          )
          .expand((widget) => [widget, const SizedBox(width: 12)])
          .toList()
        ..removeLast(),
    );
  }
}

class _HeroDecisionCard extends StatelessWidget {
  const _HeroDecisionCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('MOST IMPORTANT NEXT MOVE', style: TextStyle(color: Color(0xFFF6BFD8), fontSize: 13, letterSpacing: 1.2)),
            const SizedBox(height: 16),
            const Text(
              'Hold deletion in the finance lane until the legal-hold export gap is cleared.',
              style: TextStyle(color: Color(0xFFF5EEDD), fontSize: 28, fontWeight: FontWeight.w700, height: 1.05),
            ),
            const SizedBox(height: 14),
            const Text(
              'This app packages the board note, the owner, the risk, and the next action into one mobile-first decision surface.',
              style: TextStyle(color: Color(0xFFB1BED0), fontSize: 16, height: 1.45),
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _ChipLabel(text: 'Risk: Freeze', color: Color(0xFFFF9D8F)),
                _ChipLabel(text: 'Owner: Records', color: Color(0xFF84CBFF)),
                _ChipLabel(text: 'ETA: Today', color: Color(0xFFF4D17C)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PackCarousel extends StatelessWidget {
  const _PackCarousel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _PackCard(
            title: 'Board',
            subtitle: 'Revenue, risk, and AI summary',
            note: '3 pages · ready to send',
            tone: Color(0xFFF6BFD8),
          ),
          SizedBox(width: 14),
          _PackCard(
            title: 'Launch',
            subtitle: 'Release note and dependency watch',
            note: '2 blockers · 1 rollback note',
            tone: Color(0xFF84CBFF),
          ),
          SizedBox(width: 14),
          _PackCard(
            title: 'Governance',
            subtitle: 'Legal hold and retention posture',
            note: '2 freeze lanes · 1 watch lane',
            tone: Color(0xFFF4D17C),
          ),
        ],
      ),
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
                decoration: BoxDecoration(color: tone.withValues(alpha: 0.18), borderRadius: BorderRadius.circular(999)),
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
    required this.badge,
    required this.title,
    required this.body,
  });

  final Color tone;
  final String badge;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ChipLabel(text: badge, color: tone),
            const SizedBox(height: 18),
            Text(title, style: const TextStyle(fontSize: 28, color: Color(0xFFF5EEDD), fontWeight: FontWeight.w700, height: 1.05)),
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
  });

  final String priority;
  final String title;
  final String owner;
  final String eta;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: priority == 'P1' ? const Color(0x33FF9D8F) : const Color(0x3384CBFF),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: Text(priority, style: const TextStyle(color: Color(0xFFF5EEDD), fontWeight: FontWeight.w700)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 20, color: Color(0xFFF5EEDD), fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text('$owner · $eta', style: const TextStyle(color: Color(0xFFB1BED0), fontSize: 15)),
                ],
              ),
            ),
          ],
        ),
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
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: TextStyle(color: color, fontWeight: FontWeight.w700)),
    );
  }
}
