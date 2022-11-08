/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAL;

import Models.ChangeRequest;
import Models.PageInfo;
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
public class ChangeRequestDAOTest {

    public ChangeRequestDAOTest() {
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

    /**
     * Test of getAll method, of class ChangeRequestDAO.
     */
//    @Test
//    public void testGetAll() {
//        System.out.println("getAll");
//        ChangeRequestDAO instance = new ChangeRequestDAO();
//        List<ChangeRequest> expResult = null;
//        List<ChangeRequest> result = instance.getAll();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of get method, of class ChangeRequestDAO.
//     */
//    @Test
//    public void testGet() {
//        System.out.println("get");
//        int id = 0;
//        ChangeRequestDAO instance = new ChangeRequestDAO();
//        ChangeRequest expResult = null;
//        ChangeRequest result = instance.get(id);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
    /**
     * Test of load method, of class ChangeRequestDAO.
     */
    @Test
    public void testLoadSuccess() {
        System.out.println("load Success");
        ChangeRequestDAO instance = new ChangeRequestDAO();
        boolean expResult = true;
        boolean result = instance.load();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }
//
//    /**
//     * Test of add method, of class ChangeRequestDAO.
//     */
//    @Test
//    public void testAdd() {
//        System.out.println("add");
//        ChangeRequest cR = null;
//        ChangeRequestDAO instance = new ChangeRequestDAO();
//        boolean expResult = false;
//        boolean result = instance.add(cR);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of update method, of class ChangeRequestDAO.
//     */
//    @Test
//    public void testUpdate() {
//        System.out.println("update");
//        ChangeRequest t = null;
//        ChangeRequestDAO instance = new ChangeRequestDAO();
//        boolean expResult = false;
//        boolean result = instance.update(t);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of delete method, of class ChangeRequestDAO.
//     */
//    @Test
//    public void testDelete() {
//        System.out.println("delete");
//        ChangeRequest t = null;
//        ChangeRequestDAO instance = new ChangeRequestDAO();
//        boolean expResult = false;
//        boolean result = instance.delete(t);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getChangeRequestListByDoctorID method, of class ChangeRequestDAO.
//     */
//    @Test
//    public void testGetChangeRequestListByDoctorID() {
//        System.out.println("getChangeRequestListByDoctorID");
//        int doctorId = 0;
//        ChangeRequestDAO instance = new ChangeRequestDAO();
//        List<ChangeRequest> expResult = null;
//        List<ChangeRequest> result = instance.getChangeRequestListByDoctorID(doctorId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getChangeRequestListByStatus method, of class ChangeRequestDAO.
//     */
//    @Test
//    public void testGetChangeRequestListByStatus() {
//        System.out.println("getChangeRequestListByStatus");
//        int status = 0;
//        int doctorId = 0;
//        ChangeRequestDAO instance = new ChangeRequestDAO();
//        List<ChangeRequest> expResult = null;
//        List<ChangeRequest> result = instance.getChangeRequestListByStatus(status, doctorId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getChangeRequestListByStatusAndSearch method, of class ChangeRequestDAO.
//     */
//    @Test
//    public void testGetChangeRequestListByStatusAndSearch() {
//        System.out.println("getChangeRequestListByStatusAndSearch");
//        int status = 0;
//        String search = "";
//        ChangeRequestDAO instance = new ChangeRequestDAO();
//        List<ChangeRequest> expResult = null;
//        List<ChangeRequest> result = instance.getChangeRequestListByStatusAndSearch(status, search);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getChangeRequestByPage method, of class ChangeRequestDAO.
//     */
//    @Test
//    public void testGetChangeRequestByPage() {
//        System.out.println("getChangeRequestByPage");
//        PageInfo page = null;
//        List<ChangeRequest> fullList = null;
//        ChangeRequestDAO instance = new ChangeRequestDAO();
//        List<ChangeRequest> expResult = null;
//        List<ChangeRequest> result = instance.getChangeRequestByPage(page, fullList);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

}
