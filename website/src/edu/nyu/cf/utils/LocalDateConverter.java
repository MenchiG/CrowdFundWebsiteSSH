package edu.nyu.cf.utils;


import org.apache.struts2.util.StrutsTypeConverter;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Map;

/**
 * Created by guomengqi on 5/6/17.
 */
public class LocalDateConverter extends StrutsTypeConverter{

    @Override
    public Object convertFromString(Map map, String[] strings, Class aClass) {
        if(strings == null || strings.length == 0) {
            return null;
        }
        if(aClass != LocalDate.class) {
            return null;
        }

        for(String s : strings) {
            try{
                return LocalDate.parse(s);
            } catch (DateTimeParseException e) {
                continue;
            }
        }
        return null;
    }

    @Override
    public String convertToString(Map map, Object o) {
        LocalDate localDate = (LocalDate) o;
        return localDate.toString();
    }
}
