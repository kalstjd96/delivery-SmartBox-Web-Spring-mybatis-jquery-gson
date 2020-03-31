package com.cap.delivery.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
    
    //이 이부분은 static이기때문에 처음부터 메모리에 올라가 있다.
    //하단의 메서드를 호출하게되면 올라온 파일의 타입 이름을 대문자로 변경하여 key로 준다.
    //mediaMap.get은 key값을 받아서 vaule를 리턴한다.
    //해당되는 key(JPG,GIF,PNG)가 없으면 null을 리턴
    private static Map<String,MediaType> mediaMap;
    
    //클래스를 로딩할 때 제일 먼저 실행되는 코드
    //이미지 파일에 해당되는 확장자만 받기 위해 key와 Mediatype value 등록
    static {
        mediaMap = new HashMap<String, MediaType>();
        mediaMap.put("JPG",MediaType.IMAGE_JPEG);
        mediaMap.put("GIF",MediaType.IMAGE_GIF);
        mediaMap.put("PNG",MediaType.IMAGE_PNG);
    }
    //UploadFileUtils.java에서 호출하여 이미지파일이 등록됐는지 여부 체크해줌
    public static MediaType getMediaType(String type) {
        // toUpperCase() 대문자로 변경
        return mediaMap.get(type.toUpperCase());
    }
}