# 02: Mobile Ergonomics, Navigation & Viewport Rules

Mobile UI is operated with thumbs on small vertical screens. Layout decisions must prioritize physical reachability, clean navigation, and real viewport behavior.

---

## 1. Thumb-Zone & Touch Targets

- **Primary Actions in the Lower 35%:** Place primary CTAs (Pay, Send, Confirm, Checkout) and frequent navigation in the bottom thumb-reach zone. Keep the top of the screen for titles, back buttons, and passive status.
- **Minimum Tap Targets:** Every interactive button, icon, or row must have at least a **44×44pt (iOS)** or **48×48dp (Android)** hit area. If a visual icon is `20px`, pad its clickable container or add `hitSlop`.
- **Spacing Between Targets:** Keep at least `8px` between adjacent interactive chips or buttons to prevent mis-taps.

---

## 2. Navigation Architecture

- **Tab Bar Purity & Clearance:** Bottom navigation tabs are strictly for switching top-level views (e.g., Home, Activity, Cards, Profile). Never cram immediate transaction triggers or modal popups into the bottom tab bar. Ensure `64–72px` height with proper bottom padding (`pb-1`) and `leading-none` so tab labels never clip at the bottom edge.
- **Contextual Flow Takeover:** When entering a focused multi-step flow (e.g., Transfer, Checkout, Ride Booking, Camera/QR scan), hide the bottom tab bar so the bottom thumb zone belongs entirely to the task's primary action button.
- **Header Economy:** Keep top headers compact (`48–56px` content height). Never stack 3–4 rows of headers, banners, and telemetry bars at the top of the screen, and avoid placing decorative colored logo square boxes on the left of every screen header.

---

## 3. Bottom Sheets & Overlays

- Prefer **bottom sheets** over centered desktop modal boxes for mobile selections, filters, and quick forms.
- Include a subtle drag handle (`36×4px` pill), dimmed backdrop (`rgba(0,0,0,0.4)`), rounded top corners (`24–28px`), and clear close/dismiss affordance (tap backdrop or swipe down).
- Never use browser-native `alert()`, `confirm()`, or `prompt()`. Use clean in-app toasts or confirmation bottom sheets.

---

## 4. Real Viewport & No Fake OS Chrome

- **No Fake Hardware Clutter:** Do not render fake iPhone status bars (`09:41`, battery, signal icons) or fake Dynamic Islands inside web prototypes unless specifically asked for a presentation mockup.
- **Fluid Mobile Container:** On mobile devices, fill `100%` width and `100dvh` height. On desktop screens, center a clean `max-width: 430px` viewport without thick, clunky fake phone bezels that clip modals or scrollbars.
- **Dynamic Safe Areas:** In native apps (React Native, Flutter, SwiftUI, Compose), always use system safe-area APIs (`useSafeAreaInsets`, `SafeArea`, `WindowInsets`) — never hardcode `paddingTop: 44` or `paddingBottom: 34`.
