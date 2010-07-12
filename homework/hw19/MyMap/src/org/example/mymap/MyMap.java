/***
 *author: Charu Jain
 *Homework 19a: MapView
 Excerpted from "Hello, Android!",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/eband for more book information.
***/

package org.example.mymap;

import android.os.Bundle;
import android.view.MotionEvent;
import android.widget.Toast;

import com.google.android.maps.GeoPoint;
import com.google.android.maps.MapActivity;
import com.google.android.maps.MapController;
import com.google.android.maps.MapView;
import com.google.android.maps.MyLocationOverlay;
import com.google.android.maps.Overlay;

import java.util.*;

public class MyMap extends MapActivity {
   private MapView map;
   private MapController controller;
   MapView mapView; 
   MapController mc;
   GeoPoint p;
   
   
   
     @Override
   public void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.main);
      initMapView();
      initMyLocation();
            
   }
   
   //Modification: Display the street view of a location on map 
    
   /** Find and initialize the map view. */
   private void initMapView() {
      map = (MapView) findViewById(R.id.map);
      controller = map.getController();
      //change the view of map to street view
      map.setStreetView(true);
      //Set  the coordinates
      String coordinates[] = {"42.368089","-71.258698"};
      double lat = Double.parseDouble(coordinates[0]);
      double lng = Double.parseDouble(coordinates[1]);
      // Find the geopoint
      p = new GeoPoint(
          (int) (lat * 1E6), 
          (int) (lng * 1E6));
      //set the zoom 
      controller.setZoom(17);
      controller.animateTo(p);
      map.invalidate();
      map.setBuiltInZoomControls(true);
      
   }
   
   /** Start tracking the position on the map. */
   private void initMyLocation() {
      final MyLocationOverlay overlay = new MyLocationOverlay(this, map);
      overlay.enableMyLocation();
      //overlay.enableCompass(); // does not work in emulator
      overlay.runOnFirstFix(new Runnable() {
         public void run() {
            // Zoom in to current location
            controller.setZoom(8);
            controller.animateTo(overlay.getMyLocation());
         }
      });
      map.getOverlays().add(overlay);
   }
   

   
   @Override
   protected boolean isRouteDisplayed() {
      // Required by MapActivity
      return false;
   }
}
