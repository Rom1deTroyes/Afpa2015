/**
 * 
 */
package air2Java.utils;

/**
 * @author Gilbert
 *
 */
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Rom1
 *
 */
public class Dates {

static String pattern = "yy-MM-dd HH:mm:ss" ;
static Date date ;
	
	/**
	 * UTILITAIRES DATE
	 */
	
	/**
	 * 
	 * @return String
	 */
	public String maDate(){
		SimpleDateFormat format = new SimpleDateFormat(pattern) ;
		return format.format(new Date()) ;		 
	}
	
	/**
	 *  Formate date
	 * @param date Date
	 * @return String
	 */
	public static String fromDate(Date date){
		SimpleDateFormat format = new SimpleDateFormat(pattern) ;
		return format.format(date) ;		 
	}
	
	
	/**
	 * Parse date
	 * @param dateString String
	 * @return Date
	 */
	public static Date toDate(String dateString){
		SimpleDateFormat format = new SimpleDateFormat(pattern) ;
		Date date = null;
		try {
			date = format.parse(dateString) ;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return date;
	}

	
	/**
	 * Convertit date java en date java
	 * @param dJava Date Java
	 * @return Date SQL
	 */
	public static java.sql.Date javaToSql(java.util.Date dJava) {
		return new java.sql.Date(dJava.getTime()) ;		
	}
	
	/**
	 * Conversion avec milli secondes
	 * Convertit date sql en java Depuis le JDK 5 ces dates sont compatibles 
	 * @param timestamp Timestamp SQL
	 * @return Date Java
	 */
	public static java.util.Date sqlToJava(java.sql.Timestamp timestamp) {
		java.util.Date dJava = new java.util.Date(timestamp.getTime() +
				timestamp.getNanos()/1000000);
		return dJava;
	}
	
	

	
	/**
	 * transforme yyyy-MM-dd en dd-MM-yyyy
	 * @param s yyyy-MM-dd
	 * @return dd-MM-yyyy
	 */
	public String yearEndian(String s) { 
		String year = s.substring(0, 4);
		String month = s.substring(5, 7);
		String day = s.substring(8, 10);
		System.out.println("Source AccessPool: " + day + "-" + month + "-"
				+ year);
		String ss = new String(day);
		ss = ss.concat("-");
		ss = ss.concat(month);
		ss = ss.concat("-");
		ss = ss.concat(year);
		return ss;
	}

	/** 
	 * @return pattern
	 */
	public String getPattern() {
		return pattern;
	}

	/**
	 * @param pattern pattern
	 */
	public void setPattern(String pattern) {
		Dates.pattern = pattern;
	}
	
//	/** TEST */
//	
//	public static void main(String[] args) {
//
//		Dates c = new Dates();
//		Date d = new Date();
//		System.out.println("/*********  Test Dates *********** ");
//		System.out.println("Date aujourd'hui: " + c.fromDate(d));
//
//		String d_ = "12/02/1945";
//		c.setPattern("dd/MM/yy");
//		System.out.println("Date " + c.toDate(d_) + " ou "
//				+ c.fromDate(c.toDate(d_)));
//
//	}
	
}
