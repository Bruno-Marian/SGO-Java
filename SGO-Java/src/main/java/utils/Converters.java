package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Converters {
	public static java.sql.Date DataConverter(String data) {
		try {
		String dateUpdated = data;
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
	     java.util.Date date = sdf.parse(dateUpdated);
	     return new java.sql.Date(date.getTime());
		} catch (ParseException e) {
			System.err.println(e.getMessage());
		}
		return null;
	}
}
