/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package DAL;

import Models.PostCategory;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author Admin
 */
public class CategoryDAOTest {
    
    public CategoryDAOTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
    }
    
    @AfterEach
    public void tearDown() {
    }

    /**
     * Test of getAll method, of class CategoryDAO.
     */
    @Test
    public void testGetAll() {
        System.out.println("getAll");
        CategoryDAO instance = new CategoryDAO();
        List<PostCategory> expResult = null;
        List<PostCategory> result = instance.getAll();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of get method, of class CategoryDAO.
     */
    @Test
    public void testGet() {
        System.out.println("get");
        int id = 0;
        CategoryDAO instance = new CategoryDAO();
        PostCategory expResult = null;
        PostCategory result = instance.get(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of load method, of class CategoryDAO.
     */
    @Test
    public void testLoad() {
        System.out.println("load");
        CategoryDAO instance = new CategoryDAO();
        instance.load();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of add method, of class CategoryDAO.
     */
    @Test
    public void testAdd() {
        System.out.println("add");
        PostCategory t = null;
        CategoryDAO instance = new CategoryDAO();
        instance.add(t);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of update method, of class CategoryDAO.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        PostCategory t = null;
        CategoryDAO instance = new CategoryDAO();
        instance.update(t);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of delete method, of class CategoryDAO.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        PostCategory t = null;
        CategoryDAO instance = new CategoryDAO();
        instance.delete(t);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
