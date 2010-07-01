package edu.brandeis.cs.charu;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.view.View;
import android.view.View.OnClickListener;

public class Math extends Activity implements OnClickListener {
	Button find;
	EditText a;
	EditText b;
	EditText resultText;

    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        find = (Button) findViewById(R.id.find);
        a = (EditText) findViewById(R.id.aval);
        b = (EditText) findViewById(R.id.bval);
        resultText = (EditText) findViewById(R.id.resultText);
        
        /** set the listener for 'find' button */
        find.setOnClickListener(this);
    }
   
    public void onClick(View v){
    	
    	String s = a.getText().toString();
    	/** Convert String into Integer */
    	Integer num1 = Integer.parseInt(s);
    	System.out.print(num1);
    	String s2 = b.getText().toString();
    	Integer num2 = Integer.parseInt(s2);
    	Integer ans = num1 + num2 ;
    	System.out.print(ans);
    	/** Set the resultText view to be ans */
    	resultText.setText(String.valueOf(ans));
    }
}

