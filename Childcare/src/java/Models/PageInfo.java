/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class PageInfo {
    private int pageindex;
    private int pagesize;
    private int totalpage;
    private int totalrecords;

    public PageInfo() {
    }

    public PageInfo(int pageindex, int pagesize, int totalpage, int totalrecords) {
        this.pageindex = pageindex;
        this.pagesize = pagesize;
        this.totalpage = totalpage;
        this.totalrecords = totalrecords;
    }
    
    public PageInfo(int pageindex, int pagesize, int totalrecords) {
        this.pageindex = pageindex;
        this.pagesize = pagesize;
        this.totalrecords = totalrecords;
    }
    
    public void calc(){
        pageindex = Math.max(pageindex, 1);
        totalpage = (totalrecords % pagesize == 0) ? (totalrecords / pagesize) : (totalrecords / pagesize) + 1;
        pageindex = Math.min(pageindex, totalpage);
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
    
    

}
