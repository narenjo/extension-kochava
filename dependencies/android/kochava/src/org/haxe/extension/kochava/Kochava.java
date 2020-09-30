package org.haxe.extension.kochava;

import android.content.pm.PackageItemInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;
import com.kochava.base.Tracker;
import com.kochava.base.Tracker.Configuration;

import org.json.JSONException;
import org.json.JSONObject;

import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

import java.util.Date;
import java.util.Iterator;


public class Kochava extends Extension {
    
    static final String TAG = "KOCHAVA-EXTENSION";

    /**
	 * Called when the activity is starting.
	 */
	public void onCreate (Bundle savedInstanceState) {
        
        PackageItemInfo info = null;
        try {
            info = mainContext.getPackageManager().getApplicationInfo(mainContext.getPackageName(), PackageManager.GET_META_DATA);
        }
        catch(PackageManager.NameNotFoundException e){
            e.printStackTrace();
        }
                
        if(info != null) {
            // Start the Kochava Tracker
            Tracker.configure(new Configuration(mainContext)
                    .setAppGuid(info.metaData.getString("org.haxe.extension.kochava.ApplicationId"))
                    //.setLogLevel(Tracker.LOG_LEVEL_DEBUG)
            );
        }
    }
    
    public static void sendEvent(int eventType, String parametersJson){

        Tracker.Event event = new Tracker.Event(eventType);
        try {
            JSONObject jsonObject = new JSONObject(parametersJson);
            event.addCustom(jsonObject);

		} catch (JSONException e) {
			Log.d(TAG, "JSONException: " + e.toString());
        }
        Tracker.sendEvent(event);
    }
    public static void sendEvent(String eventType, String parametersJson){

        Tracker.Event event = new Tracker.Event(eventType);
        try {
            JSONObject jsonObject = new JSONObject(parametersJson);
            event.addCustom(jsonObject);

        } catch (JSONException e) {
            Log.d(TAG, "JSONException: " + e.toString());
        }
        Tracker.sendEvent(event);
    }
}