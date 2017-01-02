package main;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
public class Runner {

	public static void main(String[] args) {
		//
		Timer timer = new Timer(true);
		
		TimerTask timerTask1 = new TimeReaderTask();	
		Date date = new Date();
		date.setMinutes(53);
		timer.scheduleAtFixedRate(timerTask1, date, 24*1000);
		
		
		// TODO Auto-generated method stub
		TimerTask timerTask = new RingTimerTask();
		
		timer.scheduleAtFixedRate(timerTask, 0, 10*1000);
		System.out.println("TimerTask начал выполнение");
        
        // вызываем cancel() через какое-то время
        try {
            Thread.sleep(120000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        timer.cancel();
        System.out.println("TimerTask прекращена");	
	}
}
