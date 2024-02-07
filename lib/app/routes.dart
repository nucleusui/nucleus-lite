import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/ui_features/pages/bottom_sheet/add_to_cart_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/checkout/checkout_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/checkout/review_purchase_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/contents/content_post_detail.dart';
import 'package:nucleus_ui_app/ui_features/pages/contents/contents_detail.dart';
import 'package:nucleus_ui_app/ui_features/pages/coverages/discover_explore.dart';
import 'package:nucleus_ui_app/ui_features/pages/empty_state/empty_state_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/filter/filter_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/highlights/highlight_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/home/all_items_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/home/chat_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/home/inbox_pages_1.dart';
import 'package:nucleus_ui_app/ui_features/pages/home/main_home.dart';
import 'package:nucleus_ui_app/ui_features/pages/home/main_home_pages1.dart';
import 'package:nucleus_ui_app/ui_features/pages/launchscreen/get_started_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/location/location_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/map/map_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/menu_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/modal/confirmation_modal_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/modal/filter_modal_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/modal/info_modal_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/modal/sort_modal_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/onboarding/onboarding_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/personalization/personalization_first_page.dart';
import 'package:nucleus_ui_app/ui_features/pages/personalization/personalization_second_page.dart';
import 'package:nucleus_ui_app/ui_features/pages/product/product_detail_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/search/search_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/search/search_result.dart';
import 'package:nucleus_ui_app/ui_features/pages/settings/account_setting_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/settings/main_setting_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/settings/view_profile_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/signin_signup/signin_pages_by_email.dart';
import 'package:nucleus_ui_app/ui_features/pages/signin_signup/signin_pages_by_number.dart';
import 'package:nucleus_ui_app/ui_features/pages/subscription/subscription_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/verification/verification_pages.dart';
import 'package:nucleus_ui_app/ui_features/pages/video_call/video_call_pages.dart';

Map<String, Widget Function(BuildContext)> routes = {
  GetStartedPages.launshScreen: (context) => const GetStartedPages(),
  OnboardingPages.onBoardingPages: (context) => const OnboardingPages(),
  SigninPagesByEmail.signEmail: (context) => const SigninPagesByEmail(),
  SignInPagesByNumber.signInNumber: (context) => const SignInPagesByNumber(),
  VerificationPages.verificationPages: (context) => const VerificationPages(),
  PersonalizationFirstPage.personalizationFirstPage: (context) =>
      const PersonalizationFirstPage(),
  PersonalizationSecondPages.personalizationSecondPage: (context) =>
      const PersonalizationSecondPages(),
  ChooseLocationPages.locationPages: (context) => const ChooseLocationPages(),
  HomeAllItemsPages.homeAllItemsPages: (context) => const HomeAllItemsPages(),
  MainHomePages.mainHomePages: (context) => const MainHomePages(),
  InboxPages1.inboxPages: (context) => const InboxPages1(),
  HomePages1.homePages: (context) => const HomePages1(),
  DiscoverExplorePages.discoverPages: (context) => const DiscoverExplorePages(),
  ContentDetailPages.contentDetail: (context) => const ContentDetailPages(),
  HighLightsPages.highlightsPages: (context) => const HighLightsPages(),
  ContentDetailPostPages.contentPostDetail: (context) =>
      const ContentDetailPostPages(),
  SearchPages.searchPages: (context) => const SearchPages(),
  SearchResultPgaes.searchResult: (context) => const SearchResultPgaes(),
  AddToCartPages.addToCartPages: (context) => const AddToCartPages(),
  EmptyStatePages.emptyStatePages: (context) => const EmptyStatePages(),
  MapPages.mapPages: (context) => const MapPages(),
  FilterPages.filterPages: (context) => const FilterPages(),
  ReviewPurchasePages.reviewPurchasePages: (context) =>
      const ReviewPurchasePages(),
  CheckoutPages.checkoutPages: (context) => const CheckoutPages(),
  MainSettingPages.mainSettingPages: (context) => const MainSettingPages(),
  AccountSettingPages.accountSettingPages: (context) =>
      const AccountSettingPages(),
  ViewProfilePages.viewProfilePages: (context) => const ViewProfilePages(),
  InfoModalPages.infoModalPages: (context) => const InfoModalPages(),
  ConfirmationModalPages.confirmationModalPages: (context) =>
      const ConfirmationModalPages(),
  SortModalPages.sortModalPages: (context) => const SortModalPages(),
  FilterModalPages.filterModalPages: (context) => const FilterModalPages(),
  ChatPages.chatPages: (context) => const ChatPages(),
  VideoCallPages.videoCallPages: (context) => const VideoCallPages(),
  SubScriptionPages.subscriptionPages: (context) => const SubScriptionPages(),
  ProductDetailPages.productDetailPages: (context) =>
      const ProductDetailPages(),
  MenuHome.menuPagesAll: (context) => const MenuHome(),
};

String initialRoutes = MenuHome.menuPagesAll;

