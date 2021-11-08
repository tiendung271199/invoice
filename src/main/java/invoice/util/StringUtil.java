package invoice.util;

public class StringUtil {
	
	public static String spaceToDash(String str) {
		return str.replaceAll("\\s", "-");
	}

	public static String dashToSpace(String str) {
		return str.replaceAll("-", " ");
	}

	public static String getDateBegin(int month, int year) {
		StringBuilder sb = new StringBuilder();
		sb.append(Integer.toString(year)).append("-").append(formatDate(month)).append("-01");
		return sb.toString();
	}

	public static String getDateEnd(int month, int year) {
		int day = timSoNgayTrongThang(month, year);
		StringBuilder sb = new StringBuilder();
		sb.append(Integer.toString(year)).append("-").append(formatDate(month)).append("-")
				.append(Integer.toString(day)).append(" 23:59:59");
		return sb.toString();
	}

	public static int timSoNgayTrongThang(int month, int year) {
		int day = 0;
		switch (month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			day = 31;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			day = 30;
			break;
		case 2:
			if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
				day = 29;
			} else {
				day = 28;
			}
			break;
		}
		return day;
	}

	public static String formatDate(int n) {
		String kq = Integer.toString(n);
		if (kq.length() == 1) {
			kq = "0" + kq;
		}
		return kq;
	}

}
