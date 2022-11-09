/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAL;

import Models.ChangeRequest;
import Models.PageInfo;
import java.sql.Date;
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
    /**
     * Test of get method, of class ChangeRequestDAO.
     */
    @Test
    public void testGetSuccess() {
        System.out.println("test get success");
        int id = 1;
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest expResult = new ChangeRequest(1, Date.valueOf("2022-11-05"), Date.valueOf("2022-11-05"), "Test", "Test", 2, 2);
        ChangeRequest result = instance.get(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testGetFail() {
        System.out.println("test get fail");
        int id = -1;
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest expResult = null;
        ChangeRequest result = instance.get(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

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

    @Test
    public void testAdd() {
        System.out.println("Test add success");
        ChangeRequest cR = new ChangeRequest();
        cR.setDescription("Test");
        cR.setRequestTime(Date.valueOf("2022-11-05"));
        cR.setStatus(2);
        cR.setDoctorId(2);
        ChangeRequestDAO instance = new ChangeRequestDAO();
        boolean expResult = true;
        boolean result = instance.add(cR);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testAddDescriptionFail() {
        System.out.println("Test add descreption fail");
        ChangeRequest cR = new ChangeRequest();
        cR.setRequestTime(Date.valueOf("2022-11-05"));
        cR.setStatus(2);
        cR.setDoctorId(2);
        ChangeRequestDAO instance = new ChangeRequestDAO();
        boolean expResult = false;
        boolean result = instance.add(cR);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testAddRequestFail() {
        System.out.println("Test add Request time null");
        ChangeRequest cR = new ChangeRequest();
        cR.setDescription("Test");
        cR.setStatus(2);
        cR.setDoctorId(2);
        ChangeRequestDAO instance = new ChangeRequestDAO();
        boolean expResult = false;
        boolean result = instance.add(cR);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testAddStatusL1Fail() {
        System.out.println("Test add Status less than 1");
        ChangeRequest cR = new ChangeRequest();
        cR.setDescription("Test");
        cR.setRequestTime(Date.valueOf("2022-11-05"));
        cR.setStatus(-1);
        cR.setDoctorId(2);
        ChangeRequestDAO instance = new ChangeRequestDAO();
        boolean expResult = false;
        boolean result = instance.add(cR);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testAddStatusM3Fail() {
        System.out.println("Test add Status More than 3");
        ChangeRequest cR = new ChangeRequest();
        cR.setDescription("Test");
        cR.setRequestTime(Date.valueOf("2022-11-05"));
        cR.setStatus(4);
        cR.setDoctorId(2);
        ChangeRequestDAO instance = new ChangeRequestDAO();
        boolean expResult = false;
        boolean result = instance.add(cR);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testAddDoctorIDNF() {
        System.out.println("Test add DoctorID not found");
        ChangeRequest cR = new ChangeRequest();
        cR.setDescription("Test");
        cR.setRequestTime(Date.valueOf("2022-11-05"));
        cR.setStatus(2);
        cR.setDoctorId(-1);
        ChangeRequestDAO instance = new ChangeRequestDAO();
        boolean expResult = false;
        boolean result = instance.add(cR);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }


    /**
     * Test of update method, of class ChangeRequestDAO.
     */
    @Test
    public void testUpdateSuccess() {
        System.out.println("update success");
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest t = new ChangeRequest();
        t.setRequestId(1);
        t.setReponseDescription("TestUpdate");
        t.setReponseTime(Date.valueOf("2022-11-05"));
        t.setStatus(2);
        boolean expResult = true;
        boolean result = instance.update(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testUpdateReponseDesFail() {
        System.out.println("update Reponse Null");
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest t = new ChangeRequest();
        t.setRequestId(1);
        t.setReponseTime(Date.valueOf("2022-11-05"));
        t.setStatus(2);
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testUpdateReponseTimeNull() {
        System.out.println("update Reponse time null");
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest t = new ChangeRequest();
        t.setRequestId(1);
        t.setReponseDescription("TestUpdate");
        t.setStatus(2);
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testUpdateStatusL1() {
        System.out.println("update Status fail less than 1");
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest t = new ChangeRequest();
        t.setRequestId(1);
        t.setReponseDescription("TestUpdate");
        t.setReponseTime(Date.valueOf("2022-11-05"));
        t.setStatus(-1);
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testUpdateStatusM3() {
        System.out.println("update status fail more than 3");
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest t = new ChangeRequest();
        t.setRequestId(1);
        t.setReponseDescription("TestUpdate");
        t.setReponseTime(Date.valueOf("2022-11-05"));
        t.setStatus(4);
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testUpdateChangeRequest() {
        System.out.println("update fail change request not found");
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest t = new ChangeRequest();
        t.setRequestId(-1);
        t.setReponseDescription("TestUpdate");
        t.setReponseTime(Date.valueOf("2022-11-05"));
        t.setStatus(2);
        boolean expResult = false;
        boolean result = instance.update(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    
    /**
     * Test of delete method, of class ChangeRequestDAO.
     */
    @Test
    public void testDeleteSuccess() {
        System.out.println("delete success");
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest t = instance.getLast();
        boolean expResult = true;
        boolean result = instance.delete(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }

    @Test
    public void testDeleteFail() {
        System.out.println("delete fail");
        ChangeRequestDAO instance = new ChangeRequestDAO();
        ChangeRequest t = new ChangeRequest();
        t.setRequestId(-1);
        boolean expResult = false;
        boolean result = instance.delete(t);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
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

    @Test
    public void testcheckDuplicateCodeSuccess() {
        System.out.println("checkDuplicate True");
        int requestID = 1;
        ChangeRequestDAO instance = new ChangeRequestDAO();
        boolean expResult = true;
        boolean result = instance.duplicateCode(requestID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }

    @Test
    public void testcheckDuplicateCodeFail() {
        System.out.println("checkDuplicate False");
        int requestID = -1;
        ChangeRequestDAO instance = new ChangeRequestDAO();
        boolean expResult = false;
        boolean result = instance.duplicateCode(requestID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
}
