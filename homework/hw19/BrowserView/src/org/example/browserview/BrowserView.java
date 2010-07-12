/***
 * @author: Charu Jain
 * 
 * Excerpted from "Hello, Android!",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/eband for more book information.
***/
package org.example.browserview;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnKeyListener;

import android.webkit.WebView;
// ...

import android.widget.Button;
import android.widget.EditText;


public class BrowserView extends Activity {
   
   private EditText urlText;
   private Button goButton;
   
   private WebView webView;
   // ...
   

   
   @Override
   public void onCreate(Bundle savedInstanceState) {
      // ...
      
      super.onCreate(savedInstanceState);
      setContentView(R.layout.main);

      // Get a handle to all user interface elements
      urlText = (EditText) findViewById(R.id.url_field);
      goButton = (Button) findViewById(R.id.go_button);
    
      webView = (WebView) findViewById(R.id.web_view);
      // ...
      

      // Setup event handlers
      goButton.setOnClickListener(new OnClickListener() {
         public void onClick(View view) {
            openBrowser();
         }
      });
      urlText.setOnKeyListener(new OnKeyListener() {
         public boolean onKey(View view, int keyCode, KeyEvent event) {
            if (keyCode == KeyEvent.KEYCODE_ENTER) {
               openBrowser();
               return true;
            }
            return false;
         }
      });
      
   }
   
   /*
    * I edited the BrowserView so that it is easier to check any wiki page on 
    * our course website. User just have to enter the page name. Example
    * homework3, StudentLed..
    */
  
   /** Open a browser on the URL specified in the text box */
   private void openBrowser() {
      webView.getSettings().setJavaScriptEnabled(true);
      // get the page name from the EditText view 'urlText'
      String pagename = urlText.getText().toString();
      //append the page name to the base url
      //base url for this example: "http://iceland.cs.brandeis.edu/webapps/"
      webView.loadUrl("http://iceland.cs.brandeis.edu/webapps/" + pagename);
   }
   
   
}
