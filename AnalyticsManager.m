//
//  AnalyticsManager.m
//  Trucker Path Pro
//
//  Created by Alexander V. Dolgov on 29/05/15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

#import "AnalyticsManager.h"
#import "FlurryProvider.h"
#import "FacebookEventsProvider.h"
//#import "AppsFlyerProvider.h"
//#import "GoogleAdWordsProvider.h"
#import "AFNetworkReachabilityManager.h"
#import "SharedController.h"

//=== Swift
#if TP_DEV_VERSION
#import "Trucker_Path_Pro_Dev-Swift.h"
#elif TP_TEST
#import "TruckerPathTests-Swift.h"
#else
#import "Trucker_Path_Pro-Swift.h"
#endif
//MARK: - codriver
NSString *Event_CoDriverPopup = @"Co-Driver Pop up";
NSString *Event_CoDriverSelection = @"Co-Driver Selection";
NSString *Event_CoDriverPageView = @"Co-Driver Page View";
NSString *Event_FleetSolutionView = @"Fleet Solution View";

// Main Page

NSString* EVENT_MAIN_PAGE_ACTION                    = @"Main Page Action";

// Screens

NSString* SCREEN_MAP_VIEW								= @"Map view";
NSString* SCREEN_LIST_VIEW								= @"List view";
NSString* SCREEN_TP_MAP_VIEW							= @"TP Map view";
NSString* SCREEN_TP_LIST_VIEW							= @"TP List view";
NSString* SCREEN_FAVOURITES								= @"Favorites";
NSString* SCREEN_MENU_VIEW								= @"Menu view";
NSString* SCREEN_INVITE_FRIENDS							= @"Invite friends";
NSString* SCREEN_RATE_APP								= @"Rate app";
NSString* SCREEN_ADD_NEW_PLACE							= @"Add new place";
NSString* SCREEN_TALK_TO_SUPPORT						= @"Talk to support";
NSString* SCREEN_PLACE_DETAILS							= @"Place detailes";
NSString* SCREEN_ACCOUNT								= @"Account";
NSString* SCREEN_PLACE_HISTORY_LIST						= @"Place history list";
NSString* SCREEN_PLACE_HISTORY_CALENDAR					= @"Place history calendar";
NSString* SCREEN_ALL_REVIEWS							= @"All reviews";
NSString* SCREEN_ADD_REVIEW								= @"Add review";
NSString* SCREEN_WRONG_INFO								= @"Wrong info";
NSString* SCREEN_ABOUT									= @"About";
NSString* SCREEN_ME                                     = @"Me";

// details on map
NSString* EVENT_VIEW_DETAILS_MAP_SHOW					= @"Details map";

// place wrong info
NSString* EVENT_VIEW_PLACE_REVIEW_SHOW					= @"Place edit open";

//=== Truck Posting
NSString* EVENT_POST_TRUCK								= @"Post Truck";
NSString* EVENT_DELETE_TRUCK							= @"Delete Truck";

NSString* EVENT_TRUCK_SETTING_PAGE_WITH_STANDARD        = @"Truck Settings Page With STANDARD";

NSString* EVENT_VIEW_ADD_PLACE_SHOW						= @"Add place";

NSString* EVENT_VIEW_MAP_WEIGH_STATIONS					= @"Map weigh stations";
NSString* EVENT_MAP_BUTTON_WEIGHSTATION_TAP_SHOW        = @"Map Button weigh station Tap show";
NSString* EVENT_MAP_BUTTON_WEIGHSTATION_TAP_HIDE        = @"Map Button weigh station Tap hide";

NSString* EVENT_MAP_BUTTON_FILTER_TAP_HIDE				= @"Map Button filter Tap hide";
NSString* EVENT_MAP_BUTTON_FILTER_TAP_SHOW				= @"Map Button filter Tap show";
NSString* EVENT_VIEW_MAP_NAVIGATE_TO_POINT				= @"Map navigate to point";
NSString* EVENT_VIEW_MENU_SETTINGS						= @"Menu settings";
NSString* EVENT_VIEW_MENU_INVITE						= @"Menu invite";
NSString* EVENT_VIEW_MENU_LOGIN_START					= @"User login (start)";
NSString* EVENT_VIEW_MENU_LOGIN_CANCEL					= @"User login (cancel)";
NSString* EVENT_VIEW_FIND_NEAR_BY_SHOW					= @"Find nearby";
NSString* EVENT_VIEW_LIST_SHOW							= @"List View";
NSString* EVENT_VIEW_SETTINGS_SHOW						= @"Settings";
NSString* EVENT_VIEW_SETTINGS_FACEBOOK					= @"Settings facebook";
NSString* EVENT_VIEW_SETTINGS_TWITTER					= @"Settings twitter";
NSString* EVENT_VIEW_SETTINGS_SHARE						= @"Settings share";


//===

NSString* EVENT_APP_START								= @"Application Start";
NSString* EVENT_APP_END									= @"Application End";
NSString* EVENT_IAD_ATTRIBUTION                         = @"iAd Attribution";
//=== Map events

NSString* EVENT_MAP_VIEW                                = @"Map view";
NSString* EVENT_MAP_BUTTON_PLACES_TAP_SHOW              = @"Map Button places Tap show";
NSString* EVENT_MAP_BUTTON_PLACES_TAP_HIDE              = @"Map Button places Tap hide";
NSString* EVENT_MAP_BUTTON_MENU_TAP_SHOW                = @"Map Button menu Tap show";
NSString* EVENT_MAP_BUTTON_MENU_TAP_HIDE                = @"Map Button menu Tap hide";
NSString* EVENT_MAP_BUTTON_ZOOMIN_TAP                   = @"Map Button zoom in Tap";
NSString* EVENT_MAP_BUTTON_ZOOMOUT_TAP                  = @"Map Button zoom out Tap";
NSString* EVENT_MAP_BUTTON_TYPE_TAP_STANDART            = @"Map Button type Tap standart";
NSString* EVENT_MAP_BUTTON_TYPE_TAP_HYBRID              = @"Map Button type Tap hybrid";
NSString* EVENT_MAP_BUTTON_TYPE_TAP_SATELLITE           = @"Map Button type Tap sattellite";///doesn't used
NSString* EVENT_MAP_FILTER_POINT_TAP_SHOW               = @"Map filter Point Tap show";
NSString* EVENT_MAP_FILTER_POINT_TAP_HIDE               = @"Map filter Point Tap hide";
NSString* EVENT_MAP_LONGPRESS                           = @"Map Long press";
NSString* EVENT_MAP_BUTTON_LOCATION_TAP                 = @"Map Button location Tap";
NSString* EVENT_MAP_POINT_PLACE_TAP                     = @"Map Interaction";
NSString* EVENT_MAP_TOOLTIP_WEIGHSTATION_VIEW           = @"Map Tooltip weigh station View";
NSString* EVENT_MAP_TOOLTIP_TRUCKSTOP_VIEW              = @"Map Tooltip truck stop View";
NSString* EVENT_MAP_TOOLTIP_PLACE_TAP                   = @"Map Tooltip place Tap";
NSString* EVENT_MAP_TOOLTIP_ROUTE_TAP                   = @"Map Tooltip route Tap";
NSString* EVENT_MAP_PINCHING_IN                         = @"Map Pinching in";
NSString* EVENT_MAP_PINCHING_OUT                        = @"Map Pinching out";
NSString* EVENT_MAP_SELECT_LAYER                        = @"Select Layer";
NSString* EVENT_MAIN_PAGE_MENU                          = @"Main Page Menu";
NSString* EVENT_REWARDS_ADS                             = @"Rewards Ads";
NSString* EVENT_REWARDS_ADS_POPUP                       = @"Rewards Ads Popup";
NSString* EVENT_ADDRESS_SHARE_RESULT                    = @"Address Share Result";
NSString *EVENT_TP_Push_Open = @"TP Push Open";
//=== Trip Planner events

NSString* EVENT_TP_VIEW                                 = @"TP View";
NSString* EVENT_TP_BUTTON_CANCEL_TAP                    = @"TP Button cancel Tap";
NSString* EVENT_TP_BUTTON_SHOW_TAP                      = @"TP Button show Tap";
NSString* EVENT_TP_BUTTON_HIDE_TAP                      = @"TP Button hide Tap";
NSString* EVENT_TP_BUTTON_ROUTE_TAP                     = @"TP Button route Tap";
NSString* EVENT_TP_BUTTON_PREVIEW_TAP                   = @"TP Button preview Tap";
NSString* EVENT_TP_BUTTON_CHOOSE_TAP                    = @"TP Button choose Tap";
NSString* EVENT_TP_TOOLTIP_ROUTE_TAP                    = @"TP Tooltip route Tap";
NSString* EVENT_TP_INPUT_AVOIDTOOLS_TAP_ON              = @"TP Input avoid tools Tap on";
NSString* EVENT_TP_INPUT_AVOIDTOOLS_TAP_OFF             = @"TP Input avoid tools Tap off";
NSString* EVENT_TP_BUTTON_WEIGHSTATION_TAP_SHOW         = @"TP Button weigh station Tap show";
NSString* EVENT_TP_BUTTON_WEIGHSTATION_TAP_HIDE         = @"TP Button weigh station Tap hide";
NSString* EVENT_TP_BUTTON_LOCATION_TAP                  = @"TP Button location Tap";
NSString* EVENT_TP_BUTTON_PLACES_TAP_SHOW               = @"TP Button places Tap show";
NSString* EVENT_TP_BUTTON_PLACES_TAP_HIDE               = @"TP Button places Tap Hide";
NSString* EVENT_TP_BUTTON_MENU_TAP_SHOW                 = @"TP Button menu Tap show";
NSString* EVENT_TP_BUTTON_MENU_TAP_HIDE                 = @"TP Button menu Tap hide";
NSString* EVENT_TP_BUTTON_TYPE_TAP_STANDART             = @"TP Button type Tap standart";
NSString* EVENT_TP_BUTTON_TYPE_TAP_HYBRID               = @"TP Button type Tap hybrid";
NSString* EVENT_TP_BUTTON_TYPE_TAP_SATELLITE            = @"TP Button type Tap satellite";
NSString* EVENT_TP_BUTTON_ZOOMIN_TAP                    = @"TP Button zoom in Tap";
NSString* EVENT_TP_BUTTON_ZOOMOUT_TAP                   = @"TP Button zoom out Tap";
NSString* EVENT_TP_INPUT_ORIGIN_TAP_LOCATION            = @"TP Input origin Tap location";
NSString* EVENT_TP_INPUT_DESTINATION_TAP_LOCATION       = @"TP Input destination Tap location";
NSString* EVENT_TP_ROUTE_VIEW                           = @"TP Route View";
NSString* EVENT_TP_INPUT_ORIGIN_TAP_FOCUS               = @"TP Input origin Tap focus";
NSString* EVENT_TP_INPUT_ORIGIN_TAP_CLEAR               = @"TP Input origin Tap clear";
NSString* EVENT_TP_INPUT_DESTINATION_TAP_FOCUS          = @"TP Input destination Tap focus";
NSString* EVENT_TP_INPUT_DESTINATION_TAP_CLEAR          = @"TP Input destination Tap clear";
NSString* EVENT_TP_TRIPPLAN								= @"Plan Trip";
NSString* EVENT_NEW_TRIP_PLAN                            = @"New Trip Planner";
NSString* EVENT_CHOOSE_ROUTE                            = @"Choose Route";
NSString* EVENT_Plan_Trip_Show_All                      =  @"Plan Trip-Show All";
NSString* EVENT_CHOOSE_ROUTE_PAGE_ACTION                =  @"Choose Route Page Action";
NSString* EVENT_ALTERNATIVE_ROUTE_ACTION                = @"Alternative Route Action";

//=== New Trip Planner events
NSString* EVENT_NEW_TRIP_PLANNER                        = @"New Trip Planner";
NSString* EVENT_NEW_TRIP_HISTORY_MANAGEMENT             = @"History Management";
NSString* EVENT_NEW_TRIP_NEW_SEARCH_PAGE                = @"New Search Page";
NSString* EVENT_NEW_TRIP_PLANNER_ADD_STOP_BY_SEARCH     = @"Add Stop By Search";
NSString* EVENT_NEW_TRIP_PLANNER_STOP_OPTION_CLICK      = @"Stop Options On Add Stop Page";
NSString* EVENT_NEW_TRIP_PLANNER_ADD_STOP_MAP_ACTION    = @"Map Action On Add Stop Page";
NSString* EVENT_NEW_TRIP_PLANNER_PAGE_BEFORE_CHOOSE     = @"Page Before Choose";
NSString* EVENT_NEW_TRIP_PLANNER_PLAN_TRIP_RESULT       = @"Plan Trip Result";
NSString* EVENT_NEW_TRIP_PLANNER_TRUCK_INFO             = @"Truck Info In New Trip Planner";
NSString* EVENT_NEW_TRIP_AUTOMATICROUTING               = @"OtrAutomaticRouting";
NSString* EVENT_NEW_TRIP_PLANNER_CHOOSE_PLAN            = @"Choose Plan";
NSString* EVENT_NEW_TRIP_PLANNER_CHOOSEN_PLAN_ON_MAP    = @"Chosen Plan On Map";
NSString* EVENT_WEATHER_ICON_SHOW                       = @"Weather icon show";
NSString* EVENT_WEATHER_INFO_ACTION                     = @"Weather info action";
NSString* EVENT_NEW_TRIP_PLANNER_CHOOSEN_PLAN_ACTION    = @"Chosen Plan On Map Action";
NSString* EVENT_NEW_TRIP_PLANNER_ADD_POI_TO_TRIP        = @"Add Poi To Trip";
NSString* EVENT_NEW_TRIP_PLANNER_ADD_OR_REMOVE_ON_MAP   = @"Add Or Remove Poi On Map";
NSString* EVENT_TEXT_DIRECTION_ACTION                   = @"Text direction action";

NSString* EVENT_GIFT_VIP5STAR_SHOW                      = @"Gift VIP 5 star popup show";
NSString* EVENT_GIFT_VIP5STAR_ACTIONS                   = @"Actions on Gift VIP 5 star popup";

NSString* EVENT_NAVIGATIONENDPAGEDISAPPEAR              = @"Navigation end page disapper";
NSString* EVENT_NAVIGATIONEXITCLICK                     = @"Navigation exit click";


