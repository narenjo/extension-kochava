package extension.kochava;

#if openfl_legacy
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end

import haxe.Json;

class Kochava {
    public static final EVENT_TYPE_ACHIEVEMENT = 1;
    public static final EVENT_TYPE_ADD_TO_CART = 2;
    public static final EVENT_TYPE_ADD_TO_WISH_LIST = 3;
    public static final EVENT_TYPE_CHECKOUT_START = 4;
    public static final EVENT_TYPE_LEVEL_COMPLETE = 5;
    public static final EVENT_TYPE_PURCHASE = 6;
    public static final EVENT_TYPE_RATING = 7;
    public static final EVENT_TYPE_REGISTRATION_COMPLETE = 8;
    public static final EVENT_TYPE_SEARCH = 9;
    public static final EVENT_TYPE_TUTORIAL_COMPLETE = 10;
    public static final EVENT_TYPE_VIEW = 11;
    public static final EVENT_TYPE_AD_VIEW = 12;
    public static final EVENT_TYPE_PUSH_RECEIVED = 13;
    public static final EVENT_TYPE_PUSH_OPENED = 14;
    public static final EVENT_TYPE_CONSENT_GRANTED = 15;
    public static final EVENT_TYPE_DEEP_LINK = 16;
    public static final EVENT_TYPE_AD_CLICK = 17;
    public static final EVENT_TYPE_START_TRIAL = 18;
    public static final EVENT_TYPE_SUBSCRIBE = 19;

    public static final PARAM_ACTION = "action";
    public static final PARAM_BACKGROUND = "background";
    public static final PARAM_CHECKOUT_AS_GUEST = "checkout_as_guest";
    public static final PARAM_COMPLETED = "completed";
    public static final PARAM_CONTENT_ID = "content_id";
    public static final PARAM_CONTENT_TYPE = "content_type";
    public static final PARAM_CURRENCY = "currency";
    public static final PARAM_DATE = "now_date";
    public static final PARAM_DESCRIPTION = "description";
    public static final PARAM_DESTINATION = "destination";
    public static final PARAM_DURATION = "duration";
    public static final PARAM_END_DATE = "end_date";
    public static final PARAM_ITEM_ADDED_FROM = "item_added_from";
    public static final PARAM_LEVEL = "level";
    public static final PARAM_LTV_AD_CAMPAIGN_ID = "ad_campaign_id";
    public static final PARAM_LTV_AD_CAMPAIGN_NAME = "ad_campaign_name";
    public static final PARAM_LTV_AD_GROUP_ID = "ad_group_id";
    public static final PARAM_LTV_AD_GROUP_NAME = "ad_group_name";
    public static final PARAM_LTV_AD_MEDIATION_NAME = "ad_mediation_name";
    public static final PARAM_LTV_AD_NETWORK_NAME = "ad_network_name";
    public static final PARAM_LTV_AD_PLACEMENT = "placement";
    public static final PARAM_LTV_AD_SIZE = "ad_size";
    public static final PARAM_LTV_AD_TYPE = "ad_type";
    public static final PARAM_MAX_RATING_VALUE = "max_rating_value";
    public static final PARAM_NAME = "name";
    public static final PARAM_ORDER_ID = "order_id";
    public static final PARAM_ORIGIN = "origin";
    public static final PARAM_PRICE = "price sum";
    public static final PARAM_QUANTITY = "quantity";
    public static final PARAM_RATING_VALUE = "rating_value";
    public static final PARAM_RECEIPT_ID = "receipt_id";
    public static final PARAM_REFERRAL_FROM = "referral_from";
    public static final PARAM_REGISTRATION = "registration_method";
    public static final PARAM_RESULTS = "results";
    public static final PARAM_SCORE = "score";
    public static final PARAM_SEARCH_TERM = "search_term";
    public static final PARAM_SPATIAL_X = "spatial_x";
    public static final PARAM_SPATIAL_Y = "spatial_y";
    public static final PARAM_SPATIAL_Z = "spatial_z";
    public static final PARAM_START_DATE = "start_date";
    public static final PARAM_SUCCESS = "success";
    public static final PARAM_URI = "uri";
    public static final PARAM_USER_ID = "user_id";
    public static final PARAM_USER_NAME = "user_name";
    public static final PARAM_VALIDATED = "validated";

    public static function sendEvent(eventType:Int, params:Map<String, String>):Void {
        #if !android
        trace("Not implemented");
        return;
        #else

        var fn = null;
        fn = JNI.createStaticMethod("org/haxe/extension/kochava/Kochava", "sendEvent", "(ILjava/lang/String;)V");


        var dyn = {};
		for (k in params.keys()) {
			Reflect.setField(dyn, k, params.get(k));
        }
        fn(eventType, Json.stringify(dyn));
        #end
    }
}