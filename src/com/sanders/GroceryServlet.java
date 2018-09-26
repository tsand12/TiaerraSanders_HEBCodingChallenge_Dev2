package com.sanders;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.sun.corba.se.impl.orbutil.ObjectWriter;

import model.Grocery;

/**
 * Servlet implementation class GroceryServlet
 */
public class GroceryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static List<Grocery> groceries = new ArrayList<>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroceryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<String> queryValues = new ArrayList<>();
		Grocery g = new Grocery();
		String params = request.getParameter("queryData");
		String description = request.getParameter("description");
		String lastSold = request.getParameter("lastSold");
		String shelfLife = request.getParameter("shelfLife");
		String department = request.getParameter("department");
		String price = request.getParameter("price");
		String unit = request.getParameter("unit");
		@SuppressWarnings("deprecation")
		
		JSONObject json = new JSONObject(params);
		Grocery myObject = new Gson().fromJson(params, Grocery.class);
		String id = request.getParameter("data");
		
		
		com.fasterxml.jackson.databind.ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json1 = ow.writeValueAsString(g);
		JSONObject jsonObj = new JSONObject(json1);
		
		String whereClause =  getSqlString(myObject);
		//construct sql statement
		String sql = "SELECT * FROM grocerydb.groceryItems "+ whereClause;
		//make connection to query db
		if(!whereClause.equals("")) {
			MysqlConnection conn = new MysqlConnection();
			
			PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print(conn.queryDb(sql));
	        out.flush(); 
		}else {
			PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        out.print("");
	        out.flush(); 
		}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	
	@SuppressWarnings("unused")
	private String getSqlString(Grocery grocery) {
		//String sqlQuery = "SELECT * FROM grocerydb.groceryItems WHERE ";
		String sqlWhere = null;
		if(grocery.getId() != null && !grocery.getId().equals("")) {
			grocery.setId(grocery.getId().replaceAll("'", "\""));
			grocery.setId(grocery.getId().replaceAll("_", ""));
			grocery.setId(grocery.getId().replaceAll("%", ""));
			if(!grocery.getId().equals("")) {
				if(sqlWhere == null) {
					if(doBasicSelect(grocery.getId().toString())) {//determine if you want to do an exact search or not 
						sqlWhere = " ID = '" + grocery.getId()+"'";
					}else {
						sqlWhere = " ID like  '" + grocery.getId()+"%'";
					}
				}else {
					if(doBasicSelect(grocery.getId().toString())) {
						sqlWhere = " AND ID = '" + grocery.getId()+"'";
					}else {
						sqlWhere += " AND ID like  '" + grocery.getId()+"%'";
					}
					
				}
			}
			
			
		}
		if(grocery.getDescription() != null && !grocery.getDescription().equals("")) {
			grocery.setDescription(grocery.getDescription().replaceAll("'", "\""));
			if(sqlWhere == null) {
				sqlWhere = " Description = '" + grocery.getDescription() +"'";
			}else {
				sqlWhere += " AND Description = '" + grocery.getDescription() +"'";
			}
			
		}
		
		if(grocery.getLastSold() != null && !grocery.getLastSold().equals("")) {
			grocery.setLastSold(grocery.getLastSold().replaceAll("'", "\""));
			if(sqlWhere == null) {
				sqlWhere = " lastSold = '" + grocery.getLastSold()+"'";
			}else {
				sqlWhere += " AND lastSold = '" + grocery.getLastSold()+"'";
			}
			
		}
		if(grocery.getShelfLife() != null && !grocery.getShelfLife().equals("")) {
			grocery.setShelfLife(grocery.getShelfLife().replaceAll("'", "\""));
			grocery.setShelfLife(grocery.getShelfLife().replaceAll("_", ""));
			grocery.setShelfLife(grocery.getShelfLife().replaceAll("%", ""));
			if(!grocery.getShelfLife().equals("")) {
				if(sqlWhere == null) {
					if(doBasicSelect(grocery.getShelfLife().toString())) {//determine if you want to do an exact search or not 
						sqlWhere = " ShelfLife = '" + grocery.getShelfLife()+"'";
					}else {
						sqlWhere = " ShelfLife like  '" + grocery.getShelfLife()+"_'";
					}
				}else {
					if(doBasicSelect(grocery.getShelfLife().toString())) {
						sqlWhere = " AND ShelfLife = '" + grocery.getShelfLife()+"'";
					}else {
						sqlWhere += " AND ShelfLife like  '" + grocery.getShelfLife()+"_'";
					}
					
				}
			}
			
			
		}
		if(grocery.getDepartment() != null && !grocery.getDepartment().equals("")) {
			grocery.setDepartment(grocery.getDepartment().replaceAll("'", "\""));
			if(sqlWhere == null) {
				sqlWhere = " Department = '" + grocery.getDepartment()+"'";
			}else {
				sqlWhere += " AND Department = '" + grocery.getDepartment()+"'";
			}
			
		}
		if(grocery.getPrice() != null && !grocery.getPrice().equals("")) {
			grocery.setPrice(grocery.getPrice().replaceAll("'", "\""));
			grocery.setPrice(grocery.getPrice().replaceAll("%", ""));
			grocery.setPrice(grocery.getPrice().replaceAll("_", ""));
			if(!grocery.getPrice().equals("")) {
				if(sqlWhere == null) {
					sqlWhere = " Price like '%" + grocery.getPrice()+"%'";
				}else {
					sqlWhere += " AND Price like '%" + grocery.getPrice()+"%'";
				}
			}
			
			
		}
		if(grocery.getUnit() != null && !grocery.getUnit().equals("")) {//unit
			grocery.setUnit(grocery.getUnit().replaceAll("'", "\""));
			if(sqlWhere == null) {
				sqlWhere = " Unit = '" + grocery.getUnit()+"'";
			}else {
				sqlWhere += " AND Unit = '" + grocery.getUnit()+"'";
			}
			
		}
		
		if(grocery.getxFor() != null && !grocery.getxFor().equals("")) {//xfor
			grocery.setxFor(grocery.getxFor().replaceAll("'", "\""));
			if(sqlWhere == null) {
				sqlWhere = " xFor = '" + grocery.getxFor()+"'";
			}else {
				sqlWhere += " AND xFor = '" + grocery.getxFor()+"'";
			}
			
		}
		if(grocery.getCost() != null && !grocery.getCost().equals("")) {//cost
			grocery.setCost(grocery.getCost().replaceAll("'", "\""));
			if(sqlWhere == null) {
				sqlWhere = " Cost = '" + grocery.getCost()+"'";
			}else {
				sqlWhere += " AND Cost = '" + grocery.getCost()+"'";
			}
			
		}
		
		if(sqlWhere == null) {
			sqlWhere = "";
		}else {
			sqlWhere = "WHERE " + sqlWhere;
		}
		
		
		return sqlWhere;
	}
	
	//return true or false
	public boolean doBasicSelect(String shelfLife) {
		boolean basicSelect = false;
		if(shelfLife.endsWith("d") || shelfLife.endsWith("m") || shelfLife.endsWith("y") || shelfLife.endsWith("w")) {
			basicSelect = true;
		}else {
			basicSelect = false;
		}
		
		return basicSelect;
	}

}
