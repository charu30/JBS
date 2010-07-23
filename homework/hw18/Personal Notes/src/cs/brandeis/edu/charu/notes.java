package cs.brandeis.edu.charu ;

import android.app.Activity;
import android.os.Bundle;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
/**
 * 
 * @author Theodore
 * This is the Stuff Tracker Activity. It has a bunch of views that are
 * created and displayed when you start this.
 * 
 */
public class notes extends Activity implements OnClickListener{
	
    @Override
    /**
     * Creates the page that users see when they first start the app.
     * 
     * @param savedInstanceState a Bundle
     * @return void
     */
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //set the contentView to the main.xml file in layouts.
        setContentView(R.layout.main);
        
        //Create a bunch of Views to contain the main screen buttons
        //assign clickListeners to each of the buttons, so when they click,
        //depending on the ID of the button, it will perform differently
        View myButton = findViewById(R.id.my_button);
        myButton.setOnClickListener(this);
        View newButton = findViewById(R.id.new_button);
        newButton.setOnClickListener(this);
        View aboutButton = findViewById(R.id.about_button);
        aboutButton.setOnClickListener(this);
        View exitButton = findViewById(R.id.exit_button);
        exitButton.setOnClickListener(this);
    }
   
    /**
     * Handles the ClickListeners assigned to the buttons. 
     * Goes into the switch on (v.getID()) and starts an activity based on
     * the ID of v
     * @param v A view
     * @return void
     */
    public void onClick(View v)
    {
    	//switch statement takes in an ID for a view
    	switch(v.getId())
    	{
    		//if the case is about_button
    		case R.id.about_button:
    			//create a new intent with the About.class and startActivity on it.
    			Intent i= new Intent(this, About.class);
    			startActivity(i);
    			break;
    		//if the case is exit_button
    		case R.id.exit_button:
    			//finish() exits the app
    			finish();
    			break;
    		case R.id.new_button:
    			
    			Intent intent=new Intent(this, Draw.class);
    			startActivity(intent);
    			break;
    		
    	}
    	
    }
    /**
     * onCreateOptionsMenu
     * Creates a menu when the menu button is pressed on android phone
     * 
     * @param menu A Menu
     * @return boolean true
     */
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
    	super.onCreateOptionsMenu(menu);
    	MenuInflater inflater = getMenuInflater();
    	//inflate the menu when the button is pressed
    	inflater.inflate(R.menu.menu, menu);
    	return true;
    }
    
    /**
     * onOptionsItemSelected
     * If an option is selected from the menu screen it goes here.
     * Based on the ID of the item passed in, it will start the
     * activity corresponding to that ID.
     * 
     * @param item A MenuItem
     * @return boolean true or false depending on whether something was clicked.
     * 
     */
    public boolean onOptionsItemSelected(MenuItem item) {
    	switch (item.getItemId()) {
    	//if the ID of the menu item clicked is settings, it goes here
    	case R.id.settings:
    	//starts a new activity on this and the Prefs.class
    	startActivity(new Intent(this, Prefs.class));
    	return true;
    	}
    	return false;
    }	
}