package com.dreamEMS.service;

import java.io.File;
import java.io.IOException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.sun.jna.Library;
import com.sun.jna.Native;

import lombok.extern.apachecommons.CommonsLog;

@CommonsLog
@Service
public class DllService {
	
	//Dll Interface
	public interface EmsDll extends Library{

		public int GetClearData();
		public int ExecPrint();
		public int ExecPrintEmsP();
		public int ExecPreview();
		public int GetPutems(String str);
		public int GetPutemsP(String str);
		public int ExecPrintEms();
		public int about();

	}
	
	public void call() throws IOException {
		
		
		String path = "c:\\abc\\TBarCode10.dll";
		  System.load(path);


		  path = "c:\\abc\\xpostgipyo.dll";
		  System.load(path);
	
	//Dll loading
			File file = new ClassPathResource("xpostgipyo.dll").getFile();
			log.info(file); 
		
			
			//System.setProperty("jna.library.path", "c:\\abc" );
			//log.info(System.getProperty("jna.library.path"));
			
			
			EmsDll dll = (EmsDll)Native.loadLibrary("xpostgipyo", EmsDll.class);
			Result result;


			result = ckeck(dll.GetClearData());
			System.out.println("clear list "+ result);

			String pData =	getTestData();

			result = ckeck(dll.GetPutemsP(pData));
			System.out.println("put ems data "+ result);/////

			result = ckeck(dll.ExecPrintEmsP());
			System.out.println("exec print "+ result);/////

		}

		public enum Result{
			SUCCESS, ERROR;
		}

		public static Result ckeck(int obj){
			switch (obj) {
			case 1: return Result.SUCCESS;
			default: return Result.ERROR;
			}
		}

		public static String getTestData() {
			return 	"GD700518236WW"		           //1. 우편물번호
					+ (char)30+"201212111235"       	         //2. 접수년월일시
					+ (char)30+"10186"                        //3. 우편용국기호
					+ (char)30+"011-123-1234"                 //4. 발송인연락처
					+ (char)30+"HONG GIL DONG" 	             //5. 발송인성명
					+ (char)30+"POSTNET Div. 3F KPIC Jayang-dong, Gwangjin-gu, Seoul, Korea" 	//6.발송인주소
					+ (char)30+"test@naver.com"               //7. 발송인이메일
					+ (char)30+"123-123"	 		                 //8. 발송인우편번호
					+ (char)30+"82-98-123-1234"               //9. 수취인연락처
					+ (char)30+"test name Tiantongyuan adewe deds"                    //10.수취인성명
					+ (char)30+"102, 14Unit,25Bldg.,East 2 District, Tiantongyuan,Changping-qu, Beijing,China" 	//11.수취인주소
					+ (char)30+"1223-123123"                  //12.수취인우편번호
					+ (char)30+"United State" 	               //13.수취국가
					+ (char)30+"US" 	                         //14.수취국약호
					+ (char)30+"goods1"		//15.내용품1
					+ (char)30+"1"         //16.개수1
					+ (char)30+"10"        //17.순중량1
					+ (char)30+"1.1"       //18.가격1
					+ (char)30+"hs1"       //19.HS코드1
					+ (char)30+"md1"       //20.생산지1
					+ (char)30+"goods2"    //21.내용품2
					+ (char)30+"2"         //22.개수2
					+ (char)30+"20"        //23.순중량2
					+ (char)30+"2.1"       //24.가격2
					+ (char)30+"hs2"       //25.HS코드2
					+ (char)30+"md2"       //26.생산지2
					+ (char)30+"goods3"    //27.내용품3
					+ (char)30+"3"         //28.개수3
					+ (char)30+"30"        //29.순중량3
					+ (char)30+"3.1"       //30.가격3
					+ (char)30+"hs3"       //31.HS코드3
					+ (char)30+"md3"       //32.생산지3
					+ (char)30+"goods4"    //33.내용품4
					+ (char)30+"4"         //34.개수4
					+ (char)30+"40"        //35.순중량4
					+ (char)30+"4.1"       //36.가격4
					+ (char)30+"hs4"       //37.HS코드4
					+ (char)30+"md4"       //38.생산지4
					+ (char)30+"12"        //39.개수(합계)
					+ (char)30+"50"        //40.순중량(합계)
					+ (char)30+"5.1"       //41.가격(합계)
					+ (char)30+ "1"       //42.상품구분 (91-서류,32-샘플,31-선물,1-상품))
					+ (char)30+"HongKD"    //43.발송인 서명
					+ (char)30+"500"       //44.중량
					+ (char)30+"25000"     //45.요금
					+ (char)30+"1"         //46.요금납부방법  (1-현금수납 ,2 - 요금수납)
					+ (char)30+" "         //47.현금수납시 감액여부 (감액 - "Y")
					+ (char)30+"posttest"  //48.담당자 서명
					+ (char)30+"Y"         //49.보험이용여부 (이용-"Y")
					+ (char)30+"20000"     //50.보험가액
					+ (char)30+ "1"    //51.구분 (1-EMS프리미엄,기타- 일반)
					+ (char)30+"Beijing"     //52.수취도시명
					+ (char)30+"중국"     //53.수취국가명(한글)
		      ;
		}

}