NSString* EVENT_NEW_TRIP_PLANNER_EDIT_BUTTON_ON_MAP     = @"Edit Button On Map";
NSString* EVENT_NEW_TRIP_PLANNER_REPORT                 = @"Report Page";
NSString* EVENT_OTR_INVITATION_POPUP                    = @"OTR Invitation popup";
NSString* EVENT_ACCEPT_OTR_INVITATION                   = @"Accept Otr Invitation";
NSString* EVENT_OTR_IN_ME_PAGE                          = @"OTR In Me Page";
NSString* EVENT_NEW_TRIP_PLANNER_RESET_PLAN             = @"Reset Plan";
NSString* EVENT_OTR_CREATE_TRIP                         = @"Create Trip";
NSString* EVENT_NEW_TRIP_PLANNER_CLICK                  = @"New Trip Planner Click";
NSString* EVENT_NEW_TRIP_NAVIGATION_ON_MAP              = @"Navigation Button On Map";
NSString* EVENT_NEW_TRIP_DISCLAIMERS_POPUP              = @"Disclaimers Popup";
NSString* EVENT_TBT_ABNORMAL_POPUP                      = @"TBT Abnormal Popup";
NSString* EVENT_NEW_TRIP_HOS_POPUP                      = @"Hos Popup";
NSString* EVENT_NEW_TRIP_HOS_POPUP_OPEN                 = @"Hos Popup Open";
NSString* EVENT_NEW_TRIP_HOS_SETTING                    = @"Hos Setting";
NSString* EVENT_NEW_TRIP_HOS_SWITCH                     = @"Hos Switch";
NSString* EVENT_NEW_TRIP_HOS_CONFIRMATION               = @"Hos Confirmation";
NSString* EVENT_NEW_TRIP_ADD_HOS_STOP                   = @"Add Hos Stop";
NSString* EVENT_NEW_TRIP_HOS_MAP_ACTION                 = @"Hos Map Action";
NSString* EVENT_NEW_TRIP_HOS_RISK                       = @"Hos Risk";
NSString* EVENT_NEW_TRIP_TIME_EXCAPES_IN_CHOSEN_PLAN_PAGE = @"Time Escapes In Chosen Plan Page";
NSString* EVENT_NEXTSTOPCARD_BEFORE_START               = @"Next Stop Card Before Start";
NSString* EVENT_FOLLOWMODE_STARTED                      = @"Follw Mode Started";
NSString* EVENT_PLAN_RESULT_FROM_CURRENT_TO_NEXTSTOP    = @"Plan Result From Current To Next Stop";
NSString* EVENT_THE_BEHAVIOR_AFTER_START                = @"The Behavior After Start";
NSString* EVENT_ARRIVED_POPUP_IN_OTR_FOLLOW_MODE        = @"Arrived Popup In OTR Follow Mode";
NSString* EVENT_ADD_STOP_ACTION                         = @"Add Stop Action";
NSString* EVENT_ADD_TO_TRIP_MAIN_PAGE_ACTION            = @"Add To Trip Main Page Action";
NSString* EVENT_HOS_VIOLATION_ALERT_VIEW                = @"HOS Violation Alert View";
NSString* EVENT_HOS_VIOLATION_ALERT_ACTION              = @"HOS Violation Alert Action";
NSString* EVENT_TIMEZONE_REQUEST                        = @"Time Zone Request";
NSString* EVENT_OTR_GO_HERE                             = @"Go here Popup Action";
NSString* EVENT_OTR_MAP_ACTION                          = @"OTR Map Action";
NSString* EVENT_POI_ACTION                              = @"POI Action";
NSString* EVENT_MAPVERSION_STATUS                       = @"Update Here Map When Error";
NSString* EVENT_RATENAVIGATIONVIEW                      = @"Rate Navigation View";
NSString* EVENT_RATENAVIGATIONACTION                    = @"Rate Navigation Action";
NSString* EVENT_REPORTNAVIGATIONACTION                  = @"Report Navigation Action";
NSString* EVENT_CHANGEADDRESS                           = @"Change Address";
NSString* EVENT_CHANGEACTUALTRUCKSETTINGS               = @"Change Actual Truck Settings";
NSString* EVENT_OTRCHOOSEROUTEPAGEACTION                = @"OTR Choose Route Page Action";
NSString *EVENT_REFRESHROUTERESULT                       = @"Refresh route result";
NSString* EVENT_FUELPLANONMAINPAGESHOW                  = @"Fuel Plan on main page show";
NSString* EVENT_ACTIONONFUELPLANINMAINPAGE                = @"Actions on Fuel Plan on main page";
NSString* EVENT_EXITINFOAHEADSHOW                       = @"Exit info ahead show";
NSString* EVENT_EXITINFOCLICK                           = @"Exit info click";
NSString* EVENT_TRIP_CARD_CLICK                         = @"Trip card click";


NSString* EVENT_SETTINGS_PAGE_IN_OTR                    = @"Settings Page In OTR";
NSString* EVENT_TRIP_PLANNER_ROUTE_OPTION_ACTION_RESULT = @"Trip Planner–Route Option Quick Entry Action Result";

NSString* EVENT_TAP_TRIP_PLANNER_TEXT_VERSION_ICON      = @"Tap Trip Planner Text Version icon";
NSString* EVENT_ACTION_ON_TEXT_VERSION                  = @"Actions on Trip Planner Text Version";
NSString* EVENT_ADD_STOP_IN_TEXT_VERSION                = @"Add Stop in text version";
NSString* EVENT_CLICK_CONFIRM_ON_STOP_CARD              = @"Click Confirm on Stop Card";
NSString* EVENT_CLICK_STOP_CARD                         = @"Click Stop Card";
NSString* EVENT_CLICK_I_ARRIVE_BUTTON_ON_TEXT_VERSION   = @"Click I Arrived Button in text version";
NSString* EVENT_CHANGES_IN_EDIT_PAGE                    = @"Changes in Edit Page";
NSString* EVENT_DELETE_STOP_IN_EDIT_PAGE                = @"Delete Stop in Edit Page";
NSString* EVENT_MOVE_STOPS_IN_EDIT_PAGE                 = @"Move Stops in Edit Page";

NSString* EVENT_DATA_WHEN_APP_GO_TO_BACKGROUND          = @"Data When App Go To Background";
NSString* EVENT_DATA_WHEN_APP_GO_BACK_TO_FRONT_DESK     = @"Data When App Go Back To Front Desk";


//=== Menu events

NSString* EVENT_MENU_VIEW                               = @"Menu View";
NSString* EVENT_MENU_ITEM_MAP_TAP						= @"Menu Item map Tap";
NSString* EVENT_MENU_ITEM_TRIPPLANNER_TAP               = @"Menu Item trip planner Tap";
NSString* EVENT_MENU_ITEM_FAVORITES_TAP                 = @"Menu Item favorites Tap";
NSString* EVENT_MENU_ITEM_SEARCH_TAP					= @"Menu Item search Tap";
NSString* EVENT_MENU_ITEM_TRUCKLOADS_TAP                = @"Menu Item truck loads Tap";
NSString* EVENT_MENU_ELECTRONIC_LOGBOOK_TAP             = @"Menu Item Electronic Logbook Tap";
NSString* EVENT_MENU_ITEM_LIKEUS_TAP                    = @"Menu Item like us Tap";
NSString* EVENT_MENU_ITEM_PROFILE_TAP                   = @"Menu Item profile Tap";
NSString* EVENT_MENU_ITEM_FEEDBACK_TAP                  = @"Menu Item feedback Tap";
NSString* EVENT_MENU_LIKEUS_ITEM_INVITEFRIENDS_TAP      = @"Menu like us Item invite friends Tap";
NSString* EVENT_MENU_FEEDBACK_ITEM_FAQ_TAP              = @"Menu feedback Item faq Tap";
NSString* EVENT_MENU_FEEDBACK_ITEM_ADDNEWPLACE_TAP      = @"Menu feedback Item add new place Tap";
NSString* EVENT_MENU_FEEDBACK_ITEM_TALKTOSUPPORT_TAP    = @"Menu feedback Item talk to support Tap";
NSString* EVENT_MENU_INPUT_SEARCH_TAP                   = @"Menu Input search Tap";
NSString* EVENT_MENU_INPUT_SEARCH_TAP_CLEAR             = @"Menu Input search Tap clear";
NSString* EVENT_MENU_INPUT_SEARCH_TAP_CANCEL            = @"Menu Input search Tap cancel";
NSString* EVENT_MENU_INPUT_SEARCH_TAP_SUGGEST           = @"Menu Input search Tap suggest";
NSString* EVENT_MENU_KEYBOARD_ENTER                     = @"Menu Keyboard Enter";
NSString* EVENT_SEARCH									= @"Search";

//=== Weigh Stations events

NSString* EVENT_WS_VIEW                                 = @"WS View";
NSString* EVENT_WS_BUTTON_LOCATION_TAP                  = @"WS Button location Tap ";
NSString* EVENT_WS_BUTTON_PLACES_TAP_SHOW               = @"WS Button places Tap show";
NSString* EVENT_WS_BUTTON_PLACES_TAP_HIDE               = @"WS Button places Tap hide";
NSString* EVENT_WS_BUTTON_MENU_TAP_SHOW                 = @"WS Button menu Tap show";
NSString* EVENT_WS_BUTTON_MENU_TAP_HIDE                 = @"WS Button menu Tap hide";
NSString* EVENT_WS_BUTTON_TYPE_TAP_STANDART             = @"WS Button type Tap standart";
NSString* EVENT_WS_BUTTON_TYPE_TAP_HYBRID               = @"WS Button type Tap hybrid";
NSString* EVENT_WS_BUTTON_TYPE_TAP_SATELLITE            = @"WS Button type Tap sattellite";
NSString* EVENT_WS_BUTTON_ZOOMIN_TAP					= @"WS Button zoom in Tap";
NSString* EVENT_WS_BUTTON_ZOOMOUT_TAP                   = @"WS Button zoom out Tap";
NSString* EVENT_WS_TOOLTIP_ROUTE_TAP                    = @"WS Tooltip route Tap";
NSString* EVENT_WS_IN_APP_MESSAFE_SHOW                  = @"Weigh Station In App Message Show";
NSString* EVENT_WS_IN_APP_MESSAFE_CLICK                 = @"Weigh Station In App Message Click";
NSString* EVENT_WS_PUSH_CLICK                           = @"Weigh Station Push Click";
NSString* EVENT_WS_FOLLOW_SETTING                           = @"Weigh Station Follow Setting";
//NSString* EVENT_WS_POINT_ME_TAP                         = @"WS Point me Tap"; // Doesn't use with Google Maps
NSString* EVENT_WS_POINT_PLACE_TAP                      = @"WS Point place Tap";
NSString* EVENT_WS_TOOLTIP_PLACE_TAP                    = @"WS Tooltip place Tap";
NSString* EVENT_WS_LONGPRESS                            = @"WS Long press";
NSString* EVENT_WS_PINCHING_IN                          = @"WS Pinching in";
NSString* EVENT_WS_PINCHING_OUT                         = @"WS Pinching out";

// Loading Dock
NSString* EVENT_LD_POPUP_RESULT                         = @"Loading Dock Popup Result";
NSString* EVENT_LD_UPDATE_RESULT                        = @"Loading Dock Update Result";
NSString* EVENT_LD_SHARING_FINISH_PAGE_RESULT           = @"Sharing Finish Page Result";

//=== Places events

NSString* EVENT_PLACES_VIEW                             = @"Places View";
NSString* EVENT_PLACES_INPUT_SEARCH_TAP                 = @"Places Input search Tap";
NSString* EVENT_PLACES_INPUT_SEARCH_TAP_CLEAR           = @"Places Input search Tap clear";
NSString* EVENT_PLACES_INPUT_SEARCH_TAP_CANCEL          = @"Places Input search Tap cancel";
NSString* EVENT_PLACES_INPUT_SEARCH_TAP_SUGGEST         = @"Places Input search Tap suggest";
NSString* EVENT_PLACES_KEYBOARD_ENTER                   = @"Places Keyboard Enter";
NSString* EVENT_PLACES_ITEM_TAP                         = @"Places Item Tap";
NSString* EVENT_PLACES_Add_New_Place_Result             = @"Add New Place Result";
NSString* EVENT_PLACES_Incorrect_Info_Result             = @"Incorrect Info Result";

//=== InviteFriends events
NSString* EVENT_INVITE_FRIENDS_RESULT                           = @"Invite Friends Result";
//=== Talk to support events
NSString* EVENT_TALK_TO_SUPPORT_SEND                        = @"Talk To Support Send";

NSString* EVENT_IF_VIEW                                 = @"IF View";

//=== Rate events

NSString* EVENT_RATE_VIEW                               = @"Rate View";
NSString* EVENT_RATE_BUTTON_NOTNOW_TAP                  = @"Rate Button not now Tap";
NSString* EVENT_RATE_BUTTON_RATE_TAP                    = @"Rate Button rate Tap";

//=== Updated Profile Events
NSString* EVENT_AUTHENTICATION_SCREEN_RESULT			= @"Authentication Screen Result";
NSString* EVENT_PROFILE_LOGOUT							= @"Log Out";
NSString* EVENT_PROFILE_SCREEN_RESULT					= @"Profile Screen Result";
NSString* EVENT_ADDITIONAL_PROFILE_INFO_RESULT			= @"Additional Profile Info Result";
NSString* EVENT_PROFILE_PAGE                            = @"Profile Page";

//=== Details events

NSString* EVENT_DETAILS_VIEW                            = @"Place View";
NSString* EVENT_DETAILS_WEIGHSTATION_SCREEN_VIEW        = @"Details weigh station Screen View";
NSString* EVENT_DETAILS_TRUCKSTOP_SCREEN_VIEW           = @"Details truck stop Screen View";
NSString* EVENT_DETAILS_FUEL_SCREEN_VIEW                = @"Details fuel Screen View";
NSString* EVENT_DETAILS_ITEM_SHOWONTHEMAP_TAP           = @"Details Item show on the map Tap";
NSString* EVENT_DETAILS_ITEM_DIRECTIONS_TAP             = @"Details Item directions Tap";
NSString* EVENT_DETAILS_MENU_DIRECTIONS_TAP_CANCEL      = @"Details Menu directions Tap cancel";
NSString* EVENT_DIRECTION_BY_OTHER_APP                  = @"Navigate Using Other Apps Result";
NSString* EVENT_DETAILS_MENU_DIRECTIONS_TAP_GOOGLE      = @"Details Menu directions Tap google";
NSString* EVENT_DETAILS_MENU_DIRECTIONS_TAP_APPLE       = @"Details Menu directions Tap apple";
NSString* EVENT_DETAILS_MENU_DIRECTIONS_TAP_WAZE        = @"Details Menu directions Tap waze";
NSString* EVENT_DETAILS_ITEM_REMOVEFROMFAVORITES_TAP    = @"Details Item remove from favorites Tap";
NSString* EVENT_DETAILS_ITEM_FUELPRICE_TAP              = @"Details Item fuel price Tap";
NSString* EVENT_DETAILS_ITEM_WEATHER_TAP                = @"Details Item weather Tap";
NSString* EVENT_DETAILS_ITEM_FAX_TAP                    = @"Details Item fax Tap";
NSString* EVENT_DETAILS_ITEM_WEBSITE_TAP                = @"Details Item web site Tap";
NSString* EVENT_DETAILS_ITEM_PHONE_TAP                  = @"Details Item phone Tap";
NSString* EVENT_DETAILS_ITEM_NEARBY_RESTAURANTS_TAP		= @"Details Button nearby restaurants TAP";
NSString* EVENT_DETAILS_ITEM_RESTAURANTS_TAP            = @"Details Item restaurants Tap";
NSString* EVENT_DETAILS_ITEM_LOCATION_TAP               = @"Details Item location Tap";
NSString* EVENT_DETAILS_ITEM_REVIEW_ADD                 = @"Details Item review Add";
NSString* EVENT_DETAILS_BUTTON_BACK_TAP                 = @"Details Button back Tap";
NSString* EVENT_DETAILS_BUTTON_WRONGINFO_TAP            = @"Details Button wrong info Tap";
NSString* EVENT_DETAILS_STATUS_REPORT                   = @"Details Status Report";
NSString* EVENT_DETAILS_BUTTON_HISTORY_TAP              = @"Details Button history Tap";
NSString* EVENT_DETAILS_HISTORY_BUTTON_LIST_TAP         = @"Details history Button list Tap";
NSString* EVENT_DETAILS_HISTORY_BUTTON_CALENDAR_TAP     = @"Details history Button calendar Tap";
NSString* EVENT_DETAILS_HISTORY_BUTTON_CANCEL_TAP       = @"Details history Button cancel Tap";
NSString* EVENT_DETAILS_WEIGHSTATION_STATUS_REPORT      = @"Details weigh station Status Report";
NSString* EVENT_DETAILS_REVIEW_BUTTON_MENU_TAP          = @"Details review Button menu Tap";
NSString* EVENT_PLACE_DIRECTIONS_RESULT                 = @"Place Directions Result";
NSString* EVENT_RECOMMENDATION_CARD_IMPRESSIONS         = @"Recommendation Card Impressions";
NSString* EVENT_RECOMMENDATION_CARD_CLICKS              = @"Recommendation Card Clicks";

