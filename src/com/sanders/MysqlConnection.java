package com.sanders;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.mysql.cj.protocol.Resultset;

import model.Grocery;

public class MysqlConnection {
	
	/*public void MysqlConncetion() {
		
	}*/
	
	public String queryDb (String query) {
		ResultSet rs = null;
		ArrayList<Grocery> groceries = new ArrayList<>();
		
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.
                getConnection("jdbc:mysql://127.0.0.1/grocerydb"
                    ,"****","********");
            
            Statement stmt = con.createStatement();
            rs= stmt.executeQuery(query);
            
            // iterate through the java resultset
            while (rs.next())
            {
            	Grocery grocResult = new Grocery();
              //int id = rs.getInt("id");
              String id = rs.getString("ID");
              String description = rs.getString("Description");
              String lastSold = rs.getString("lastSold");
              String shelfLife = rs.getString("ShelfLife");
              String department = rs.getString("Department");
              String price = rs.getString("Price");
              String unit = rs.getString("Unit");
              String xfor = rs.getString("xFor");
              String cost = rs.getString("Cost");
             
              grocResult.setId(id);
              grocResult.setDescription(description);
              grocResult.setLastSold(lastSold);
              grocResult.setShelfLife(shelfLife);
              grocResult.setDepartment(department);
              grocResult.setPrice(price);
              grocResult.setUnit(unit);
              grocResult.setxFor(xfor);
              grocResult.setCost(cost);
              groceries.add(grocResult);
              // print the results
              System.out.format("%s, %s, %s, %s, %s, %s\n", id, description, lastSold, shelfLife, department, price, unit, xfor, cost);
            }
            stmt.close();
            System.out.println("Created DB Connection....");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		String json = new Gson().toJson(groceries);
		return json;
	}

}
