/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAL;

import Models.PageInfo;
import Models.Post;
import java.sql.Date;
import java.util.ArrayList;
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

    /**
     * Test of get method, of class PostDAO.
     */
    @Test
    public void testGetSuccess() {
        System.out.println("get Post success");
        int id = 29;
        PostDAO instance = new PostDAO();
        Post expResult = new Post(29, "TestSearch", "TestSearch", "TestSearch", "TestSearch", Date.valueOf("2022-11-08"), 7);
        Post result = instance.get(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }

    @Test
    public void testGetFail() {
        System.out.println("get Post fail");
        int id = -1;
        PostDAO instance = new PostDAO();
        Post expResult = null;
        Post result = instance.get(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
      
    }

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

    /**
     * Test of update method, of class PostDAO.
     */
    @Test
    public void testUpdateSuccess() {
        System.out.println("update Post Success");
        Post t = new Post();
        t.setPostId(28);
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = true;
        boolean result = instance.update(t);
        assertEquals(expResult, result);

    }
    
     @Test
    public void testUpdateIdFail() {
        System.out.println("update Post ID Fail");
        Post t = new Post();
        t.setPostId(-1);
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);

    }
    
     @Test
    public void testUpdateTitleFail() {
        System.out.println("update Title Null");
        Post t = new Post();
        t.setPostId(28);
        t.setDescription("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);

    }
    
     @Test
    public void testUpdateDescriptionFail() {
        System.out.println("update Description Null");
        Post t = new Post();
        t.setPostId(28);
        t.setTitle("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);

    }
    
     @Test
    public void testUpdateDetailFail() {
        System.out.println("update Detail Fail");
        Post t = new Post();
        t.setPostId(28);
        t.setTitle("Test");
        t.setDescription("Test");
        t.setImage("Test");
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);

    }
    
     @Test
    public void testUpdateImageNull() {
        System.out.println("update image Null");
        Post t = new Post();
        t.setPostId(28);
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        t.setCateId(3);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);

    }
    
     @Test
    public void testUpdateImageM255() {
        System.out.println("update Image more than 255 char");
        Post t = new Post();
        t.setPostId(28);
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
        boolean result = instance.update(t);
        assertEquals(expResult, result);

    }
    
     @Test
    public void testUpdateCateL1() {
        System.out.println("update CateID less than 1");
        Post t = new Post();
        t.setPostId(28);
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(-1);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);

    }
    
     @Test
    public void testUpdateCateM7() {
        System.out.println("update CateID more than 7");
        Post t = new Post();
        t.setPostId(28);
        t.setTitle("Test");
        t.setDescription("Test");
        t.setDetail("Test");
        t.setImage("Test");
        t.setCateId(8);
        PostDAO instance = new PostDAO();
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);

    }

    /**
     * Test of delete method, of class PostDAO.
     */
    @Test
    public void testDeleteSuccess() {
        System.out.println("delete success");
        PostDAO instance = new PostDAO();
        instance.load();
        Post t = instance.getLast();
        boolean expResult = true;
        boolean result = instance.delete(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }

    @Test
    public void testDeleteSuccessFail() {
        System.out.println("delete fail");
        PostDAO instance = new PostDAO();
        instance.load();
        Post t = new Post();
        t.setPostId(-1);
        boolean expResult = false;
        boolean result = instance.delete(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }

    @Test
    public void testCheckDuplicateSuccess() {
        System.out.println("Test check duplicateSuccess");
        PostDAO instance = new PostDAO();
        int i = 29;
        boolean expResult = true;
        boolean result = instance.duplicateCode(i);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }

    @Test
    public void testCheckDuplicateFalse() {
        System.out.println("Test check duplicate false");
        PostDAO instance = new PostDAO();
        int i = -1;
        boolean expResult = false;
        boolean result = instance.duplicateCode(i);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
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


    /**
     * Test of getPostByCate method, of class PostDAO.
     */
    @Test
    public void testGetPostByCateSuccess() {
        System.out.println("getPostByCate success");
        int cateId = 7;
        PostDAO instance = new PostDAO();
        List<Post> expResult = new ArrayList<>();
        expResult.add(new Post(37, "TestSearchAndCate", "TestSearchAndCate", "TestSearchAndCate", "TestSearchAndCate", Date.valueOf("2022-11-08"), 7));
        expResult.add(new Post(36, "TestSearchAndCate", "TestSearchAndCate", "TestSearchAndCate", "TestSearchAndCate", Date.valueOf("2022-11-08"), 7));
         expResult.add(new Post(33, "TestCate", "TestCate", "TestCate", "TestCate", Date.valueOf("2022-11-08"), 7));
        expResult.add(new Post(32, "TestCate", "TestCate", "TestCate", "TestCate", Date.valueOf("2022-11-08"), 7));
        List<Post> result = instance.getPostByCate(cateId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
     @Test
    public void testGetPostBySearchSuccess() {
        System.out.println("getPostBySearch success");
        String search = "TestSearch";
        PostDAO instance = new PostDAO();
        List<Post> expResult = new ArrayList<>();
        expResult.add(new Post(37, "TestSearchAndCate", "TestSearchAndCate", "TestSearchAndCate", "TestSearchAndCate", Date.valueOf("2022-11-08"), 7));
        expResult.add(new Post(36, "TestSearchAndCate", "TestSearchAndCate", "TestSearchAndCate", "TestSearchAndCate", Date.valueOf("2022-11-08"), 7));
        expResult.add(new Post(30, "TestSearch", "TestSearch", "TestSearch", "TestSearch", Date.valueOf("2022-11-08"), 3));
        expResult.add(new Post(29, "TestSearch", "TestSearch", "TestSearch", "TestSearch", Date.valueOf("2022-11-08"), 3));
        List<Post> result = instance.getPostBySearch(search);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

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
