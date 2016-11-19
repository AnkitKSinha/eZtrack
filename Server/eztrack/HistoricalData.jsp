<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	
	<%

	int userDeviceId = Integer.parseInt(request.getParameter("ud_id"));
	int type = Integer.parseInt(request.getParameter("type"));

	System.out.println("ud_id: " + userDeviceId);

	PreparedStatement St=null;
	Connection Db=null;
	ResultSet Results=null;
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Db=DriverManager.getConnection("jdbc:mysql://localhost/eztrack","root","p@t@n@hi");
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception 101:\t"+error);
	}
	catch(ClassNotFoundException error)
	{
		System.out.println("Class Not Found Error 101:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception 101:\t"+error);
	}
	String Query=new String(), Query2 = new String();
	int count=0;
	try
	{
		Query = "select u.username, dd.dbatch_id,s.s_type, dd.value, dd.data_timestamp from users u, device_data dd, sensors s where (dd.ud_id = ? and s.s_id = dd.s_id) and u.u_id = (select u_id from user_devices where ud_id = ?) order by dd.dbatch_id desc";
		
		Query2 = "select u.username, dd.dbatch_id,s.s_type, dd.value, dd.data_timestamp from users u, device_data dd, sensors s, alerts a where (dd.ud_id = ? and s.s_id = dd.s_id) and a.dbatch_id = dd.dbatch_id and u.u_id = (select u_id from user_devices where ud_id = ?) order by dd.dbatch_id desc";
		//St=Db.prepareStatement(Query2);

		if(type ==1 ){
			St = Db.prepareStatement(Query);
		}else{
			St = Db.prepareStatement(Query2);
		}
		
		St.setInt(1,userDeviceId);
		St.setInt(2,userDeviceId);

		Results= St.executeQuery();

		if(Results.next()){
			String tempDate = "";
			String timestamp[] = new String[2];
			int distinctBatch = 0;
			int ctr = 0;
			boolean sameBatch = false;
			String sensorName = "";
			out.println("{\"name\":\""+Results.getString(1)+"\",\"data\":[");
			do{
				timestamp = (Results.getString(5)).split("\\s");
				if(distinctBatch != Results.getInt(2)){
					sameBatch = false;
					out.println((ctr==0)?"{":"}]},{");
					out.println("\"date\":\""+timestamp[0]+"\",");
					out.println("\"time\":\""+timestamp[1]+"\",");
					out.println("\"sensors\":[{");
					distinctBatch = Results.getInt(2);
				}else{
						sameBatch = true;
				}
				out.println(((sameBatch)?"},{":"")+"\"type\":\""+Results.getString(3)+"\",\"value\":"+Results.getInt(4));
				ctr++;

			}while(Results.next());
			out.println("}]}]}");
		}else{
			String nameQuery = "select username from users where u_id = (select u_id from user_devices where ud_id = ?)";
			St = Db.prepareStatement(nameQuery);
			St.setInt(1,userDeviceId);
			Results = St.executeQuery();

			if(Results.next()){
				out.println("{\"name\":\""+Results.getString(1)+"\"}");
			}else{
				out.println("{\"name\":\"NULL\"}");
			}
		}
		
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 104:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 104:\t"+error);
	}
	try
	{
		Db.close();
	}
	catch(Exception error)
	{
		System.out.println("Error Closing :"+error);
	}
%>