package cs.brandeis.edu.charu;

import android.app.Activity;
import android.os.Bundle;

/** 
 * 
 * @author Theodore
 * About class
 * Basically just sets the content view to about,
 * which is under the layouts
 * Overrides the onCreate method.
 */
public class About extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
			super.onCreate(savedInstanceState);
				setContentView(R.layout.about);
	}
}