/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import jakarta.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 * @author Admin
 * @param <T>
 */
public class PageInfo<T> {
    private int pageindex;
    private int pagesize;
    private int totalpage;
    private int totalrecords;

    public PageInfo() {
    }
    
    public PageInfo(int pageindex, int pagesize, int totalrecords) {
        this.pageindex = pageindex;
        this.pagesize = pagesize;
        this.totalrecords = totalrecords;
    }
    
    public void calc(){
        pageindex = pageindex > 1 ? pageindex : 1;
        totalpage = (totalrecords % pagesize == 0) ? (totalrecords / pagesize) : (totalrecords / pagesize) + 1;
        pageindex = pageindex < totalpage ? pageindex : totalpage;
    }

    public int getPageindex() {
        return pageindex;
    }

    public void setPageindex(int pageindex) {
        this.pageindex = pageindex;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public int getTotalpage() {
        return totalpage;
    }

    public void setTotalpage(int totalpage) {
        this.totalpage = totalpage;
    }

    public int getTotalrecords() {
        return totalrecords;
    }

    public void setTotalrecords(int totalrecords) {
        this.totalrecords = totalrecords;
    }
    
    public void pagination(HttpServletRequest request, List<T> filteredList, int[] nrppArr){
        request.setAttribute("nrppArr", nrppArr);
        pagesize = Utils.Utility.parseIntParameter(request.getParameter("pagesize"), 5);
        pageindex = Utils.Utility.parseIntParameter(request.getParameter("page"), 1);
        totalrecords = filteredList.size();  // total record of p_cid category
        calc();
        request.setAttribute("page", this);
    }

}