final List<String> halaman = [
  GetStartedPages.launshScreen,
  OnboardingPages.onBoardingPages,
  SigninPagesByEmail.signEmail,
  SignInPagesByNumber.signInNumber,
  VerificationPages.verificationPages,
  PersonalizationFirstPage.personalizationFirstPage,
  PersonalizationSecondPages.personalizationSecondPage,
  ChooseLocationPages.locationPages,
  HomeAllItemsPages.homeAllItemsPages,
  MainHomePages.mainHomePages,
  InboxPages1.inboxPages,
  HomePages1.homePages,
  DiscoverExplorePages.discoverPages,
  ContentDetailPages.contentDetail,
  HighLightsPages.highlightsPages,
  ContentDetailPostPages.contentPostDetail,
  SearchPages.searchPages,
  SearchResultPgaes.searchResult,
  AddToCartPages.addToCartPages,
  EmptyStatePages.emptyStatePages,
  MapPages.mapPages,
  FilterPages.filterPages,
  ReviewPurchasePages.reviewPurchasePages,
  CheckoutPages.checkoutPages,
  MainSettingPages.mainSettingPages,
  AccountSettingPages.accountSettingPages,
  ViewProfilePages.viewProfilePages,
  InfoModalPages.infoModalPages,
  ConfirmationModalPages.confirmationModalPages,
  SortModalPages.sortModalPages,
  FilterModalPages.filterModalPages,
  ChatPages.chatPages,
  VideoCallPages.videoCallPages,
  SubScriptionPages.subscriptionPages,
  ProductDetailPages.productDetailPages,
];

final List<Map<String, dynamic>> pages = [
  {
    "title": GetStartedPages.launshScreen,
    "page": const GetStartedPages(),
  },
  {
    "title": OnboardingPages.onBoardingPages,
    "page": const OnboardingPages(),
  },
  {
    "title": SignInPagesByNumber.signInNumber,
    "page": const SignInPagesByNumber()
  },
  {
    "title": SigninPagesByEmail.signEmail,
    "page": const SigninPagesByEmail(),
  },
  {
    "title": VerificationPages.verificationPages,
    "page": const VerificationPages()
  },
  {
    "title": PersonalizationFirstPage.personalizationFirstPage,
    "page": const PersonalizationFirstPage()
  },
  {
    "title": PersonalizationSecondPages.personalizationSecondPage,
    "page": const PersonalizationSecondPages()
  },
  {
    "title": ChooseLocationPages.locationPages,
    "page": const ChooseLocationPages()
  },
  {
    "title": HomeAllItemsPages.homeAllItemsPages,
    "page": const HomeAllItemsPages()
  },
  {
    "title": MainHomePages.mainHomePages,
    "page": const MainHomePages(),
  },
  {
    "title": InboxPages1.inboxPages,
    "page": const InboxPages1(),
  },
  {
    "title": HomePages1.homePages,
    "page": const HomePages1(),
  },
  {
    "title": DiscoverExplorePages.discoverPages,
    "page": const DiscoverExplorePages(),
  },
  {
    "title": ContentDetailPages.contentDetail,
    "page": const ContentDetailPages(),
  },
  {
    "title": HighLightsPages.highlightsPages,
    "page": const HighLightsPages(),
  },
  {
    "title": ContentDetailPostPages.contentPostDetail,
    "page": const ContentDetailPostPages(),
  },
  {
    "title": SearchPages.searchPages,
    "page": const SearchPages(),
  },
  {
    "title": SearchResultPgaes.searchResult,
    "page": const SearchResultPgaes(),
  },
  {
    "title": AddToCartPages.addToCartPages,
    "page": const AddToCartPages(),
  },
  {
    "title": EmptyStatePages.emptyStatePages,
    "page": const EmptyStatePages(),
  },
  {
    "title": MapPages.mapPages,
    "page": const MapPages(),
  },
  {
    "title": FilterPages.filterPages,
    "page": const FilterPages(),
  },
  {
    "title": ReviewPurchasePages.reviewPurchasePages,
    "page": const ReviewPurchasePages()
  },
  {
    "title": CheckoutPages.checkoutPages,
    "page": const CheckoutPages(),
  },
  {
    "title": MainSettingPages.mainSettingPages,
    "page": const MainSettingPages()
  },
  {
    "title": AccountSettingPages.accountSettingPages,
    "page": const AccountSettingPages(),
  },
  {
    "title": ViewProfilePages.viewProfilePages,
    "page": const ViewProfilePages(),
  },
  {
    "title": InfoModalPages.infoModalPages,
    "page": const InfoModalPages(),
  },
  {
    "title": ConfirmationModalPages.confirmationModalPages,
    "page": const ConfirmationModalPages(),
  },
  {
    "title": SortModalPages.sortModalPages,
    "page": const SortModalPages(),
  },
  {
    "title": FilterModalPages.filterModalPages,
    "page": const FilterModalPages(),
  },
  {
    "title": ChatPages.chatPages,
    "page": const ChatPages(),
  },
  {
    "title": VideoCallPages.videoCallPages,
    "page": const VideoCallPages(),
  },
  {
    "title": SubScriptionPages.subscriptionPages,
    "page": const SubScriptionPages()
  },
  {
    "title": ProductDetailPages.productDetailPages,
    "page": const ProductDetailPages()
  }
];
