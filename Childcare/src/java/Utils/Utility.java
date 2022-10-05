/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;


/**
 *
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

    public static void main(String[] args) {
        int[] a = parseStringArray("1:2:3", ":");
        System.out.println(a.length);
        for (int i : a) {
            System.out.println(i);
        }
    }
}
