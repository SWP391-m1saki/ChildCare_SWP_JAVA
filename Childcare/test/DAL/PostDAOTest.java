/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAL;

import Models.PageInfo;
import Models.Post;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ADMIN
 */
public class PostDAOTest {
    
    public PostDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

//    /**
//     * Test of getAll method, of class PostDAO.
//     */
//    @Test
//    public void testGetAll() {
//        System.out.println("getAll");
//        PostDAO instance = new PostDAO();
//        List<Post> expResult = null;
//        List<Post> result = instance.getAll();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
    /**
     * Test of load method, of class PostDAO.
     */
    @Test
    public void testLoadSuccess() {
        System.out.println("load");
        PostDAO instance = new PostDAO();
        instance.load();
        boolean expResult = true;
        boolean result = instance.load();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }
    

//    /**
//     * Test of get method, of class PostDAO.
//     */
//    @Test
//    public void testGet() {
//        System.out.println("get");
//        int id = 0;
//        PostDAO instance = new PostDAO();
//        Post expResult = null;
//        Post result = instance.get(id);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of loadMoreWithFilter method, of class PostDAO.
//     */
//    @Test
//    public void testLoadMoreWithFilter() {
//        System.out.println("loadMoreWithFilter");
//        int currentSize = 0;
//        int numberOfFetch = 0;
//        String searchTxt = "";
//        int cateId = 0;
//        PostDAO instance = new PostDAO();
//        List<Post> expResult = null;
//        List<Post> result = instance.loadMoreWithFilter(currentSize, numberOfFetch, searchTxt, cateId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of add method, of class PostDAO.
//     */
   @Test
    public void testAddTrue() {
        System.out.println("Test add true");
        Post t = new Post();
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(3);
     
        PostDAO instance = new PostDAO();
        boolean expResult = true;
        boolean result = instance.add(t);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testAddFalseTitle() {
        System.out.println("Test False Title");
        Post t = new Post();
        t.setDescription("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.add(t);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testAddDescriotionFalse() {
        System.out.println("Test Descripton False");
        Post t = new Post();
        t.setTitle("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.add(t);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testAddDetailFalse() {
        System.out.println("Test add Detail null");
        Post t = new Post();
        t.setTitle("Test");
        t.setDescription("Test");
        t.setImage("Test");
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.add(t);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testAddImageFalseNull() {
        System.out.println("Test add Image null");
        Post t = new Post();
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        t.setCateId(3);    
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.add(t);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testAddImageM250False() {
        System.out.println("Test Image more than 250 char");
        Post t = new Post();
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        String image = "";
        for (int i = 0; i < 260; i++) {
            image += "0123456789";
        }
        t.setImage(image);
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.add(t);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testAddCateL1() {
        System.out.println("Test add Cate less than 1");
        Post t = new Post();
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(0);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.add(t);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testAddCateM7() {
        System.out.println("Test add Cate more than 7");
        Post t = new Post();
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(8);
     
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.add(t);
        assertEquals(expResult, result);
        
    }
    

//    /**
//     * Test of update method, of class PostDAO.
//     */
//    @Test
//    public void testUpdate() {
//        System.out.println("update");
//        Post t = null;
//        PostDAO instance = new PostDAO();
//        boolean expResult = false;
//        boolean result = instance.update(t);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of delete method, of class PostDAO.
//     */
//    @Test
//    public void testDelete() {
//        System.out.println("delete");
//        Post t = null;
//        PostDAO instance = new PostDAO();
//        boolean expResult = false;
//        boolean result = instance.delete(t);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getPostsByPage method, of class PostDAO.
//     */
//    @Test
//    public void testGetPostsByPage() {
//        System.out.println("getPostsByPage");
//        PageInfo page = null;
//        List<Post> fullList = null;
//        PostDAO instance = new PostDAO();
//        List<Post> expResult = null;
//        List<Post> result = instance.getPostsByPage(page, fullList);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getPostBySearch method, of class PostDAO.
//     */
//    @Test
//    public void testGetPostBySearch() {
//        System.out.println("getPostBySearch");
//        String searchText = "";
//        PostDAO instance = new PostDAO();
//        List<Post> expResult = null;
//        List<Post> result = instance.getPostBySearch(searchText);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getPostByCate method, of class PostDAO.
//     */
//    @Test
//    public void testGetPostByCate() {
//        System.out.println("getPostByCate");
//        int cateId = 0;
//        PostDAO instance = new PostDAO();
//        List<Post> expResult = null;
//        List<Post> result = instance.getPostByCate(cateId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getPostBySearchAndCategory method, of class PostDAO.
//     */
//    @Test
//    public void testGetPostBySearchAndCategory() {
//        System.out.println("getPostBySearchAndCategory");
//        String searchTxt = "";
//        int cateId = 0;
//        PostDAO instance = new PostDAO();
//        List<Post> expResult = null;
//        List<Post> result = instance.getPostBySearchAndCategory(searchTxt, cateId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//    
}
