package main;

import java.util.TimerTask;

public class TimeReaderTask extends TimerTask{

	private static final String FILENAME = "timetable.txt";
	@Override
	public void run() {
		// TODO Auto-generated method stub
		TimeTableReader.readTimes(FILENAME);
		System.out.println("Read");
	}

}
