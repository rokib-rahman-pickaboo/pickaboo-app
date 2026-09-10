# 🎨 04: Dashboard Modernization & Design Token System

## 🎯 Objectives & Motivation
Prior to this mission, profile and account management pages used dated cards, non-standard shadows, and inconsistent font sizes. The objective was to implement a unified design token architecture and modernize **12 profile & dashboard pages** to match the aesthetics of [`Pickaboo-App-UI`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App-UI).

---

## 💎 Design Token Foundation

### 1. `NewAppColors` ([`app_colors.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/core/color/app_colors.dart))
Centralized semantic palette:
- `pickabooBlue`: `#00AEEF` (Brand primary, active buttons, links)
- `navy`: `#14304A` (Headings, card titles, high-contrast text)
- `pageBg`: `#F8FAFC` (Page scaffold background)
- `surfaceBlue`: `#EFF6FF` (Ice-blue background for info strips & tabs)
- `border`: `#E2E8F0` (Card & container borders)
- `cardBorder`: `#CBD5E1` (Defined component borders)
- `text`: `#1A1F27` (Body text)
- `muted`: `#70788A` (Subtitles & timestamps)
- `mutedLight`: `#94A3B8` (Placeholders & inactive icons)
- `green` / `greenBg`: `#16A34A` / `#DCFCE7` (In stock, success)
- `red` / `redBg`: `#F1483A` / `#FFECEB` (Discount tags, alerts)
- `amber` / `amberBg`: `#F59E0B` / `#FFF7F0` (Ratings, rewards)
- `blueBorder`: `#BFDBFE` (Ice-blue outlines)

### 2. `AppRadius` & `AppSpacing` ([`app_decorations.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/core/theme/app_decorations.dart))
- `AppRadius.cardRadius` = `12.0`
- `AppRadius.buttonRadius` = `8.0`
- `AppRadius.chipRadius` = `10.0`
- `AppRadius.badgeRadius` = `4.0`
- `AppSpacing.sameGroupItemSpacing` = `8.0` (Within-group margin)
- `AppSpacing.groupToGroupSpacing` = `12.0` (Section-to-section gap)

---

## 🛠️ Reusable Core Dashboard Components

| Widget | Path | Description |
|---|---|---|
| [`AppCard`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/app_card.dart) | `lib/.../widgets/common/app_card.dart` | Clean white surface card with `12.r` radius and subtle border |
| [`AppSearchBar`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/app_search_bar.dart) | `lib/.../widgets/common/app_search_bar.dart` | Rounded input with clear button & leading search icon |
| [`BackTitleTopAppBar`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/back_title_top_app_bar.dart) | `lib/.../widgets/common/back_title_top_app_bar.dart` | Universal back button + navy title top bar |
| [`TextOnlyTopAppBar`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/text_only_top_app_bar.dart) | `lib/.../widgets/common/text_only_top_app_bar.dart` | Clean header for root navigation tabs |
| [`UserImageWidget`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/user_image_widget.dart) | `lib/.../widgets/common/user_image_widget.dart` | User avatar with status indicator dot |
| [`AppMenuTile`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/app_menu_tile.dart) | `lib/.../widgets/dashboard/app_menu_tile.dart` | Modern menu item with trailing chevron |
| [`ProfileGridTile`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/profile_grid_tile.dart) | `lib/.../widgets/dashboard/profile_grid_tile.dart` | 2-column quick action dashboard grid tile |
| [`ProfileHeaderCard`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/profile_header_card.dart) | `lib/.../widgets/dashboard/profile_header_card.dart` | User avatar, tier badge, name, email & edit action |
| [`SupportEmptyState`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/knowledge_base_page/support_empty_state.dart) | `lib/.../widgets/knowledge_base_page/support_empty_state.dart` | Empty state illustration for support tickets |

---

## 📱 12 Redesigned Dashboard Pages

| Page | File Path | Key UI Upgrades |
|---|---|---|
| **Profile Dashboard** | [`dashboard_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/dashboard_page/dashboard_page.dart) | Modernized grid tiles, club point summary, and menu lists |
| **Account Info** | [`account_information_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/account_information_page/account_information_page.dart) | Clean form cards, date pickers, and avatar editor |
| **Order History** | [`order_list_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/order/order_list_page/order_list_page.dart) | Order cards with status pill badges (Processing, Delivered) |
| **Address Book** | [`address_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/address_page/address_page.dart) | Default address pill, edit/delete actions, and clean cards |
| **Club Points** | [`club_point_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/club_point_page/club_point_page.dart) | Hero point balance card and transaction history tiles |
| **Support Tickets** | [`ticket_main_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/ticket_main_page/ticket_main_page.dart) | Ticket status tags (Open, Pending, Resolved), ticket history |
| **Create Ticket** | [`create_ticket_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/create_ticket_page/create_ticket_page.dart) | Modern attachment uploader, dropdown selectors, text areas |
| **Referrals** | [`referral_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/referral_page/referral_page.dart) | Copy referral code card, social share buttons, earnings |
| **Saved Cards** | [`save_payment_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/save_payment_page/save_payment_page.dart) | Card issuer brand tags, delete card modal, add new card |
| **Settings** | [`setting_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/setting_page/setting_page.dart) | Push notification switch, biometric toggle, change password |
| **Knowledge Base** | [`knowledge_base_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/knowledge_base_page/knowledge_base_page.dart) | FAQ accordion cards and search input |
| **Contact Us** | [`contact_us_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/contact_us_page/contact_us_page.dart) | Hotline direct dial, email support, office location cards |

---

## 💡 Remarks & Architectural Suggestions

1. **Skeleton Loaders on Dashboard**:
   - *Current*: Standard circular progress indicators during API calls.
   - *Suggestion*: Implement shimmer skeleton loaders matching the card shapes for a smoother perceived load time.
2. **Haptic Feedback**:
   - *Suggestion*: Add light haptic feedback (`HapticFeedback.lightImpact()`) when copying referral codes or switching settings.
