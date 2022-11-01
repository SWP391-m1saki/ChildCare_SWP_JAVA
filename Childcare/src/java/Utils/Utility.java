/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import jakarta.servlet.http.HttpServletRequest;

import java.time.LocalDate;
import java.time.Year;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * @author Admin
 */
public class Utility {


    public static int[] parseStringArray(String txt, String split) {
        if (txt != null && txt.length() != 0) {
            String[] raw_Arr = txt.split(split);
            ArrayList<Integer> list = new ArrayList<>();
            for (String raw_Arr1 : raw_Arr) {
                try {
                    int n = Integer.parseInt(raw_Arr1.trim());
                    list.add(n);
                } catch (NumberFormatException e) {
                }
            }
            int[] arr = new int[list.size()];
            for (int i = 0; i < list.size(); i++) {
                arr[i] = list.get(i);
            }
            return arr;
        }
        return new int[0];
    }

    public static String getRandomCode() {
        Random rnd = new Random();
        return String.format("%09d", rnd.nextInt(1000000000));
    }

    public static int parseIntParameter(String raw_input, int defaultValue, int minValue) {
        raw_input = (raw_input == null || raw_input.length() == 0) ? String.valueOf(defaultValue) : raw_input;
        int number;
        try {
            number = Integer.parseInt(raw_input);
            if (number < minValue) {
                number = defaultValue;
            }
        } catch (NumberFormatException numberFormatException) {
            number = defaultValue;
        }
        return number;
    }

    public static int parseIntParameter(String raw_input, int defaultValue) {
        raw_input = (raw_input == null || raw_input.length() == 0) ? String.valueOf(defaultValue) : raw_input;
        int number;
        try {
            number = Integer.parseInt(raw_input);
        } catch (NumberFormatException numberFormatException) {
            number = defaultValue;
        }
        return number;
    }

    public static double parseDoubleParameter(String raw_input, double defaultValue) {
        raw_input = (raw_input == null || raw_input.length() == 0) ? String.valueOf(defaultValue) : raw_input;
        double number;
        try {
            number = Double.parseDouble(raw_input);
        } catch (NumberFormatException numberFormatException) {
            number = defaultValue;
        }
        return number;
    }

    public static boolean parseBooleanParameter(String raw_input, boolean defaultValue) {
        raw_input = (raw_input == null || raw_input.length() == 0) ? String.valueOf(defaultValue) : raw_input;
        boolean value;
        try {
            value = Boolean.parseBoolean(raw_input);
        } catch (NumberFormatException numberFormatException) {
            value = defaultValue;
        }
        return value;
    }

    public static int parseIntParameter(String raw_input, int defaultValue, int minValue, int maxValue) {
        raw_input = (raw_input == null || raw_input.length() == 0) ? String.valueOf(defaultValue) : raw_input;
        int number;
        try {
            number = Integer.parseInt(raw_input);
            if (number < minValue || number > maxValue) {
                number = defaultValue;
            }
        } catch (NumberFormatException numberFormatException) {
            number = defaultValue;
        }
        return number;
    }

    public static int[] stringArrToIntArr(String[] raw_list) {
        int[] list = new int[raw_list.length];
        for (int i = 0; i < raw_list.length; i++) {
            try {
                list[i] = Integer.parseInt(raw_list[i]);
            } catch (NumberFormatException numberFormatException) {
                list[i] = -1;
            }
        }
        return list;
    }

    public static void pagingServlet(HttpServletRequest request, String nrppContext, int defaultPageSize, int totalrecords) {
        int[] nrppArr = Utility.parseStringArray(nrppContext, ",");
        request.setAttribute("nrppArr", nrppArr);
        int pagesize = parseIntParameter(request.getParameter("pagesize"), defaultPageSize);
        int pageindex = parseIntParameter(request.getParameter("page"), 1, 1);
//        int totalrecords = dao.getProductsByCate(p_cid).size();  // total record of p_cid category
        int totalpage = (totalrecords % pagesize == 0) ? (totalrecords / pagesize) : (totalrecords / pagesize) + 1;
        pageindex = pageindex > 1 ? pageindex : 1;
        pageindex = pageindex < totalpage ? pageindex : totalpage;
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalrecords", totalrecords);
    }

    public static boolean isValidPassword(String password, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
//        String patternn = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{6,30}";
    }

    public static boolean validateString(String password, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
//        String patternn = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{6,30}";
    }

    public static int getCurrentWeekNumber() {
        return Calendar.getInstance().get(Calendar.WEEK_OF_YEAR);
    }

    public static LocalDate getFirstDayOfWeek(int weekNumber) {
        return LocalDate
                .of(Year.now().getValue(), 2, 1)
                .with(WeekFields.of(Locale.getDefault()).getFirstDayOfWeek())
                .with(WeekFields.of(Locale.getDefault()).weekOfWeekBasedYear(), weekNumber)
                .plusDays(1);  // For VietNamese
    }

    public static LocalDate getLastDayOfWeek(LocalDate firstDateOfWeek) {
        return firstDateOfWeek.plusDays(6);  // For VietNamese
    }
}