//=== Traffic events
NSString* EVENT_CHAECK_CONGESTION_ACTION                = @"Check congestion action";
NSString* EVENT_AVOID_RESULT                            = @"Avoid result";
NSString* EVENT_WEIGH_STATION_CARD_SHOW                 = @"Weigh station card show";
NSString* EVENT_WEIGH_STATION_AVOID_PIN_SHOW            = @"Weigh station avoid pin show";

//=== Truckloads events

NSString* EVENT_TL_VIEW                                 = @"TL View";
NSString* EVENT_TL_TRUCKLOADS							= @"Truckloads";
NSString* EVENT_TLPROMO_VIEW                            = @"TLPromo View";
NSString* EVENT_TLPROMO_BUTTON_CLOSE_TAP                = @"TLPromo Button close Tap";
NSString* EVENT_TLPROMO_SCREEN1_VIEW                    = @"TLPromo screen 1 View";
NSString* EVENT_TLPROMO_SCREEN2_VIEW                    = @"TLPromo screen 2 View";
NSString* EVENT_TLPROMO_SCREEN3_VIEW                    = @"TLPromo screen 3 View";
NSString* EVENT_TLPROMO_SCREEN4_VIEW                    = @"TLPromo screen 4 View";
NSString* EVENT_TLPROMO_SCREEN4_BUTTON_INVITE_TAP       = @"TLPromo screen 4 Button invite Tap";
NSString* EVENT_TLPROMO_SCREEN4_BUTTON_CLOSE_TAP        = @"TLPromo screen 4 Button close Tap";

//=== Electronic logbook events
NSString* EVENT_ELD_INVITE                              = @"Trucker Path ELD App Open";

//=== GEO Fencing

NSString* EVENT_GEOFENCING_VIEW                         = @"GEOFencing View";
NSString* EVENT_GEOFENCING_STATUS_REPORT                = @"GEOFencing Status Report";
NSString* EVENT_GEOFENCING_TRUCKSTOP_STATUS_REPORT      = @"GEOFencing truck stop Status Report";
NSString* EVENT_GEOFENCING_WEIGHSTATION_STATUS_REPORT   = @"GEOFencing weigh station Status Report";

//===
NSString* EVENT_CONTRIBUTE_INFORMATION					= @"Contribute Information";
NSString* EVENT_WS_CONTRIBUTE_INFORMATION               = @"WS Contribute Information";
NSString* EVENT_SHARE_ATTEMPT							= @"Share Attempt";

//===

NSString* EVENT_VIEW_HISTORY							= @"View history";

//=== News events

NSString* EVENT_INDUSTRY_NEWS							= @"Industry News";

//=== Truck Posting events
NSString* EVENT_TP_PROMO								= @"Truck Posting Promo";
NSString* EVENT_INCENTIVE_TP_PROMO						= @"25 Dollars Truck Posting Promo";

//=== Job Search
NSString* EVENT_SEARCH_JOB_SCREEN_VIEW					= @"Search Job Screen View";
NSString* EVENT_SEARCH_JOB_EXIT							= @"Search Job Exit";

//=== Roadside Assistance
NSString* EVENT_ROADSIDE_ASSISTANCE_SCREEN_VIEW			 = @"Roadside Assistance Screen View";
NSString* EVENT_ROADSIDE_ASSISTANCE_CALL_TO_APPLY		 = @"Roadside Assistance Call To Apply";
NSString* EVENT_ROADSIDE_ASSISTANCE_BUY_ONLINE			 = @"Roadside Assistance Buy Online";
NSString* EVENT_ROADSIDE_ASSISTANCE_CALL_TO_HELP		 = @"Roadside Assistance Call To Help";


NSString* EVENT_ROADSIDE_ASSISTANCE_SIGNUP				= @"Roadside assistance signup";

//===
NSString* EVENT_RESERVE_PARKING							= @"Reserve Parking";

//=== Banners
NSString* EVENT_BANNER_CLICK							= @"Banner Click";
NSString* EVENT_BANNER_IMPRESSION						= @"Banner Impression";
NSString* EVENT_BANNER_IMPRESSION_NEW                   = @"Banner impression new";
NSString* EVENT_BANNER_LOADED_SUCCEESS                   = @"Banner loaded success";
NSString* EVENT_BANNER_IMPRESSION_FAILED                = @"Banner impression failed";
NSString* EVENT_BANNER_IMPRESSION_VERSION_B             = @"Banner Impression Version B";
//splash
NSString* EVENT_SPLASH_CLICK                            = @"Splash Click";
NSString* EVENT_SPLASH_REQUEST                          = @"Splash request";
NSString* EVENT_SPLASH_IMPRESSION                       = @"Splash impression";
NSString* EVENT_AD_CLOSE                                = @"Ad Close";

NSString* EVENT_BANNER_IMPRESSION_LINK_SENT             = @"Impression Link Sent";


//=== Membership
NSString* EVENT_CHOOSE_MEMBERSHIP_TYPE                  = @"Choose Membership Type";

//=== Lead Form
NSString* EVENT_LEAD_FORM_IMPRESSION                    = @"Lead Form Impression";
NSString* EVENT_LEAD_FORM_CLICK_BUTTON_RESULT           = @"Lead Form Click Button Result";
NSString* EVENT_LEAD_FORM_QUIT                          = @"Lead Form Quit";

//=== Onboarding
NSString* EVENT_ONBOARDING_TRUCK_STOP_DISPLAY			= @"Onboarding Truck Stop Display";
NSString* EVENT_ENABLE_LOCATION_RESULT					= @"Enable Location Result";

//=== New Filter
NSString* EVENT_PLACE_FILTER_RESULT						= @"Place Filter Result";

//=== Push Notification
NSString* EVENT_ENABLE_NOTIFICATION_RESULT = @"Enable Notification Result";

//=== New Version Event
NSString* EVENT_SPLASH_AD_SKIP                           = @"Splash Screen Impression";
NSString* EVENT_SPLASH_AD_IMPRESSION                     = @"Splash Ad Impression";
NSString* EVENT_ROADSIDE_ASSISTANCE_GOOD_YEAR_CALL_CLICK = @"Call Click";
NSString* EVENT_ROADSIDE_ASSISTANCE_BANNER_IMPRESSION    = @"Sidebar Ads Impression";
NSString* EVENT_ROADSIDE_ASSISTANCE_BANNER_CLICKED       = @"Sidebar Ads Click";
NSString* EVENT_ELECTRONIC_LOGBOOK_TAP                   = @"Electronic Logbook";

// Place Search Event
NSString* EVENT_SEARCH_PLACE_PAGE_ACTION                          = @"Search Place Page Action";
NSString* EVENT_SEARCH_PAGE_AUTO_COMPLETE_ACTION                          = @"Trip Planner–Search Page Auto-Complete Action Result";

// Nearby Events
NSString* EVENT_POI_CATEGORY_CHOOSE = @"POI Category choose";
NSString* EVENT_SORT_BY_RESULT = @"Sort by result";
NSString* EVENT_DISTANCE_RESULT = @"Distance result";
NSString* EVENT_FACILITIES_RESULT = @"Facilities result";
//NSString* EVENT_SEARCH_POI = @"Search POI";

//=== Service view Event
NSString* EVENT_SERVICE_PAGE_ACTION                         = @"Service Page Action";

//admob config
NSString *MopubAdUnitIdDev                                  = @"0ac59b0996d947309c33f59d6676399f";
NSString *MopubAdUnitId                                     = @"10ddd32ea0974f68b68da24e2adba7de";
NSString *SmaatoPublisherIdDev                              = @"1100045219";
NSString *SmaatoPublisherId                                 = @"1100045219";
//=== Update Status Event
NSString *EVENT_PARKING_STATUS_SUBMIT                       = @"Parking status submit";
NSString *EVENT_PARKING_STATUS_DISPLAY                      = @"Parking status display";
NSString *EVENT_PARKING_STATUS_CANCEL                       = @"Cancel Parking Information";
NSString *EVENT_PARKING_PREDICTION_VIEW                     = @"Parking Prediction View";
NSString *EVENT_PARKING_PREDICTION_CHANGE              = @"Parking Prediction Change";
NSString *EVENT_PARKING_PREDICTION_INFO_VIEW           = @"Parking Prediction Info View";
NSString *EVENT_PARKING_PREDICTION_LEAVE_FEEDBACK = @"Parking Prediction Leave Feedback";
NSString *EVENT_WEIGH_STATION_SUBMIT                       = @"Weigh station status submit";
NSString *EVENT_WEIGH_STATION_DISPLAY                      = @"Weigh station submition display";
NSString *EVENT_WEIGH_STATION_CANCEL                       = @"Cancel weigh station submition";
NSString *EVENT_PARKING_INSIGHT_VIEW                       = @"Parking Insight View";
NSString *EVENT_WEIGHT_STATION_INSIGHT_VIEW                = @"Weigh Station Insight View";
NSString *EVENT_PARKING_INSIGHT_PEAK_HOUR                  = @"Parking Insight Peak Hour";
NSString *EVENT_WEIGHT_STATION_PEAK_HOUR                   = @"Weigh Station Peak Hour";
NSString *EVENT_PARKING_INSIGHT_RUNTIME                    = @"Parking Insight Run Time";
NSString *EVENT_WEIGHT_STATION_RUNTIME                     = @"Weigh Station Peak Hour";
NSString *EVENT_QUICK_VIEW_RESULT                          = @"Quick View Result";
NSString *EVENT_WEIGH_STATION_PUSH_CLICK                   = @"Weigh Station Push Click";
NSString *EVENT_WEIGH_STATION_IN_APP_CLICK                 = @"Weigh Station In App Message Click";
NSString *EVENT_WEIGH_STATION_IN_APP_SHOW                  = @"Weigh Station In App Message Show";
NSString *EVENT_WEIGH_STATION_FOLLOW_POPUP_VIEW            = @"Weigh Station Follow Popup View";
NSString *EVENT_WEIGH_STATION_FOLLOW_POPUP_ACTION            = @"Weigh Station Follow Popup Action";



//=== Choose Route Event
NSString *EVENT_TRIPPLANNER_NAVIGATION_START               = @"Navigation Start";
NSString *EVENT_TRIPPLANNER_NAVIGATION_END                 = @"Navigation End";
NSString *EVENT_RATE_DESTINATION_ACTION                    = @"Rate destination action";
NSString *EVENT_RATE_DESTINATION_DETAIL                    = @"Rate Destination Detail";
NSString *EVENT_TRIPPLANNER_NAVIGATION_RESULT              = @"Navigation Result";
NSString *EVENT_TRIPPLANNER_ACTIONS_NAVIGATION_POI_REMINDER             = @"Actions on navigation POI reminder";
NSString *EVENT_TRIPPLANNER_NAVIGATION_POI_REMINDER_SHOW             = @"Navigation POI reminder show";

NSString *EVENT_ROUTING_PAGE_ACTION                        = @"Routing Page Action";
NSString *EVENT_TRIPPLANNER_FEEDBACK                       = @"Feedback";
NSString *EVENT_Report_Navigation_Detail                   = @"Report Navigation Detail";
NSString *EVENT_TRIPPLANNER_EDITTRUCKPARAMETERS            = @"Edit Truck Parameters";
NSString *EVENT_RECENT_TRIPS                               = @"Recent Trips";
NSString *EVENT_MEMBER_CENTER                              = @"Member center";

//=== Community
NSString *EVENT_COMMUNITY_SEARCH_RESULT                    = @"Forum Search Result";
NSString *EVENT_COMMUNITY_CREAT_COMMENT                    = @"Forum-Create a Comment";
NSString *EVENT_COMMUNITY_POSTDETAIL_PAGEACTION            = @"Forum-Post Detail Page Action";
NSString *EVENT_COMMUNITY_CHECK_POST                       = @"Forum-Check Post";
NSString *EVENT_COMMUNITY_Create_a_Post_Result             = @"Forum-Create a Post Result";
NSString *EVENT_Forum_Cancel_Creating_a_Post               = @"Forum-Cancel Creating a Post";
NSString *EVENT_COMMUNITY_Create_a_Used_Truck_Post_Result  = @"Forum-Create a Used Truck Post Result";
NSString *EVENT_COMMUNITY_Create_a_Job_Post_Result         = @"Forum-Create a Job Post Result";
NSString *EVENT_COMMUNITY_Create_a_Link_Post_Result        = @"Forum-Create a Link Result";
NSString *EVENT_COMMUNITY_Community_Profile_Action_Result  = @"Forum-Community Profile Action Result";
NSString *EVENT_COMMUNITY_FOLLOWING_FOLLOWER_PAGE_OPEN     = @"Forum-Following and Followers Page Open";
NSString *EVENT_COMMUNITY_FOLLOWING_FOLLOWER_PAGE_ACTION   = @"Forum-Following and Followers Page Action Result";
NSString *EVENT_COMMUNITY_Interception_Page_Action         = @"Forum-Interception Page Action";
NSString *EVENT_FORUM_Create_a_Video_Result  = @"Forum-Create a Video Result";
NSString *EVENT_FORUM_View_Album  = @"Forum-View Album";
NSString *EVENT_FORUM_Record_Video_Page_Action = @"Forum-Record Video Page Action";
NSString *EVENT_FORUM_Job_Tilter_Result = @"Forum-Job Filter Result";
NSString *EVENT_COMMUNITY_USED_EQUIPMENT_CHECK_AVAILABILITY_RESULT = @"Forum-Used Equipment Check Availability Result";
NSString *EVENT_COMMUNITY_JOB_DETAIL_PAGEACTION = @"Forum-Job Detail Page Action";
NSString *EVENT_My_Driving_Profile_Result                  = @"My Driving Profile Result";
NSString *EVENT_Forum_Company_Detail_Page = @"Forum-Company Detail Page Action";

NSString *EVENT_JOB_PAGE_VIEW                              = @"Job Page View";
NSString *EVENT_USED_TRUCK_PAGE_VIEW                       = @"Used Truck Page View";

NSString *EVENT_GuidenceOfFollowingAndFollowersViewOpen    = @"Forum-Following and Followers Guidance Page Open";
NSString *EVENT_GuidenceOfFollowingAndFollowersViewAction  = @"Forum-Following and Followers Guidance Page Action Result";

//=== Tabbar
NSString *EVENT_NAVIGATION_BAR                             = @"Navigation Bar";

//=== Offline Maps
NSString *EVENT_OFFLINE_MAPS                               = @"Offline Maps";

