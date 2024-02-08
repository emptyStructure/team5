package com.team5.util;

import java.util.Random;

public class RandomCodeGenerator {
//	public static void main(String[] args) {
//		String code = RandomCodeGenerator.randomCode();
//		MailApp.gmailSend("kgb4232@naver.com", code);
//	}
	
    public static String randomCode() {
    	String result = "";
        // 랜덤 코드를 저장할 문자열 변수
        StringBuilder code = new StringBuilder();
        
        // 랜덤한 길이의 6글자 코드 생성
        for (int i = 0; i < 6; i++) {
            // 랜덤하게 알파벳 소문자, 대문자, 숫자 선택
            int choice = new Random().nextInt(3);
            char randomChar;
            switch (choice) {
                case 0:
                    randomChar = (char) ('A' + new Random().nextInt(26)); // 알파벳 대문자
                    break;
                case 1:
                    randomChar = (char) ('a' + new Random().nextInt(26)); // 알파벳 소문자
                    break;
                default:
                    randomChar = (char) ('0' + new Random().nextInt(10)); // 숫자
            }

            // 코드에 추가
            code.append(randomChar);
        }
        
        // 생성된 코드 출력
        result = code.toString();
        return result;
    }
}

