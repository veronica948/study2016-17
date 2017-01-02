package main;

import java.util.Date;
import java.util.TimerTask;

public class RingTimerTask extends TimerTask{

	private Date nextTime;
	
	@Override
	public void run() {
		System.out.println("Ring");
	}

}