//=== welcome pages
NSString *EVENT_WELCOME_INFO_SCREEN_VIEW            = @"Welcome Info Screen View";
NSString *EVENT_DRIVER_TYPE_COLLECTION_VIEW         = @" Driver Type Collection View";
NSString *EVENT_INTERRESTED_FOUNCTION_COLLECTION_VIEW = @"Interested Function Collection View";

NSString *EVENT_DOT_COLLECTION_PAGE_RESULT     = @"Dot Collection Page Result";
NSString *EVENT_ZIP_CODE_COLLECTION_PAGE_RESULT= @"Zip Code Collection Page Result";
NSString *EVENT_DRIVER_PROFILE_QUESTIONS       = @"Driver Profile Questions";
NSString *EVENT_Register_Campaign_Page       = @"Register Campaign Page";
//=== third party
NSString *EVENT_ASSOCIATE_THIRD_PARTY_ACCOUNT = @"Associate Third Party Account";
NSString *EVENT_USER_PERSONAL_PROFILE_PAGE_RESULT = @"User Personal Profile Page Result";


NSString *EVENT_PHONE_VERIFICATION_PAGE_RESULT  = @"Phone Number Verification Page Result";
NSString *EVENT_LOGIN_REGISTRATION  = @"Registration";



//=== Stand inside letter
NSString *EVENT_INBOX_PAGE_RESULT = @"Inbox Page Result";
NSString *EVENT_INBOX_SETTING_PAGE_RESULT = @"Inbox Setting Page Result";
NSString *EVENT_BLOCK_NAMELIST_PAGE_RESULT = @"Block Namelist Page Result";
NSString *EVENT_CHIT_CHAT_PAGE_OPEN_RESULT = @"Chit Chat Page Open Result";
NSString *EVENT_CHIT_CHAT_PAGE_ACTION_RESULT = @"Chit Chat Page Action Result";
NSString *EVENT_REPORT_USER_PAGE_RESULT = @"Report User Page Result";
NSString *EVENT_REFUSE_MESSAGES_FROM_THIS_USER_RESULT = @"Refuse Messages from this User Result";
NSString *EVENT_NOTIFICATIONS_TAB_ACTION_RESULT = @"Notifications Tab Action Result";
NSString *EVENT_INBOX_SETTING_PAGE_SAVE_RESULT = @"Inbox Setting Page Save Result";

NSString *EVENT_ERROR_WINDOW_OPEN_RESULT = @"users see App Error Alert";
NSString *EVENT_ERROR_PAGE_OPEN_RESULT = @"users see App Error";
NSString *EVENT_RECALL_POPUP_VIEW = @"Recall popup view";
NSString *EVENT_RECALL_POPUP_ACTION = @"Recall popup action";

//=== choose add stop
NSString *EVENT_NAVIGATION_AND_PLAN_PAGE = @"Navigation And Plan Page";
NSString *EVENT_CHOOSE_ROUTE_BY_TRUCK_ROUTING = @"Choose Route By Truck Routing";
NSString *EVENT_RESULT_OF_TRUCK_ROUTING = @"Result Of Truck Routing";

//===  Navigation In OTR
NSString *EVENT_NAVIGATION_IN_OTR = @"Navigation In OTR";

//=== trip plan message
NSString *EVENT_HOS_NOTIFICATION_AFTER_CHOOSE_PLAN = @"HOS Notification After Choose Plan";

// fule Plan
NSString *EVENT_FUEL_DISCLAIMER_VIEW = @"Fuel Disclaimer View";
NSString *EVENT_FUEL_DISCLAIMER_ACTION = @"Fuel Disclaimer Action";
NSString *EVENT_FUEL_ROUTING_ACTION = @"Fuel Routing Action";
NSString *EVENT_FUEL_ROUTING_RESULT = @"Fuel Routing Result";
NSString *EVENT_FUEL_ROUTING_ADVANCED_SETTINGS_VIEW = @"Fuel Routing Advanced Settings View";
NSString *EVENT_FUEL_ROUTING_ADVANCED_SETTINGS_ACTION = @"Fuel Routing Advanced Settings Action";
NSString *EVENT_FULE_PARAMVIEW_ACTION = @"Actions on Fuel Initial Setting Window";
NSString *EVENT_FULE_ERRORPAGE_SHOW = @"Fuel Plan Page - Error";
NSString *EVENT_FULE_ERRORPAGE_ACTION = @"Actions on FuelPage - Error";
NSString *EVENT_FULE_DETAIL_SHOW = @"Fuel Plan Page - Add To Plan";
NSString *EVENT_FULE_DETAIL_ACTION = @"Actions on Fuel Plan Page - Add To Plan";   // 6
NSString *EVENT_FULE_DELETEVIEW_SHOW = @"Fuel Deletion Window";
NSString *EVENT_FULE_DELETEVIEW_ACTION = @"Actions on Fuel Deletion Window";
NSString *EVENT_FULE_UPDATE_SHOW = @"Fuel Updates Message Apperas";
NSString *EVENT_FULE_UPDATE_ACTION = @"Actions on Fuel Update Message";
NSString *EVENT_FULE_RUNNINGPAGE_SHOW = @"Fuel Plan Page - Reset";
NSString *EVENT_FULE_RUNNINGPAGE_ACTION = @"Actions on Fuel Plan Page - Reset";


//Inquiry
NSString *EVENT_INQUIRY_SUBMIT_RESULT = @"Inquiry Submit Result";
NSString *EVENT_DEALER_POI_PLACE_VIEW_ACTION = @"Dealer POI Place View Action";
NSString *EVENT_DEALER_POI_FILTER_RESULT = @"Dealer POI Filter Result";
NSString *EVENT_USED_EQUIPMENT_DETAIL_VIEW = @"Used Equipment Detail View";

NSString *EVENT_SEARCH_FOR_JOB = @"Search For Jobs";

NSString *EVENT_INTERSTITIAL_POPUP = @"Interstitial Popup";
//MARK: - choose start point
//Navigation page show
NSString* EVENT_NAVIGATION_PAGE_SHOW = @"Navigation page show";
//Quit navigation
NSString* EVENT_QUIT_NAVIGATION = @"Quit navigation";
//Navigation proceed status end
NSString* EVENT_NAVIGATION_PROCEED_STATUS_END = @"Navigation proceed status end";
//Choose start page show
NSString *EVENT_CHOOSE_START_PAGE_SHOW = @"Choose start page show";
//Confirm button click
NSString *EVENT_CONFIRM_BUTTON_CLICK = @"Confirm button click";
//Skip button click
NSString *EVENT_SKIP_BUTTON_CLICK = @"Skip button click";
//Back button click
NSString *EVENT_BACK_BUTTON_CLICK = @"Back button click";
//Choose route page show
NSString *EVENT_CHOOSE_ROUTE_PAGE_SHOW = @"Choose route page show";
//Navigate button click
NSString *EVENT_NAVIGATE_BUTTON_CLICK = @"Navigate button click";
//Start trip button click
NSString *EVENT_START_TRIP_BUTTON_CLICK = @"Start trip button click";

NSString *EVENT_Choose_Destination_Page_Show = @"Choose Destination Page Show";
NSString *EVENT_Destination_Confirm = @"Destination Confirm";

NSString *EVENT_Recenter_Result_View = @"Recenter Result View";
NSString *EVENT_Recenter_Result = @"Recenter Result";
NSString *EVENT_Pathfinder_Hub_View = @"Pathfinder Hub View";
NSString *EVENT_FEEDBACK_REPORT_PRIVACY_POLICY = @"Report privacy policy";
NSString *EVENT_MYQA_PAGE_CLICK = @"Q&A - My QA Page Action";
NSString *EVENT_MYQA_PAGE_SHOW = @"Q&A - My QA Page View";
NSString *EVENT_MESSAGE_TAB_OPEN = @"Q&A - Message Tab Open";
NSString *EVENT_Coupon_Expiration_Push = @"Coupon Expiration Push";
NSString *EVENT_QuitPurchase_Popup_Show = @"Quit VIP Purchase Popup show";
NSString *EVENT_QuitPurchase_Popup_Action = @"Actions on Quit VIP Purchase Popup";
NSString *EVENT_Actions_on_Promotion_Popup = @"Actions on Navigation Promotion Popup";
NSString *EVENT_Promotion_Popup_Show = @"Navigation Promotion Popup show";
NSString *EVENT_Add_WayPoint = @"Add stop";
//PM requires to modify the event name.
NSString *EVENT_Remove_WayPoint = @"Remove stop";
// Voice Package
NSString *EVENT_Voice_Package = @"Voice package";
NSString *EVENT_Voice_Package_Action = @"Voice package action";

@interface AnalyticsManager () {
//    id<AnalyticsProvider> flurry;
	id<AnalyticsProvider> googleAdWords;
	id<AnalyticsProvider> mixpanel;
	id<AnalyticsProvider> fbEvents;
//	id<AnalyticsProvider> appsFlyer;
	//TODO: insert new analytics provider here

}

@property (nonatomic, strong) NSArray* providers;
@property (nonatomic, strong) NSDictionary* eventsMap;

@property (nonatomic, strong) NSString* currentScreen;
@property (nonatomic, strong) NSString* previousScreen;


@end


@implementation AnalyticsManager

static AnalyticsManager* instance;

+ (AnalyticsManager*)sharedIstance {
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
		instance = [[AnalyticsManager alloc] init];
    });
	return instance;
}

