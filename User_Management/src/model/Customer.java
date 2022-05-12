package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Customer {
	// A common method to connect to the DB
	private Connection connect() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electrimanage", "root", "");

			// For testing
			System.out.print("Successfully connected");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

	public String readCustomer() {
		String output = "";

		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}

			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Customer Name</th>" + "<th>Customer Email</th><th>Customer Address</th>"
					+ "<th>Customer Contact</th>" + "<th>Update</th><th>Remove</th></tr>";

			String query = "select * from user1";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next()) {

				String user_id = Integer.toString(rs.getInt("user_id"));
				String user_name = rs.getString("user_name");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String phone_num = rs.getString("phone_num");

				// Add into the html table

				output += "<tr><td><input id='hidcustomerIDUpdate' name='hidcustomerIDUpdate' type='hidden' value='"
						+ user_id + "'>" + user_name + "</td>";

				output += "<td>" + email + "</td>";
				output += "<td>" + address + "</td>";
				output += "<td>" + phone_num + "</td>";

				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-user_id='"
						+ user_id + "'>" + "</td></tr>";

			}

			con.close();

			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the Customer Details.";
			System.err.println(e.getMessage());
		}

		return output;
	}

	// Insert Customer
	public String insertCustomer(String user_name, String email, String address,
			String phone_num,String password) {
		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database";
			}

			// create a prepared statement
			String query = " insert into user1 (`user_id`,`user_name`,`email`,`address`,`phone_num`,`password`)"
					+ " values (?, ?, ?, ?, ?, ?)";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, user_name);
			preparedStmt.setString(3, email);
			preparedStmt.setString(4, address);
			preparedStmt.setString(5, phone_num);
			preparedStmt.setString(6, password);

			// execute the statement
			preparedStmt.execute();
			con.close();

			// Create JSON Object to show successful msg.
			String newCustomer = readCustomer();
			output = "{\"status\":\"success\", \"data\": \"" + newCustomer + "\"}";
		} catch (Exception e) {
			// Create JSON Object to show Error msg.
			output = "{\"status\":\"error\", \"data\": \"Error while Inserting Customer.\"}";
			System.err.println(e.getMessage());
		}

		return output;
	}

	// Update Customer
	public String updateCustomer(String user_id, String user_name, String email, String address,
			String phone_num, String password) {
		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database for updating.";
			}

			// create a prepared statement
			String query = "UPDATE user1 SET user_name=?,email=?,address=?,phone_num=?,password=? WHERE user_id=?";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setString(1, user_name);
			preparedStmt.setString(2, email);
			preparedStmt.setString(3, address);
			preparedStmt.setString(4, phone_num);
			preparedStmt.setString(5, password);
			preparedStmt.setInt(6, Integer.parseInt(user_id));

			// execute the statement
			preparedStmt.execute();
			con.close();

			// create JSON object to show successful msg
			String newCustomer = readCustomer();
			output = "{\"status\":\"success\", \"data\": \"" + newCustomer + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while Updating Customer Details.\"}";
			System.err.println(e.getMessage());
		}

		return output;
	}

	public String deleteCustomer(String user_id) {
		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String query = "DELETE FROM user1 WHERE user_id=?";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, Integer.parseInt(user_id));
			// execute the statement
			preparedStmt.execute();
			con.close();

			// create JSON Object
			String newCustomer = readCustomer();
			output = "{\"status\":\"success\", \"data\": \"" + newCustomer + "\"}";
		} catch (Exception e) {
			// Create JSON object
			output = "{\"status\":\"error\", \"data\": \"Error while Deleting Customer.\"}";
			System.err.println(e.getMessage());

		}

		return output;
	}

}
