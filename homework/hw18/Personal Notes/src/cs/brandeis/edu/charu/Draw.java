package cs.brandeis.edu.charu;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.os.Bundle;
import android.view.View;

/**
 * 
 * @author Theodore
 * Draw.java
 * This class is supposed to draw a circle
 */
public class Draw extends Activity {
	GraphicsView graphicview;
	@Override
	/**
	 * onCreate
	 * @param savedInstancestate 
	 * Overrides the onCreate method 
	 * Sets the contentView to graphicView class
	 */
	protected void onCreate(Bundle savedInstanceState) {
				super.onCreate(savedInstanceState);
				graphicview=new GraphicsView(this);
				//set the content view to graphicview, which is defined below
				setContentView(graphicview);
	}
	
	/**
	 * 
	 * @author Theodore
	 * GraphicsView class
	 * A view for the graphic that I'm drawing
	 */
	private class GraphicsView extends View {
		/**
		 * 
		 * @param context
		 * Calls the super method on context
		 */
		public GraphicsView(Context context) {
			super(context);
		}
		@Override
		/**
		 * onDraw
		 * @param canvas A canvas for drawing
		 * Draws the circle onto the canvas
		 */
		protected void onDraw(Canvas canvas) {
			super.onDraw(canvas);
			Paint paint=new Paint();
			paint.setColor(Color.LTGRAY);
			canvas.drawCircle(150,150,50, paint);
		}
		}
}