- (id)init {
	if( (self = [super init]) ) {
		self.providers = @[
					  (mixpanel = [MixPanelProvider new]),
					  (fbEvents = [FacebookEventsProvider new]),

					  //TODO: insert new analytics provider here
					  ];

		self.eventsMap = @{
                           
                      // Main Page Action
                      EVENT_MAIN_PAGE_ACTION: @[ mixpanel, ],
                      
                      // Place Search
                      EVENT_SEARCH_PLACE_PAGE_ACTION: @[ mixpanel, ],
                      EVENT_SEARCH_PAGE_AUTO_COMPLETE_ACTION: @[ mixpanel, ],
                      // Nearby
                      EVENT_POI_CATEGORY_CHOOSE: @[ mixpanel, ],
                      EVENT_SORT_BY_RESULT: @[ mixpanel, ],
                      EVENT_DISTANCE_RESULT: @[ mixpanel, ],
                      EVENT_FACILITIES_RESULT: @[ mixpanel, ],

					  //=== Truck Posting
                      EVENT_POST_TRUCK: @[mixpanel, ],
                      EVENT_DELETE_TRUCK: @[mixpanel, ],
                      EVENT_TRUCK_SETTING_PAGE_WITH_STANDARD: @[mixpanel, ],
                      EVENT_TP_PROMO: @[mixpanel, ],
                      EVENT_INCENTIVE_TP_PROMO: @[mixpanel, ],

                      EVENT_DETAILS_ITEM_REVIEW_ADD:    @[fbEvents ],
					  
					  //===
//
                      EVENT_APP_START:    @[mixpanel, ],
                      EVENT_APP_END:      @[mixpanel, ],
                      EVENT_IAD_ATTRIBUTION:@[mixpanel, ],
//                      //=== Map Events
//
                      EVENT_MAP_POINT_PLACE_TAP: @[mixpanel, ],
                      EVENT_MAP_TOOLTIP_WEIGHSTATION_VIEW: @[fbEvents, ],
                      EVENT_MAP_TOOLTIP_TRUCKSTOP_VIEW: @[fbEvents, ],

                      EVENT_MAP_SELECT_LAYER: @[mixpanel, ],
                      EVENT_MAIN_PAGE_MENU: @[mixpanel, ],
                      EVENT_REWARDS_ADS: @[mixpanel, ],
                      EVENT_REWARDS_ADS_POPUP: @[mixpanel, ],
//
                      EVENT_ADDRESS_SHARE_RESULT: @[mixpanel, ],
                      // Loading Dock
                      EVENT_LD_POPUP_RESULT: @[ mixpanel, ],
                      EVENT_LD_UPDATE_RESULT: @[ mixpanel, ],
                      EVENT_LD_SHARING_FINISH_PAGE_RESULT: @[ mixpanel, ],
                      
//                      //=== Weigh Stations events
//
                      EVENT_WS_IN_APP_MESSAFE_SHOW: @[mixpanel,],
                      EVENT_WS_IN_APP_MESSAFE_CLICK: @[mixpanel,],
                      EVENT_WS_PUSH_CLICK: @[mixpanel,],
                      EVENT_WS_FOLLOW_SETTING: @[mixpanel,],
                      EVENT_WS_VIEW: @[fbEvents, ],
                      
                      //=== Trip Planner events
//
                      EVENT_TP_VIEW: @[fbEvents, ],

                      EVENT_TP_TRIPPLAN: @[mixpanel, ],
                      EVENT_NEW_TRIP_PLAN: @[mixpanel, ],
                      EVENT_CHOOSE_ROUTE: @[mixpanel,],
                      EVENT_Plan_Trip_Show_All: @[mixpanel,],
                      EVENT_CHOOSE_ROUTE_PAGE_ACTION: @[mixpanel,],
                      EVENT_ALTERNATIVE_ROUTE_ACTION: @[mixpanel,],
//                      ZoomLevelEvent.name: @[mixpanel],
                      EVENT_SETTINGS_PAGE_IN_OTR:@[mixpanel,],
                      EVENT_TRIP_PLANNER_ROUTE_OPTION_ACTION_RESULT: @[mixpanel,],
                      EVENT_TAP_TRIP_PLANNER_TEXT_VERSION_ICON: @[mixpanel,],
                      EVENT_ACTION_ON_TEXT_VERSION: @[mixpanel,],
                      EVENT_ADD_STOP_IN_TEXT_VERSION: @[mixpanel,],
                      EVENT_CLICK_CONFIRM_ON_STOP_CARD: @[mixpanel,],
                      EVENT_CLICK_STOP_CARD: @[mixpanel,],
                      EVENT_CLICK_I_ARRIVE_BUTTON_ON_TEXT_VERSION: @[mixpanel,],
                      EVENT_CHANGES_IN_EDIT_PAGE: @[mixpanel,],
                      EVENT_DELETE_STOP_IN_EDIT_PAGE: @[mixpanel,],
                      EVENT_MOVE_STOPS_IN_EDIT_PAGE: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER: @[mixpanel,],
                      EVENT_DATA_WHEN_APP_GO_TO_BACKGROUND: @[mixpanel,],
                      EVENT_DATA_WHEN_APP_GO_BACK_TO_FRONT_DESK: @[mixpanel,],
                      
                      EVENT_NEW_TRIP_PLANNER_ADD_STOP_BY_SEARCH: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_STOP_OPTION_CLICK: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_ADD_STOP_MAP_ACTION: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_PAGE_BEFORE_CHOOSE: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_PLAN_TRIP_RESULT: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_TRUCK_INFO: @[mixpanel,],
                      EVENT_NEW_TRIP_AUTOMATICROUTING: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_CHOOSE_PLAN: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_CHOOSEN_PLAN_ON_MAP: @[mixpanel,],
                      EVENT_WEATHER_INFO_ACTION:@[mixpanel,],
                      EVENT_WEATHER_ICON_SHOW:@[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_CHOOSEN_PLAN_ACTION: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_ADD_POI_TO_TRIP: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_ADD_OR_REMOVE_ON_MAP: @[mixpanel,],
                      EVENT_TEXT_DIRECTION_ACTION: @[mixpanel,],
                      
                      EVENT_GIFT_VIP5STAR_SHOW:@[mixpanel,],
                      EVENT_GIFT_VIP5STAR_ACTIONS:@[mixpanel,],
                      
                      EVENT_NAVIGATIONENDPAGEDISAPPEAR: @[mixpanel,],
                      EVENT_NAVIGATIONEXITCLICK: @[mixpanel,],
                      
                      EVENT_NEW_TRIP_PLANNER_EDIT_BUTTON_ON_MAP: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_REPORT: @[mixpanel,],
                      EVENT_OTR_INVITATION_POPUP: @[mixpanel,],
                      EVENT_ACCEPT_OTR_INVITATION: @[mixpanel,],
                      EVENT_OTR_IN_ME_PAGE: @[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_RESET_PLAN: @[mixpanel,],
                      EVENT_OTR_CREATE_TRIP:@[mixpanel,],
                      EVENT_NEW_TRIP_PLANNER_CLICK: @[mixpanel,],
                      EVENT_NEW_TRIP_NAVIGATION_ON_MAP: @[mixpanel,],
                      EVENT_NEW_TRIP_DISCLAIMERS_POPUP: @[mixpanel,],
                      EVENT_TBT_ABNORMAL_POPUP: @[mixpanel,],
                      EVENT_NEW_TRIP_HOS_POPUP: @[mixpanel,],
                      EVENT_NEW_TRIP_HOS_POPUP_OPEN: @[mixpanel,],
                      EVENT_NEW_TRIP_HOS_SETTING: @[mixpanel,],
                      EVENT_NEW_TRIP_HOS_SWITCH: @[mixpanel,],
                      EVENT_NEW_TRIP_HOS_CONFIRMATION: @[mixpanel,],
                      EVENT_NEW_TRIP_ADD_HOS_STOP: @[mixpanel,],
                      EVENT_NEW_TRIP_HOS_MAP_ACTION: @[mixpanel,],
                      EVENT_NEW_TRIP_HOS_RISK: @[mixpanel,],
                      EVENT_NEW_TRIP_TIME_EXCAPES_IN_CHOSEN_PLAN_PAGE:@[mixpanel,],
                      EVENT_NEXTSTOPCARD_BEFORE_START:@[mixpanel,],
                      EVENT_FOLLOWMODE_STARTED:@[mixpanel,],
                      EVENT_PLAN_RESULT_FROM_CURRENT_TO_NEXTSTOP:@[mixpanel,],
                      EVENT_THE_BEHAVIOR_AFTER_START:@[mixpanel,],
                      EVENT_ARRIVED_POPUP_IN_OTR_FOLLOW_MODE:@[mixpanel,],
                      EVENT_ADD_STOP_ACTION:@[mixpanel,],
                      EVENT_ADD_TO_TRIP_MAIN_PAGE_ACTION:@[mixpanel,],
                      EVENT_HOS_VIOLATION_ALERT_VIEW:@[mixpanel,],
                      EVENT_HOS_VIOLATION_ALERT_ACTION:@[mixpanel,],
                      EVENT_CHANGEADDRESS:@[mixpanel,],
                      EVENT_CHANGEACTUALTRUCKSETTINGS:@[mixpanel,],
                      EVENT_OTRCHOOSEROUTEPAGEACTION:@[mixpanel,],
                      EVENT_REFRESHROUTERESULT:@[mixpanel],
                      EVENT_ACTIONONFUELPLANINMAINPAGE:@[mixpanel,],
                      EVENT_FUELPLANONMAINPAGESHOW:@[mixpanel,],
                      EVENT_EXITINFOAHEADSHOW:@[mixpanel,],
                      EVENT_EXITINFOCLICK:@[mixpanel,],
                      EVENT_TRIP_CARD_CLICK:@[mixpanel,],


                      EVENT_NEW_TRIP_HISTORY_MANAGEMENT: @[mixpanel,],
                      EVENT_NEW_TRIP_NEW_SEARCH_PAGE: @[mixpanel,],
                      TPPFillInTruckInfoEvent.name: @[mixpanel,],
                      EVENT_TIMEZONE_REQUEST:@[mixpanel,],
                      EVENT_OTR_GO_HERE:@[mixpanel,],
                      EVENT_OTR_MAP_ACTION:@[mixpanel,],
                      EVENT_POI_ACTION:@[mixpanel,],
                      EVENT_MAPVERSION_STATUS:@[mixpanel,],
                      EVENT_RATENAVIGATIONVIEW:@[mixpanel,],
                      EVENT_RATENAVIGATIONACTION:@[mixpanel,],
                      EVENT_REPORTNAVIGATIONACTION:@[mixpanel,],
//                      //=== Menu events
                      
                      EVENT_MENU_ITEM_LIKEUS_TAP: @[fbEvents, ],
                      EVENT_MENU_ITEM_PROFILE_TAP: @[fbEvents, ],
                      EVENT_MENU_ITEM_FEEDBACK_TAP: @[fbEvents, ],
                      
                      SCREEN_TALK_TO_SUPPORT: @[mixpanel, ],
                      EVENT_SEARCH: @[mixpanel, ],
//                      //=== Places events
                      
                      ReviewPublisherActionEvent.name : @[ mixpanel, ],
					  PlaceViewActionEvent.name : @[ mixpanel, ],
                      TPPRestaurantMapActionEvent.name : @[ mixpanel, ],
                      TPPRestaurantsActionEvent.name : @[ mixpanel, ],
                      EVENT_PLACES_Add_New_Place_Result: @[ mixpanel, ],
                      EVENT_PLACES_Incorrect_Info_Result: @[ mixpanel, ],
                      PostSuccessfullyViewEvent.name : @[mixpanel],
                      PostSuccessfullyActionEvent.name : @[mixpanel],
                      PhotoWallViewEvent.name: @[mixpanel],
                      PhotoViewEvent.name: @[mixpanel],
                      PhotoActionEvent.name: @[mixpanel],
                      SearchReviewResultViewEvent.name: @[mixpanel],
                      SearchReviewResultActionEvent.name: @[mixpanel],
                      //=== InviteFriends events
                      EVENT_INVITE_FRIENDS_RESULT: @[ mixpanel, ],
                      //=== Talk to support events
                      EVENT_TALK_TO_SUPPORT_SEND: @[ mixpanel, ],
                      
                      //=== update version events
                      TPPUpdatePopuoEvent.name : @[ mixpanel, ],
                      
                      //=== Profile events
                      EVENT_PROFILE_LOGOUT: @[mixpanel, ],
					  EVENT_AUTHENTICATION_SCREEN_RESULT : @[mixpanel, ],
					  EVENT_PROFILE_SCREEN_RESULT : @[mixpanel, ],
					  EVENT_ADDITIONAL_PROFILE_INFO_RESULT : @[mixpanel, ],
                      TPPGiveFiveStarRatingEvent.name : @[mixpanel, ],

                      //=== Details events
                      EVENT_DETAILS_VIEW: @[mixpanel, ],
                      
                      DetailsItemAddToFavoritesTap.name: @[mixpanel ],
                      TPPAddReviewResultEvent.name: @[mixpanel ],
                      TPPAddReviewEvent.name: @[mixpanel ],
                      TPPMyReviewEvent.name: @[mixpanel ],
                      TPPVerifyNicknameResultEvent.name: @[mixpanel ],
                      TPPParkingInsightActionEvent.name: @[mixpanel ],
                      TPPWeighStationInsightActionEvent.name: @[mixpanel ],

                      EVENT_DETAILS_STATUS_REPORT: @[fbEvents, ],

                      EVENT_PLACE_DIRECTIONS_RESULT: @[mixpanel,],
                      //=== Traffic events
                      EVENT_RECOMMENDATION_CARD_IMPRESSIONS: @[mixpanel,],
                      EVENT_RECOMMENDATION_CARD_CLICKS: @[mixpanel,],
                      //=== Truckloads events
                      EVENT_CHAECK_CONGESTION_ACTION: @[mixpanel,],
                      EVENT_AVOID_RESULT: @[mixpanel,],
                      EVENT_WEIGH_STATION_CARD_SHOW: @[mixpanel,],
                      EVENT_WEIGH_STATION_AVOID_PIN_SHOW: @[mixpanel,],
                      
                      EVENT_TL_TRUCKLOADS: @[ mixpanel, ],
                      EVENT_TLPROMO_SCREEN4_BUTTON_INVITE_TAP: @[fbEvents, ],

					  //===

                      EVENT_CONTRIBUTE_INFORMATION: @[mixpanel, ],
                      EVENT_WS_CONTRIBUTE_INFORMATION: @[mixpanel, ],
                      EVENT_SHARE_ATTEMPT: @[mixpanel, ],
                      SatelliteViewEvent.name: @[mixpanel],
                      SatelliteViewResultEvent.name: @[mixpanel],
                      AddMissingMarkerResultEvent.name: @[mixpanel],

					  //===
                      EVENT_VIEW_HISTORY: @[mixpanel, ],

					  //=== News events

                      EVENT_INDUSTRY_NEWS: @[mixpanel, ],

					  //=== Job Search

                      EVENT_SEARCH_JOB_SCREEN_VIEW: @[ mixpanel, ],
                      EVENT_SEARCH_JOB_EXIT: @[ mixpanel, ],
                      
                      // eld
                      EVENT_ELD_INVITE: @[ mixpanel ],

					  //=== Roadside assistance
                      EVENT_ROADSIDE_ASSISTANCE_SCREEN_VIEW: @[ mixpanel ],
                      EVENT_ROADSIDE_ASSISTANCE_CALL_TO_APPLY: @[ mixpanel ],
                      EVENT_ROADSIDE_ASSISTANCE_BUY_ONLINE: @[ mixpanel ],
                      EVENT_ROADSIDE_ASSISTANCE_CALL_TO_HELP: @[ mixpanel ],
                      EVENT_ROADSIDE_ASSISTANCE_SIGNUP: @[ mixpanel ],
					  //===

                      EVENT_RESERVE_PARKING: @[mixpanel, ],

                      CancelContributeInformationEvent.name : @[mixpanel, ],

					  //=== Banners
                      EVENT_BANNER_CLICK : @[mixpanel, ],
                      EVENT_BANNER_IMPRESSION : @[mixpanel,],
                      EVENT_BANNER_IMPRESSION_NEW : @[ mixpanel ],
                      EVENT_BANNER_LOADED_SUCCEESS : @[ mixpanel ],
                      EVENT_BANNER_IMPRESSION_FAILED : @[ mixpanel ],
                      EVENT_BANNER_IMPRESSION_VERSION_B : @[ mixpanel ],
                      EVENT_BANNER_IMPRESSION_LINK_SENT : @[ mixpanel ],
                      EVENT_AD_CLOSE : @[ mixpanel ],
                      EVENT_SPLASH_CLICK : @[ mixpanel ],
                      EVENT_SPLASH_REQUEST : @[ mixpanel ],
                      EVENT_SPLASH_IMPRESSION : @[ mixpanel ],
                      BannerRemoveAdPopupEvent.name: @[mixpanel],
                      //===Membership
                      EVENT_CHOOSE_MEMBERSHIP_TYPE : @[ mixpanel ],
                      RestoreResultEvent.name : @[mixpanel],
                      //=== Lead Form
                      EVENT_LEAD_FORM_IMPRESSION : @[ mixpanel ],
                      EVENT_LEAD_FORM_CLICK_BUTTON_RESULT : @[ mixpanel ],
                      EVENT_LEAD_FORM_QUIT : @[ mixpanel ],
                      
					  //=== Nigth Mode
                      SwitchNightModeEvent.name : @[mixpanel, ],

					  //=== Onboarding
                      EVENT_ONBOARDING_TRUCK_STOP_DISPLAY : @[mixpanel, ],
//                      EVENT_ONBOARDING_TRUCK_STOP_DISPLAY : @[ flurry, mixpanel, ],
					  EVENT_ENABLE_LOCATION_RESULT : @[ mixpanel, ],
					  
					  //=== New Filter
					  EVENT_PLACE_FILTER_RESULT : @[ mixpanel, ],
					  
					  //=== Premium
                      BecomeVIPMemberScreenViewAction.name : @[ mixpanel, ],
					  BecomeVIPMemberScreenViewEvent.name : @[ mixpanel, ],
					  BecomeVIPMemberResultEvent.name : @[ mixpanel, ],
					  SubscribedToVIPEvent.name : @[mixpanel, ],
                      PopUpOnSubscriptionPageEvent.name: @[mixpanel],
                      TPPMainFuelCardViewEvent.name: @[mixpanel],
                      TPPCompaignOctPageViewEvent.name: @[mixpanel],
                      PresentVipWillOverduePopupEvent.name : @[mixpanel],
                      PresentVipOverduePopupEvent.name : @[mixpanel],
                      PromptToSwitchAccountEvent.name : @[mixpanel],
                      FleetSolutionPageViewEvent.name : @[mixpanel],
                      TPPTripIconClickEvent.name : @[mixpanel],
					  //=== Push Notification
					  EVENT_ENABLE_NOTIFICATION_RESULT : @[mixpanel,],

                      //=== New Version Event
                      EVENT_SPLASH_AD_SKIP: @[ mixpanel ],
                      EVENT_SPLASH_AD_IMPRESSION: @[ mixpanel ],
                      EVENT_ROADSIDE_ASSISTANCE_BANNER_IMPRESSION: @[ mixpanel ],
                      EVENT_ROADSIDE_ASSISTANCE_BANNER_CLICKED: @[ mixpanel ],
                      EVENT_ROADSIDE_ASSISTANCE_GOOD_YEAR_CALL_CLICK: @[mixpanel ],
                      EVENT_ELECTRONIC_LOGBOOK_TAP: @[mixpanel,],

                      //=== Service view Event
                      EVENT_SERVICE_PAGE_ACTION: @[mixpanel,],
                      TPPDiscoverPageViewEvent.name: @[mixpanel, ],

                      //=== Update Status Event
                      InspectionStatusDisplay.name: @[mixpanel],
                      InspectionStatusSubmit.name: @[mixpanel],
                      ParkingStatusSubmitAction.name: @[ mixpanel, ],
                      EVENT_PARKING_STATUS_SUBMIT: @[ mixpanel,],
                      EVENT_PARKING_STATUS_DISPLAY: @[ mixpanel,],
                      EVENT_PARKING_STATUS_CANCEL: @[ mixpanel, ],
                      EVENT_PARKING_PREDICTION_VIEW: @[ mixpanel, ],
                      EVENT_PARKING_PREDICTION_CHANGE: @[ mixpanel, ],
                      EVENT_PARKING_PREDICTION_INFO_VIEW: @[ mixpanel, ],
                      EVENT_PARKING_PREDICTION_LEAVE_FEEDBACK: @[ mixpanel, ],
                      EVENT_WEIGH_STATION_SUBMIT: @[ mixpanel, ],
                      EVENT_WEIGH_STATION_DISPLAY: @[ mixpanel, ],
                      EVENT_WEIGH_STATION_CANCEL: @[ mixpanel, ],
                      EVENT_PARKING_INSIGHT_VIEW: @[ mixpanel, ],
                      EVENT_WEIGHT_STATION_INSIGHT_VIEW: @[ mixpanel, ],
                      EVENT_PARKING_INSIGHT_PEAK_HOUR: @[ mixpanel, ],
                      EVENT_WEIGHT_STATION_PEAK_HOUR: @[ mixpanel, ],
                      EVENT_PARKING_INSIGHT_RUNTIME: @[ mixpanel, ],
                      EVENT_WEIGHT_STATION_RUNTIME: @[ mixpanel, ],
                      EVENT_QUICK_VIEW_RESULT: @[ mixpanel, ],
                      EVENT_WEIGH_STATION_PUSH_CLICK: @[ mixpanel, ],
                      EVENT_WEIGH_STATION_IN_APP_CLICK: @[ mixpanel, ],
                      EVENT_WEIGH_STATION_IN_APP_SHOW: @[ mixpanel, ],
                      EVENT_WEIGH_STATION_FOLLOW_POPUP_VIEW: @[ mixpanel, ],
                      EVENT_WEIGH_STATION_FOLLOW_POPUP_ACTION: @[ mixpanel, ],
                      WeighStationSubmitActionEvent.name: @[mixpanel],
                      //==== Choose Route
                      EVENT_TRIPPLANNER_FEEDBACK: @[ mixpanel, ],
                      EVENT_Report_Navigation_Detail: @[ mixpanel, ],
                      EVENT_TRIPPLANNER_EDITTRUCKPARAMETERS: @[ mixpanel, ],
                      EVENT_TRIPPLANNER_NAVIGATION_START: @[ mixpanel, ],
                      EVENT_TRIPPLANNER_NAVIGATION_RESULT: @[ mixpanel, ],
                      EVENT_TRIPPLANNER_ACTIONS_NAVIGATION_POI_REMINDER: @[ mixpanel, ],
                      EVENT_TRIPPLANNER_NAVIGATION_POI_REMINDER_SHOW: @[ mixpanel, ],
                      EVENT_TRIPPLANNER_NAVIGATION_END: @[ mixpanel, ] ,
                      EVENT_RATE_DESTINATION_ACTION: @[ mixpanel, ] ,
                      EVENT_RATE_DESTINATION_DETAIL: @[ mixpanel],
                      EVENT_ROUTING_PAGE_ACTION: @[mixpanel, ],
                      EVENT_RECENT_TRIPS: @[mixpanel, ],
                      EVENT_MEMBER_CENTER: @[mixpanel,],
                      TripPlannerPageActionEvent.name: @[mixpanel],

                      // ==== Community
                      EVENT_COMMUNITY_SEARCH_RESULT: @[mixpanel,],
                      EVENT_COMMUNITY_Create_a_Post_Result: @[mixpanel,],
                      EVENT_Forum_Cancel_Creating_a_Post: @[mixpanel,],
                      EVENT_COMMUNITY_Create_a_Used_Truck_Post_Result: @[mixpanel,],
                      EVENT_COMMUNITY_Community_Profile_Action_Result: @[mixpanel,],
                      EVENT_COMMUNITY_FOLLOWING_FOLLOWER_PAGE_OPEN: @[mixpanel,],
                      EVENT_COMMUNITY_FOLLOWING_FOLLOWER_PAGE_ACTION: @[mixpanel,],
                      EVENT_COMMUNITY_Interception_Page_Action: @[mixpanel,],
                      EVENT_COMMUNITY_Create_a_Job_Post_Result: @[mixpanel,],
                      EVENT_COMMUNITY_Create_a_Link_Post_Result: @[mixpanel,],
                      EVENT_COMMUNITY_CHECK_POST: @[mixpanel,],
                      EVENT_COMMUNITY_POSTDETAIL_PAGEACTION: @[mixpanel,],
                      EVENT_COMMUNITY_CREAT_COMMENT: @[mixpanel,],
                      EVENT_COMMUNITY_USED_EQUIPMENT_CHECK_AVAILABILITY_RESULT: @[mixpanel,],
                      EVENT_COMMUNITY_JOB_DETAIL_PAGEACTION: @[mixpanel,],
                      EVENT_My_Driving_Profile_Result:@[mixpanel,],
                      EVENT_Forum_Company_Detail_Page:@[mixpanel,],
                      EVENT_JOB_PAGE_VIEW:@[mixpanel,],
                      EVENT_USED_TRUCK_PAGE_VIEW:@[mixpanel,],
                      ForumMainPageResultEvent.name: @[mixpanel, ],
                      VotePostEvent.name: @[mixpanel, ],
                      SubforumViewEvent.name: @[mixpanel, ],
                      UsedTruckSubforumEvent.name: @[mixpanel],
                      UsedEquipmentFilterEvent.name: @[mixpanel],
                      CommunityRunTimeEvent.name: @[mixpanel, ],
                      JobSubforumResultEvent.name: @[mixpanel, ],
                      PostTypeChooseResultEvent.name: @[mixpanel, ],
                      OpenLinkEvent.name: @[mixpanel, ],
                      SubforumResultEvent.name: @[mixpanel, ],
                      UsedEquipmentSearchResultPageEvent.name: @[mixpanel],
                      UsedEquipmentMainPageResultEvent.name: @[mixpanel],
                      JobMainPageActionEvent.name: @[mixpanel],
                      TPPJobApplyResultEvent.name: @[mixpanel, ],
                      TPPJobDetailPageViewEvent.name: @[mixpanel, ],
                      JobSearchResultEvent.name: @[mixpanel],
                      ForumBannerClickResultEvent.name: @[mixpanel],
                      TPPForumTreeOpenResultEvent.name: @[mixpanel],
                      EVENT_GuidenceOfFollowingAndFollowersViewOpen: @[mixpanel,],
                      EVENT_GuidenceOfFollowingAndFollowersViewAction: @[mixpanel,],

                      //=== GiveMembership
                      MembershipGrantPopupEvent.name: @[mixpanel],
                      MembershipGrantResultEvent.name: @[mixpanel],
                      MembershipGrantEmailSubmitPopupEvent.name: @[mixpanel],
                      BecomeVipSuccessfullyPopupEvent.name: @[mixpanel],
                      WillExpirePopupEvent.name: @[mixpanel],
                      ExpiredPopupEvent.name: @[mixpanel],
                      EVENT_QuitPurchase_Popup_Show: @[mixpanel,],
                      EVENT_QuitPurchase_Popup_Action: @[mixpanel,],

                      //=== shortVideo
                      EVENT_FORUM_Create_a_Video_Result: @[mixpanel,],
                      EVENT_FORUM_View_Album: @[mixpanel,],
                      EVENT_FORUM_Record_Video_Page_Action: @[mixpanel, ],
                      EVENT_FORUM_Job_Tilter_Result: @[mixpanel, ],
                      //=== Tabar
                      EVENT_NAVIGATION_BAR: @[mixpanel,],
                      
                      //=== OffLineMaps
                      EVENT_OFFLINE_MAPS:@[mixpanel,],
                      
                      //=== welcomePage
                      EVENT_WELCOME_INFO_SCREEN_VIEW: @[mixpanel,],
                      EVENT_DRIVER_TYPE_COLLECTION_VIEW: @[mixpanel,],
                      EVENT_INTERRESTED_FOUNCTION_COLLECTION_VIEW: @[mixpanel,],
                      EVENT_ASSOCIATE_THIRD_PARTY_ACCOUNT: @[mixpanel, ],
                      EVENT_USER_PERSONAL_PROFILE_PAGE_RESULT: @[mixpanel, ],
                      EVENT_DOT_COLLECTION_PAGE_RESULT: @[mixpanel,],
                      EVENT_ZIP_CODE_COLLECTION_PAGE_RESULT: @[mixpanel,],
                      
                      //=== invite friends
                      SCREEN_INVITE_FRIENDS: @[mixpanel, ],
                      EVENT_PROFILE_PAGE:  @[mixpanel, ],
                      //== login
                      
                      EVENT_PHONE_VERIFICATION_PAGE_RESULT:@[mixpanel, ],
                      EVENT_LOGIN_REGISTRATION:@[mixpanel, ],
                      //== message
                      EVENT_INBOX_PAGE_RESULT: @[mixpanel, ],
                      EVENT_INBOX_SETTING_PAGE_RESULT: @[mixpanel, ],
                      EVENT_INBOX_SETTING_PAGE_SAVE_RESULT: @[mixpanel,],
                      EVENT_BLOCK_NAMELIST_PAGE_RESULT: @[mixpanel, ],
                      EVENT_CHIT_CHAT_PAGE_OPEN_RESULT: @[mixpanel, ],
                      EVENT_CHIT_CHAT_PAGE_ACTION_RESULT: @[mixpanel, ],
                      EVENT_REPORT_USER_PAGE_RESULT: @[mixpanel, ],
                      EVENT_REFUSE_MESSAGES_FROM_THIS_USER_RESULT: @[mixpanel, ],
                      EVENT_NOTIFICATIONS_TAB_ACTION_RESULT: @[mixpanel, ],
                      EVENT_RECALL_POPUP_VIEW: @[mixpanel, ],
                      EVENT_RECALL_POPUP_ACTION: @[mixpanel, ],
                      EVENT_NAVIGATION_AND_PLAN_PAGE: @[mixpanel ,],
                      EVENT_CHOOSE_ROUTE_BY_TRUCK_ROUTING: @[mixpanel ,],
                      EVENT_RESULT_OF_TRUCK_ROUTING: @[mixpanel, ],
                      
                      // fuel
                      EVENT_FUEL_DISCLAIMER_VIEW: @[mixpanel, ],
                      EVENT_FUEL_DISCLAIMER_ACTION: @[mixpanel, ],
                      EVENT_FUEL_ROUTING_ACTION: @[mixpanel, ],
                      EVENT_FUEL_ROUTING_RESULT: @[mixpanel, ],
                      EVENT_FUEL_ROUTING_ADVANCED_SETTINGS_VIEW: @[mixpanel, ],
                      EVENT_FUEL_ROUTING_ADVANCED_SETTINGS_ACTION: @[mixpanel, ],
                      EVENT_FULE_PARAMVIEW_ACTION: @[mixpanel, ],
                      EVENT_FULE_ERRORPAGE_SHOW: @[mixpanel, ],
                      EVENT_FULE_ERRORPAGE_ACTION: @[mixpanel, ],
                      EVENT_FULE_DETAIL_SHOW: @[mixpanel, ],
                      EVENT_FULE_DETAIL_ACTION: @[mixpanel, ],
                      EVENT_FULE_DELETEVIEW_SHOW: @[mixpanel, ],
                      EVENT_FULE_DELETEVIEW_ACTION: @[mixpanel, ],
                      EVENT_FULE_UPDATE_SHOW: @[mixpanel, ],
                      EVENT_FULE_UPDATE_ACTION: @[mixpanel, ],
                      EVENT_FULE_RUNNINGPAGE_SHOW: @[mixpanel, ],
                      EVENT_FULE_RUNNINGPAGE_ACTION: @[mixpanel, ],

                      EVENT_HOS_NOTIFICATION_AFTER_CHOOSE_PLAN:@[mixpanel, ],
                      EVENT_NAVIGATION_IN_OTR:@[mixpanel, ],
                      EVENT_DRIVER_PROFILE_QUESTIONS: @[mixpanel, ],
                      EVENT_SEARCH_FOR_JOB: @[mixpanel, ],
                      EVENT_INTERSTITIAL_POPUP: @[mixpanel],

                      // report road condition
                      ReportRoadConditionClickEvent.name: @[mixpanel],
                      ReportRoadConditionResultEvent.name: @[mixpanel],
                      RoadConditionPreviewEvent.name: @[mixpanel],

                      // address book
                      AddressBookResultEvent.name: @[mixpanel],
                      SearchPlaceResultEvent.name: @[mixpanel],
                      SearchPOIEvent.name: @[mixpanel],
                      SearchPlaceResultViewEvent.name: @[mixpanel],


                      EVENT_NAVIGATION_PAGE_SHOW :  @[mixpanel, ],
                      EVENT_QUIT_NAVIGATION : @[mixpanel, ],
                      EVENT_NAVIGATION_PROCEED_STATUS_END : @[mixpanel, ],
                      EVENT_CHOOSE_START_PAGE_SHOW : @[mixpanel, ],
                      EVENT_CONFIRM_BUTTON_CLICK : @[mixpanel, ],
                      EVENT_Choose_Destination_Page_Show: @[mixpanel, ],
                      EVENT_Destination_Confirm: @[mixpanel, ],
                      EVENT_SKIP_BUTTON_CLICK : @[mixpanel, ],
                      TPPFindEntryPopupShowEvent.name : @[mixpanel, ],
                      TPPFindEntryPopupClickEvent.name : @[mixpanel, ],
                      TPPChangeEntryPopupShowEvent.name : @[mixpanel, ],
                      TPPChangeEntryPopupClickEvent.name : @[mixpanel, ],
                      TPPClickWaypointEvent.name : @[mixpanel, ],
                      TPPShareShowNaviagtionEvent.name : @[mixpanel, ],
                      TPPShareNaviagtionEvent.name : @[mixpanel, ],
                      TPPDrawerStopShareNavigationEvent.name : @[mixpanel, ],
                      TPPDrawerShareWithMoreNavigationEvent.name : @[mixpanel, ],
                      TPPFindFenceEvent.name : @[mixpanel, ],
                      TPPPDERequestEvent.name : @[mixpanel, ],
                      TPPQuitReportEvent.name : @[mixpanel, ],
                      TPPQuitReportDetailEvent.name : @[mixpanel, ],
                      TPPPlaySoundAlertEvent.name : @[mixpanel, ],
                      TPPNavigationCellularDataEvent.name:@[mixpanel, ],
                      EVENT_BACK_BUTTON_CLICK : @[mixpanel, ],
                      EVENT_CHOOSE_ROUTE_PAGE_SHOW : @[mixpanel, ],
                      EVENT_Promotion_Popup_Show : @[mixpanel, ],
                      EVENT_Actions_on_Promotion_Popup: @[mixpanel, ],
                      EVENT_Remove_WayPoint: @[mixpanel, ],
                      EVENT_Add_WayPoint: @[mixpanel, ],
                      EVENT_NAVIGATE_BUTTON_CLICK : @[mixpanel, ],
                      EVENT_START_TRIP_BUTTON_CLICK : @[mixpanel, ],
                      EVENT_Recenter_Result_View : @[mixpanel, ],
                      EVENT_Recenter_Result :  @[mixpanel, ],
                      TPPSearchMainPageMenuEvent.name:  @[mixpanel, ],
                      TPPSearchSuggestionPageEvent.name:  @[mixpanel, ],
                      TPPSuggestedPlacesActionEvent.name:  @[mixpanel, ],
                      TPPSuggestedPlacesPageEvent.name:  @[mixpanel, ],
                      TPPSearchSearchResultEvent.name:  @[mixpanel, ],
                      TPPCheckRestrictionActionEvent.name: @[mixpanel, ],
                      TPPNavigationAnalysisEvent.name:  @[mixpanel, ],
                      TPPSearchAreaClickEvent.name:  @[mixpanel, ],
                      TPPNavigationRouteAlertEvent.name:  @[mixpanel, ],
                      TPPSearchAllPlacesEvent.name:  @[mixpanel, ],
                      TPPSearchAdImpressionsEvent.name: @[mixpanel, ],
                      TPPSearchAdClicksEvent.name:  @[mixpanel, ],
                      TPPMyWalletActionEvent.name:   @[mixpanel],
                      TPPDealDetailPageEvent.name:   @[mixpanel],
                      TPPOrderPageEvent.name:   @[mixpanel],
                      TPPAddNewCardActionEvent.name:   @[mixpanel],
                      //contribution
                      PointsEarnedPopup.name : @[mixpanel, ],
                      Event_CoDriverPopup :  @[mixpanel, ],
                      Event_CoDriverSelection  : @[mixpanel, ],
                      Event_CoDriverPageView :  @[mixpanel, ],
                      Event_FleetSolutionView:  @[mixpanel, ],
                      EVENT_Register_Campaign_Page :  @[mixpanel, ],
                      EVENT_TP_Push_Open :  @[mixpanel, ],
                      EVENT_Pathfinder_Hub_View : @[mixpanel, ],
                      //dispatch
                      TPPDispatchTabClickEvent.name: @[mixpanel, ],
                      TPPDispatchCurrentViewEvent.name: @[mixpanel, ],
                      TPPDispatchPreAssignedViewEvent.name: @[mixpanel, ],
                      TPPDispatchPreviousViewEvent.name: @[mixpanel, ],
                      TPPDispatchPreAssignedTasksClickEvent.name: @[mixpanel, ],
                      TPPDispatchPreviousTasksClickEvent.name: @[mixpanel, ],
                      TPPDispatchNavigateClickEvent.name: @[mixpanel, ],
                      TPPDispatchMessageClickEvent.name: @[mixpanel, ],
                      TPPDispatchCallOperatorClickEvent.name: @[mixpanel, ],
                      TPPDispatchDocsClickEvent.name: @[mixpanel, ],
                      TPPDispatchFileUploadedClickEvent.name: @[mixpanel, ],
                      TPPDispatchFileDeletedClickEvent.name: @[mixpanel, ],
                      TPPDispatchPickupShowHideClickEvent.name: @[mixpanel, ],
                      TPPDispatchPickupLocateOnMapClickEvent.name: @[mixpanel, ],
                      TPPDispatchPickupDirectionClickEvent.name: @[mixpanel, ],
                      TPPDispatchPickupCallClickEvent.name: @[mixpanel, ],
                      TPPDispatchPickupArrivedClickEvent.name: @[mixpanel, ],
                      TPPDispatchPickupLoadedClickEvent.name: @[mixpanel, ],
                      TPPDispatchPickupDepartedClickEvent.name: @[mixpanel, ],
                      TPPDispatchDeliveryShowHideClickEvent.name: @[mixpanel, ],
                      TPPDispatchDeliveryLocateOnMapClickEvent.name: @[mixpanel, ],
                      TPPDispatchDeliveryDirectionClickEvent.name: @[mixpanel, ],
                      TPPDispatchDeliveryCallClickEvent.name: @[mixpanel, ],
                      TPPDispatchDeliveryArrivedClickEvent.name: @[mixpanel, ],
                      TPPDispatchDeliveryDeliveredClickEvent.name: @[mixpanel, ],
                      TPPDispatchDeliveryAllPaperworkSubmittedClickEvent.name: @[mixpanel, ],
                      TPPDispatchAcceptClickEvent.name: @[mixpanel, ],
                      TPPDispatchRejectClickEvent.name: @[mixpanel, ],
                      TPPDispatchStartClickEvent.name: @[mixpanel, ],
                      TPPDispatchDiscardClickEvent.name: @[mixpanel, ],
                      TPPMessageEvent.name : @[mixpanel, ],
                      EVENT_FEEDBACK_REPORT_PRIVACY_POLICY:@[mixpanel,],
                      /// transfore promoto
                      TPPTransforcePopEvent.name : @[mixpanel, ],
                      TPPTransforceDetailEvent.name : @[mixpanel, ],
                      // schema : cal route
                      TPPOpenURLForCalRouteEvent.name : @[mixpanel,],
                      TPPDidShowDestinationEvent.name : @[mixpanel,],
                      TPPFuelPromoSectionEvent.name : @[mixpanel,],
                      TPPGeoBasedPopupAdsEvent.name : @[mixpanel],
                      TPPDealRecommendationEvent.name : @[mixpanel],
                      SearchAddressAndPlaceViewEvent.name: @[mixpanel],
                      CouponPopupsEvent.name : @[mixpanel,],
                      TPPCreatePasswordEvent.name: @[mixpanel],

                      // WeighStationLiveStatus
                      WeighStationLiveStatusSesstionEvent.name : @[mixpanel],
                      OrderDetailPageEvent.name : @[mixpanel],
                      
                      //detention
                      TPPDetentionRequestPopupShowEvent.name : @[mixpanel],
                      TPPDetentionRequestPopupEvent.name : @[mixpanel],
                      TPDetentionToolPageShowEvent.name : @[mixpanel],
                      TPDetentionToolPageEvent.name : @[mixpanel],
                      EVENT_Coupon_Expiration_Push:@[mixpanel,],
                      
                      //Timeline
                      TPPTimelineEvent.name: @[mixpanel],
                      TPPTimelineClickEvent.name: @[mixpanel],
                      // OneSignal
                      TPPauseInAppMessageEvent.name : @[mixpanel],
                      // Loadboard Onboarding
                      TPPTapLoadboardEvent.name: @[mixpanel],
                      TPPOnboardingCollectPageViewEvent.name: @[mixpanel],
                      TPPOnboardingEmailVerifyPageViewEvent.name: @[mixpanel],
                      TPPOnboardingEmailVerifyResultEvent.name: @[mixpanel],
                      TPPOnboardingVerifyAuthorityPageViewEvent.name: @[mixpanel],
                      TPPOnboardingVerifyAuthorityActionEvent.name: @[mixpanel],
                      TPPOnboardingVerifyAuthoritySaveResultEvent.name: @[mixpanel],
                      // Loadboard SearchLoad
                      TPPSearchLoadsClickEvent.name: @[mixpanel],
                      TPPSearchLoadsListPageViewEvent.name: @[mixpanel],
                      TPPSearchLoadsListPageActionEvent.name: @[mixpanel],
                      TPPSearchLoadsPostTruckResult.name: @[mixpanel],
                      // Loadboard PostTruck
                      TPPPostTruckHomePageViewEvent.name: @[mixpanel],
                      TPPPostTruckPageViewEvent.name: @[mixpanel],
                      TPPPostTruckListPageActionEvent.name: @[mixpanel],
                      TPPPostTruckCreateResultEvent.name: @[mixpanel],
                      TPPPostTruckCreateSuccessfulEvent.name: @[mixpanel],
                      TPPPostTruckListSuggestViewEvent.name: @[mixpanel],
                      TPPPostTruckListPostAllBarViewEvent.name: @[mixpanel],
                      TPPPostTruckListSaveCardViewEvent.name: @[mixpanel],
                      TPPPostTruckListVerifyPhoneBarViewEvent.name: @[mixpanel],
                      TPPPostTruckListVerifyPhoneBarClickEvent.name: @[mixpanel],
                      TPPPostTruckListVerifyPhonePageViewEvent.name: @[mixpanel],
                      TPPPostTruckLoadsEvent.name: @[mixpanel],
                      // Loadboard Earning
                      TPPLoadEarningClickedEvent.name: @[mixpanel],
                      TPPLoadMyPaymentClickedEvent.name: @[mixpanel],
                      TPPLoadMyPaymentPendingPaymentClickedEvent.name: @[mixpanel],
                      TPPLoadMyPaymentPendingReportClickedEvent.name: @[mixpanel],
                      
                      //QA
                      EVENT_MYQA_PAGE_CLICK:@[mixpanel,],
                      EVENT_MYQA_PAGE_SHOW:@[mixpanel,],
                      EVENT_MESSAGE_TAB_OPEN:@[mixpanel,],
                      TPMessageQAPageEvent.name : @[mixpanel],
                      TPPQuestionPageViewEvent.name : @[mixpanel],
                      TPPQuestionPageActionEvent.name : @[mixpanel],
                      TPPAskAQuestionResultEvent.name : @[mixpanel],
                      TPQAlistPageViewEvent.name:@[mixpanel,],
                      TPQAlistShowPageEvent.name:@[mixpanel,],
                      TPPScanDocClickedEvent.name:@[mixpanel,],
                      TPPScanDocHistoryClickedEvent.name:@[mixpanel,],
                      TPPScanDocTakePicEvent.name:@[mixpanel,],
                      TPPScanDocRetakeClickedEvent.name:@[mixpanel,],
                      TPPScanDocFinishAdjustClickedEvent.name:@[mixpanel,],
                      TPPScanDocFinishFilterClickedEvent.name:@[mixpanel,],
                      TPPScanDocChooseDocTypeEvent.name:@[mixpanel,],
                      TPPScanDocConfirmDiscardClickedEvent.name:@[mixpanel,],
                      TPPScanDocEditDocInfoClickedEvent.name:@[mixpanel,],
                      TPPScanDocDeleteDocClickedEvent.name:@[mixpanel,],
                      TPPScanDocSendDocClickedEvent.name:@[mixpanel,],
                      TPPScanDocAddContactClickedEvent.name:@[mixpanel,],
                      TPPScanDocSaveContactClickedEvent.name:@[mixpanel,],
                      TPPScanDocFinallySendEvent.name:@[mixpanel,],
                      TPCouponsClipPageEvent.name:@[mixpanel,],
                      TPQAEntranceShowEvent.name:@[mixpanel,],
                      TPGiftVIPPopupShowEvent.name : @[mixpanel,],
                      TPInstantActivateGiftVIPEvent.name : @[mixpanel,],
                      TPActionsOnGiftVIPPopupEvent.name : @[mixpanel,],
                      TPAddressBookSyncEvent.name: @[mixpanel,],
                      TPAddressBookStarPlaceReplaceEvent.name: @[mixpanel,],
                      TPAddplacePageEvent.name: @[mixpanel,],
                      TPASavePlaceEvent.name: @[mixpanel,],
                      TPNewAddressBookResultEvent.name: @[mixpanel,],
                      TPAddressBookListPageEvent.name: @[mixpanel,],
                      TPAddressBookEditPlacePageEvent.name: @[mixpanel,],
                      TPCreateListEvent.name: @[mixpanel,],
                      TPEditListEvent.name: @[mixpanel,],
                      TPSavedPopupDisappearEvent.name: @[mixpanel,],
                      TPPPublisherViewEvent.name : @[mixpanel,],
                      TPPPublisherActionEvent.name : @[mixpanel,],
                      TPAddressbookGuideEvent.name : @[mixpanel,],
                      TPFreeTrialExpirationNotificationResultEvent.name : @[mixpanel,],
                      TPPNavigationguideShowEvent.name : @[mixpanel,],
                      TPPActionsOnNavigationGuideEvent.name : @[mixpanel,],
                      TPPQuitVIPPurchasePageEvent.name : @[mixpanel,],
                      TPPReviewPageActionEvent.name : @[mixpanel,],
                      TPPReviewPageViewEvent.name : @[mixpanel,],
                      TPPReviewBannerShowEvent.name : @[mixpanel,],
                      TPPReviewBannerResultEvent.name : @[mixpanel,],
                      TPPRateUsAppResultEvent.name : @[mixpanel,],
                      TPPMoreWaystoContributeEvent.name : @[mixpanel,],
                      TPPNewAddressBookResultEvent.name : @[mixpanel,],
                      TPQaNiceAnswerViewEvent.name : @[mixpanel,],
                      TPQaNiceAnswerActionEvent.name : @[mixpanel,],
                      
                      TPPFleetScanPicClickEvent.name : @[mixpanel,],
                      TPPFleetScanEnterMultiSelectEvent.name : @[mixpanel,],
                      TPPFleetScanRearrangePicEvent.name : @[mixpanel,],
                      TPPFleetScanPreviewPDFClickEvent.name : @[mixpanel,],
                      TPPFleetScanSharePDFClickEvent.name : @[mixpanel,],
                      TPPFleetScanReuploadClickEvent.name : @[mixpanel,],
                      TPUgcActionEvent.name: @[mixpanel,],
                      TPUgcViewEvent.name: @[mixpanel,],
                      TPPReviewListPageViewEvent.name: @[mixpanel,],
                      TPPReviewListPageActionEvent.name: @[mixpanel,],
                      TPAskQuestionActionEvent.name: @[mixpanel,],
                      // voice package
                      EVENT_Voice_Package: @[mixpanel,],
                      EVENT_Voice_Package_Action: @[mixpanel,],
                      TPPTabBarEvent.name : @[mixpanel,],
                      TPPMorePageEvent.name : @[mixpanel,],
                      TPPOrderDetailsPageViewEvent.name : @[mixpanel,],
                      TPPOrderDetailsPageActionEvent.name : @[mixpanel,],
                      TPPRedemptionResultEvent.name : @[mixpanel,],
                      TPPRedemptionRequestActionEvent.name : @[mixpanel,],
                      AddNewPlaceAnalytics.name : @[mixpanel,],
                      TPPDocumentFolderShareFilesEvent.name : @[mixpanel,],
                      TPPDocumentFolderShareLinkCopyClickEvent.name : @[mixpanel,],
                      TPPDocumentFolderCreateNewFolderSuccessfullyEvent.name : @[mixpanel,],
                      TPPDocumentFolderUploadFileSuccessfullyEvent.name : @[mixpanel,],
                      TPPDocumentFolderDownloadClickEvent.name : @[mixpanel,],
                      TPPDocumentFolderEditFileSaveClickEvent.name : @[mixpanel,],
                      TPPDocumentFolderMoveToSelectedFolderClickEvent.name : @[mixpanel,],
                      TPPTripDocumentScanDocClickEvent.name : @[mixpanel,],
                      TPPTripDocumentChooseUploadMethodEvent.name : @[mixpanel,],
                      TPPTripDocumentChooseDocTypeEvent.name : @[mixpanel,],
                      TPPTripDocumentUploadSuccessfulEvent.name : @[mixpanel,],
                      
                      // Share Trip 
                      TPPShareDrawerInputBoxClickEvent.name: @[mixpanel],
                      TPPShareDrawerRecentContactClickEvent.name: @[mixpanel],
                      TPPShareDrawerAddContactClickEvent.name: @[mixpanel],
                      TPPShareDrawerShareMethodClickEvent.name: @[mixpanel],
                      TPPShareContactShareWithClickEvent.name: @[mixpanel],
                      TPPShareContactSelectPeopleClickEvent.name: @[mixpanel],
                      TPPShareDrawerPageViewEvent.name: @[mixpanel],
                      TPPShareContactPageViewEvent.name: @[mixpanel],
                      TPPShareContactPermissionResultEvent.name: @[mixpanel],
                      TPPShareContactShareEvent.name: @[mixpanel],
                      TPPShareContactActiveShareLinkResultEvent.name: @[mixpanel],
                      TPPShareContactShareResultEvent.name: @[mixpanel],
                      
					  // generate by script at 2022-07-18 14:13:37
					  TPPMydocMoveFilesEvent.name: @[mixpanel],
					  TPPMydocEditFilesEvent.name: @[mixpanel],
					  TPPMydocDownloadFilesEvent.name: @[mixpanel],
					  TPPMydocShareLinkEvent.name: @[mixpanel],
					  TPPMydocShareFilesEvent.name: @[mixpanel],
					  TPPMydocCreateNewFolderEvent.name: @[mixpanel],
					  TPPMydocUploadFilesEvent.name: @[mixpanel],
					  // generate by script at 2022-07-18 14:15:00
					  TPPMydocMoveFilesEvent.name: @[mixpanel],
					  TPPMydocEditFilesEvent.name: @[mixpanel],
					  TPPMydocDownloadFilesEvent.name: @[mixpanel],
					  TPPMydocShareLinkEvent.name: @[mixpanel],
					  TPPMydocShareFilesEvent.name: @[mixpanel],
					  TPPMydocCreateNewFolderEvent.name: @[mixpanel],
					  TPPMydocUploadFilesEvent.name: @[mixpanel],
					  // generate by script at 2022-07-18 14:16:43
					  TPPMydocMoveFilesEvent.name: @[mixpanel],
					  TPPMydocEditFilesEvent.name: @[mixpanel],
					  TPPMydocDownloadFilesEvent.name: @[mixpanel],
					  TPPMydocShareLinkEvent.name: @[mixpanel],
					  TPPMydocShareFilesEvent.name: @[mixpanel],
					  TPPMydocCreateNewFolderEvent.name: @[mixpanel],
					  TPPMydocUploadFilesEvent.name: @[mixpanel],
					  // generate by script at 2022-07-18 14:17:06
					  TPPMydocMoveFilesEvent.name: @[mixpanel],
					  TPPMydocEditFilesEvent.name: @[mixpanel],
					  TPPMydocDownloadFilesEvent.name: @[mixpanel],
					  TPPMydocShareLinkEvent.name: @[mixpanel],
					  TPPMydocShareFilesEvent.name: @[mixpanel],
					  TPPMydocCreateNewFolderEvent.name: @[mixpanel],
					  TPPMydocUploadFilesEvent.name: @[mixpanel],
					  // generate by script at 2022-07-18 14:19:05
					  TPPMydocMoveFilesEvent.name: @[mixpanel],
					  TPPMydocEditFilesEvent.name: @[mixpanel],
					  TPPMydocDownloadFilesEvent.name: @[mixpanel],
					  TPPMydocShareLinkEvent.name: @[mixpanel],
					  TPPMydocShareFilesEvent.name: @[mixpanel],
					  TPPMydocCreateNewFolderEvent.name: @[mixpanel],
					  TPPMydocUploadFilesEvent.name: @[mixpanel],
					  // generate by script at 2022-07-18 14:22:39
					  TPPMydocMoveFilesEvent.name: @[mixpanel],
					  TPPMydocEditFilesEvent.name: @[mixpanel],
					  TPPMydocDownloadFilesEvent.name: @[mixpanel],
					  TPPMydocShareLinkEvent.name: @[mixpanel],
					  TPPMydocShareFilesEvent.name: @[mixpanel],
					  TPPMydocCreateNewFolderEvent.name: @[mixpanel],
					  TPPMydocUploadFilesEvent.name: @[mixpanel],
					  };
	}
	return self;
}

+ (void)startup:(NSDictionary *)launchOptions {
    
	for( id<AnalyticsProvider> provider in [AnalyticsManager sharedIstance].providers ) {
		[provider startup:launchOptions];
	}
}

+ (void)enterForeground {

	for( id<AnalyticsProvider> provider in [AnalyticsManager sharedIstance].providers ) {
		[provider enterForeground];
	}

	//===
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithDictionary:@{appState: appStateFreshStart}];
    [AnalyticsManager logEvent:EVENT_APP_START parameters:parameters];
}

+ (void)enterBackground {
	
	for( id<AnalyticsProvider> provider in [AnalyticsManager sharedIstance].providers ) {
		[provider enterBackground];
	}
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    paramsDict[appState] = appStateSuspend;
    NSNumber *apptime = [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970] - [UserSettings shared].userAppStartTime];
    NSNumber *tripTime = [NSNumber numberWithDouble:[UserSettings shared].userAppTripPlannerTime];
    NSString *logModule = [NSUserDefaults.standardUserDefaults stringForKey:@"LogMudule"];
    NSNumber *logUploadTime = [NSUserDefaults.standardUserDefaults objectForKey:@"AdLogUploadDate"];
    if (apptime) {
        paramsDict[@"Running Time"] = apptime;
    }
    if (tripTime) {
        paramsDict[@"Navigation Time"] = tripTime;
    }
    if (logModule) {
        paramsDict[@"Log Module"] = logModule;
    }
    if (logUploadTime) {
        paramsDict[@"Upload Time"] = logUploadTime;
    }
    
	//===

	[AnalyticsManager logEvent:EVENT_APP_END parameters:paramsDict];
}

