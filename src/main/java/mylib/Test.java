package mylib;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	public static void main(String[] args) throws ParseException {
		Date date=new Date();
		System.out.println(new String(date.toString()));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		Date d=sdf.parse("20220103");
				System.out.println(sdf.format(d));
				
				SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
				String sdata=sdf2.format(d);
				System.out.println(sdf.format(new Date()));
				
				//아래는 오류발생 코드
				//SimpleDateFormat sdf3=new SimpleDateFormat("yyyyMMdd");
				//Date d2=new Date("2022-01-03");
				
				SimpleDateFormat sdf3=new SimpleDateFormat("yyyy년MM월dd일");
				System.out.println(sdf3.format(new Date()));
	}

}
