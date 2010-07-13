package root.magicword;

import java.util.List;

import root.magicword.speech.SpeechGatheringActivity;
import root.magicword.speech.TextSpeakerAndroid;
import android.os.Bundle;
import android.speech.tts.TextToSpeech.OnUtteranceCompletedListener;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;


/**
 * 
 * @author Charu Jain
 * The class MagicWord extends the SpeechGatheringActivity to gather the speech 
 * and perform operations on the gathered input
 */

public class MagicWord extends SpeechGatheringActivity implements OnUtteranceCompletedListener
{
    private TextSpeakerAndroid speaker;
    //created a magic word
    String magic_word = "hi";
    private TextView result;
    
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        speaker = new TextSpeakerAndroid(this);
        
        Button speak = (Button)findViewById(R.id.bt_speak);
        speak.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
               gatherSpeech();
            }
        });
        
        result = (TextView)findViewById(R.id.tv_result);
    }
    
    @Override
    public void onUtteranceCompleted(String utteranceId)
    {
        //done speaking, execute some ui updates on the UIthread
    }
    
    
    /* Modification
     * added the 'add' command to replace the magic word
     */
    public void receiveWhatWasHeard(List<String> lastThingsHeard)
    {
    	//if user doesn't say anything
        if (lastThingsHeard.size() == 0)
        {
            speaker.say("Heard nothing", this);
        }
        else
        {
        	// if the user starts speaking with "add"
            String mostLikelyThingHeard = lastThingsHeard.get(0);
            //debugging
            Log.d("word",mostLikelyThingHeard);
            String word = "add";
            // if the user said "add"
            if (mostLikelyThingHeard.contains(word)){
            	// find the word after add            	
            	String next = mostLikelyThingHeard.split(" ")[1];
            	// speaker notifies the user the word to be added in magic words list
            	speaker.say("the word " + next + "added" , this);
                // for debugging              
            	Log.d("yes",mostLikelyThingHeard);          
            	//replace the magic word
            	magic_word = next;
            	
            }
            else 
            {
                // if the word said by user is the MagicWord
                if (mostLikelyThingHeard.equals(magic_word))
                {
                   speaker.say("You said the magic word!", this);
                }
                else
                {
                   speaker.say("It's not " + mostLikelyThingHeard + " try again", this);
                }
             }
       
        }result.setText("heard: " + lastThingsHeard);
    }

    
}