+ (void)setPushDeviceToken:(NSData*)token {

	for( id<AnalyticsProvider> provider in [AnalyticsManager sharedIstance].providers ) {
		[provider setPushDeviceToken:token];
	}
}

+ (void)logScreen:(NSString*)screenName {

	if (![screenName isEqualToString:[AnalyticsManager sharedIstance].currentScreen]) {

		[AnalyticsManager sharedIstance].previousScreen = [AnalyticsManager sharedIstance].currentScreen;
	
		[AnalyticsManager sharedIstance].currentScreen = screenName;
	}
}

+ (NSString *)previousScreen {
    NSString *screenName = [AnalyticsManager sharedIstance].previousScreen;
    if (screenName == nil) {
        screenName = @"Unkown";
    }
    return screenName;
}

+ (NSString *)currentScreen {
    NSString *screenName = [AnalyticsManager sharedIstance].currentScreen;
    if (screenName == nil) {
        screenName = @"Unkown";
    }
    return screenName;
}

+ (void)logEvent:(NSString*)event {
	[AnalyticsManager logEvent:event parameters:nil];
}

+ (void)logEvent:(NSString*)event parameters:(NSDictionary*)parameters {

	//===

	NSMutableDictionary *generalParams = 0 == parameters.count ? @{}.mutableCopy : parameters.mutableCopy;

	if ([AnalyticsManager sharedIstance].currentScreen) {
		[generalParams setObject:[AnalyticsManager sharedIstance].currentScreen forKey:kScreenName];
	}

	if ([AnalyticsManager sharedIstance].previousScreen) {
		[generalParams setObject:[AnalyticsManager sharedIstance].previousScreen forKey:kPrevScreenName];
	}
    
    generalParams[@"Trip Length"] = [[TPPTripPlanRoutingSingleton sharedInstance] getRouteLength];
    
    generalParams[@"TripCardButtonText"] = [[TPPInterfaceStyleManager sharedInstance] abTestOTRTripCardButtonText];
    generalParams[@"Map View Type"] = (UserSettings.shared.mapType == kGMSTypeHybrid) ? @"Satellite" : @"Map";
    generalParams[@"Share Count"] = [[TPPTripPlanRoutingSingleton sharedInstance] getShareCount];
    generalParams[kActiveLayer] = [UserSettings shared].selectedMapLayer.name;
	generalParams[kActiveFilters] = AnalyticsManager.activeFilters;
	generalParams[kApp] = kAppName;
	generalParams[kSessionID] = @([[UserSettings shared] sessionNumber]);
//	generalParams[kOrientation] = isUILandscape ? kLandscape : kPortrait;
	generalParams[kLocationPermissions] = [self locationStatus];
	generalParams[kHasInternet] = @([[AFNetworkReachabilityManager sharedManager] isReachable]);
    //silver
	generalParams[kVIPMember] = @([[UserSettings shared] isVipActive]);
    generalParams[kVIPMemberUntil] = [[TPPPremiumMembership shared] silverVipExpirationDate];
    generalParams[kVIPMemberSince] = [[TPPPremiumMembership shared] silverVipStartedAtDate];
    generalParams[kVIPMemberTrial] = [[TPPPremiumMembership shared] silverTrialAnalytics];
    generalParams[kVIPMemberTrialUntil] = [[TPPPremiumMembership shared] silverVipTrialExpirationDate];
    //gold
    generalParams[kGoldMember] = @([[UserSettings shared] isSuperVipActive]);
    generalParams[kGoldMemberUntil] = [[TPPPremiumMembership shared] superVipExpirationDate];
    generalParams[kGoldMemberSince] = [[TPPPremiumMembership shared] superVipStartedAtDate];
    generalParams[KGoldMemberTrial] = [[TPPPremiumMembership shared] goldTrialAnalytics];
    generalParams[kGoldMemberTrialUntil] = [[TPPPremiumMembership shared] superVipTrialExpirationDate];
    //diamond
    generalParams[kDiamondMember] = @([[UserSettings shared] isDiamondVipActive]);
    generalParams[kDiamondMemberUntil] = [[TPPPremiumMembership shared] diamondVipExpirationDate];
    generalParams[kDiamondMemberSince] = [[TPPPremiumMembership shared] diamondVipStartedAtDate];
    generalParams[KDiamondMemberTrial] = [[TPPPremiumMembership shared] diamondTrialAnalytics];
    generalParams[kDiamondMemberTrialUntil] = [[TPPPremiumMembership shared] diamondVipTrialExpirationDate];
    //free trial
    generalParams[kFreeMemberSince] = [[TPPPremiumMembership shared] freeTrialStartedAtDate];
    generalParams[kFreeMemberUntil] = [[TPPPremiumMembership shared] freeTrialExpiredAtDate];

    generalParams[kForumAccess] = @([[TPPInterfaceStyleManager sharedInstance] shouldForumDisplay]);
    if ([UserSettings shared].isVipActive || [UserSettings shared].isSuperVipActive) {
        if ([UserSettings shared].isGiving) {
            generalParams[kFreeMembership] = @(YES).description;
        } else {
            generalParams[kFreeMembership] = @(false).description;
        }
    }

	generalParams[kCommonLoggedIn] = @([[UserSettings shared] isLoggedIn]);
    TPPUser *user = [TPPUser current];
    generalParams[kCommonSignUpDate] = user.createdAt ? user.createdAt : nil;
    generalParams[kHasdrivingprofile] = user.hasDrivingProfile;

	generalParams[kCommonHasTruckloads] = @([UserSettings shared].hasTruckloads);
    
    generalParams[kNotificationPermissions] = @([SharedController sharedInstance].isNotificationPermissions);
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"kIsShowNewTripPlannerVersion"] == nil) {
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"kIsShowNewTripPlannerVersion"];
    }
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"kIsShowNewTripPlannerVersion"]){
        if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isUseMultiyPointHosVersionKey"]){
            generalParams[kOTRUser] = @"OTR:True";
        }else{
            generalParams[kOTRUser] = @"OTR:False";
        }
    } else {
        generalParams[kOTRUser] = @"Non Internal";
    }

	
    if ([SharedController sharedInstance].locationManager.location.coordinate.latitude != 0 && [SharedController sharedInstance].locationManager.location.coordinate.longitude != 0) {
        generalParams[kUserLatitude]     = @([SharedController sharedInstance].locationManager.location.coordinate.latitude);
        generalParams[kUserLongitude]     = @([SharedController sharedInstance].locationManager.location.coordinate.longitude);
    }
    generalParams[kDeviceType]     = [UIDevice currentDevice].model;
    generalParams[kDeviceOS]        = [UIDevice currentDevice].systemVersion;

    NSInteger counter = [[NSUserDefaults standardUserDefaults] integerForKey:@"PushNotificationAttempts"];
	generalParams[kCanRequestNotificationPermissions] = @(counter >= 0);
    generalParams[kABUITest]     = @"B";

    generalParams[kDeviceIDSuffix] = [AnalyticsManager deviceIDSuffixWithLength:5];

    if (UserSettings.shared.isLoggedIn) {
        if ([[NSUserDefaults standardUserDefaults] valueForKey:@"key_tpPathfinderInformation"] == nil) {
            generalParams[kPathfinderStatus]     = @"Unaffiliated";
        }else{
            BOOL pathfinder = [[NSUserDefaults standardUserDefaults] boolForKey:@"key_tpPathfinderInformation"];
            if (pathfinder) {
                generalParams[kPathfinderStatus]     = @"Enrolled";
            }else{
                generalParams[kPathfinderStatus]     = @"Deactivated";
            }
        }
    }
    NSInteger trialCount = UserSettings.shared.freeTrialModel.eventGiftCount;
    generalParams[@"Gift count"] = @(trialCount);
    NSInteger eventCurrentGiftDays = UserSettings.shared.freeTrialModel.eventCurrentGiftDays;
    generalParams[@"Current gift days"] = @(eventCurrentGiftDays);
    NSString *eventStatus = UserSettings.shared.freeTrialModel.eventStatus;
    generalParams[@"Gift VIP status"] = eventStatus;
    NSString *giftVIPListType =  UserSettings.shared.freeTrialModel.giftVIPListType;
    generalParams[@"Gift VIP list type"] = giftVIPListType;
    // Share Trip - number of saved recent contacts
    NSInteger recentContactsCount = [[TPPShareContactCache shardInstance] numberOfRecentContacts];
    generalParams[@"Recent Contact"] = @(recentContactsCount);

    
    NSString* cpValue = UserSettings.shared.receiveGiftVIPFromCreateTrip;
    if (cpValue != nil) {
        generalParams[@"Receive Gift VIP page"] = cpValue;
    }
        
    generalParams[@"AB Test AddressBook"] = [[TPPInterfaceStyleManager sharedInstance] getAddressBookVersion];

    generalParams[@"AB Test New Me More"] = [[TPPInterfaceStyleManager sharedInstance] getNewMeMoreVersion];
    generalParams[@"AB Test Free Trial Expire Notification"] = [[TPPInterfaceStyleManager sharedInstance] getFreeTrialExpireNotiVersion];

    if ([NSThread currentThread].isMainThread) {
        generalParams[kOrientation] = isUILandscape ? kLandscape : kPortrait;
    }
	for( id<AnalyticsProvider> provider in [AnalyticsManager sharedIstance].eventsMap[event] ) {
		[provider logEvent:event parameters:generalParams];
	}
	
}

