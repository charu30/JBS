/**
 * @author Charu Jain
 * Homework 16: Prework in Java
 * Description: Secret Santa
 * The program choose a Secret Santa for every name in the list of people provided. 
 * A person cannot be their own Secret Santa, also people in the same family to be Santas for each other
 * 
 */

	import java.io.BufferedReader;
	import java.io.FileReader;
	import java.util.ArrayList;
	import java.util.Random;
	import java.util.regex.Matcher;
	import java.util.regex.Pattern;

	public class example {
  
		/** variables to store first name, last name and email address of people */
		static ArrayList <String> first = new ArrayList<String>(); 
		static ArrayList <String> last = new ArrayList<String>(); 
		static ArrayList <String> email = new ArrayList<String>(); 
		
		/** to store secret santa */
		static ArrayList <String> secret_santa = new ArrayList<String>();
		/** number of people in the list provided */
		static int count;
		
	
	  public static void main(String args[]) {
		  /** 
		   * @
		   * @throws Exception
		   */
	    try {
	    
	      /** Open a file 
	       * as passed on command line or eclipse arguments configuration"	
	       */
	      FileReader fr = new FileReader(args[0]);
	      /** read the file */ 
	      BufferedReader br = new BufferedReader(fr);
	      String s;
	      /** create a regex to find first, last name and email address of persons" */
	      Pattern pattern = Pattern.compile("([A-Z][a-z]+) ([A-Z][a-z]+) <([a-z]+@[a-z]+.+)>");
	      /** For every line in the file */
	      while((s = br.readLine()) != null){
	    	 /** Find all the possible matches */ 
	    	 Matcher matcher = pattern.matcher(s);
	    	 while (matcher.find()) {
	    		first.add(matcher.group(1));
	 			last.add(matcher.group(2));
	 			email.add(matcher.group(3));
	 		}
	      }
	      
	      count = first.size();
	      for (int i=0;i<count;i++){
	  	   	find_santa(first.get(i),i);
	  	  }
	      
	      fr.close(); 
	  	  System.out.print(secret_santa);
	  }
	  catch(Exception e) {
	    System.out.println("Exception: " + e);
	  }
}
	  
	  public static void find_santa(String name, int index) {
		 /**
		  * @param String, Integer
		  * This function finds the secret santa for a person  
		  *  
		  */
		  char has_santa = 'n';
		  int is_santa[];
		  is_santa = new int[count];
		  while (has_santa == 'n') {
			  /* pick a random number */
			  Random random = new Random();
			  int ind = random.nextInt(count);
			  /** to indicate that a person has been checked to be a santa */
			  String i = first.get(ind);
			  /** if a person is not a santa */ 
			  if (is_santa[ind] != 1) {
			  	/**if family name of person and the candidate santa is not same */
			   	if (last.get(first.indexOf(i)) != last.get(index)) {
			       String santa;
			       santa = i + " " + last.get(first.indexOf(i)); 
				   /** assign a santa */
			       secret_santa.add(santa);
				  /** change has_santa to 'yes' */
			       has_santa = 'y';
				   is_santa[ind] = 1;
			    }
			 }
			    
		  }   
			  
	  }
		  
	}
	    