+ (NSString *)deviceIDSuffixWithLength:(NSUInteger)length {
    NSString *deviceID = [[UIDevice currentDevice] tpDeviceID];
    NSString *deviceIDSuffix = [deviceID substringFromIndex:[deviceID length] - length];
    return deviceIDSuffix;
}

+ (NSString *)locationStatus {
	CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
	NSString* resultString;
	switch (status) {
		case kCLAuthorizationStatusRestricted:
			//**FALLTHROUGH**
		case kCLAuthorizationStatusDenied:
			resultString = @"Declined";
			break;
		case kCLAuthorizationStatusAuthorizedAlways:
			resultString = @"Always";
			break;
		case kCLAuthorizationStatusAuthorizedWhenInUse:
			resultString = @"Accepted";
			break;
		case kCLAuthorizationStatusNotDetermined:
			resultString = @"Unsupported";
			break;
		default:
			break;
	}

	return resultString;
}

+ (void)logEvent:(NSString*)event parameters:(NSDictionary*)parameters increaseCounterById:(NSString*)counterId isContribution:(BOOL)isContribution {

	for( id<AnalyticsProvider> provider in [AnalyticsManager sharedIstance].eventsMap[event] ) {
		[provider increaseCounterById:counterId isContribution:isContribution];
	}

	[AnalyticsManager logEvent:event parameters:parameters];
}

+ (void)subsriptionsUpdated {

	for( id<AnalyticsProvider, NSObject> provider in [AnalyticsManager sharedIstance].providers ) {
        if ([provider respondsToSelector:@selector(subsriptionsUpdate:since:till:trial:trialUntil:)]) {
            [provider subsriptionsUpdate:[[TPPPremiumMembership shared] vipActive]
                                   since:[[TPPPremiumMembership shared] vipStartedAtDate]
                                    till:[[TPPPremiumMembership shared] vipExpirationDate]
                                   trial:[[TPPPremiumMembership shared] vipTrialAnalytics]
                              trialUntil:[[TPPPremiumMembership shared] vipTrialExpirationDate]];
        }
	}
}

#pragma mark - Helpers
@end
