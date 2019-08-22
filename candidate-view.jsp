<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="assets/img/favicon.png" />
	<title>Candidate-View</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

	

	<!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/css/paper-bootstrap-wizard.css" rel="stylesheet" />


	<link href="assets/css/demo.css" rel="stylesheet" />

	<!-- Fonts and Icons -->
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
	<link href="assets/css/themify-icons.css" rel="stylesheet">
	<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-NKDMSK6');</script>
	<!-- End Google Tag Manager -->
</head>
<body>

<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%!
int temp=0;
ResultSet rs1,rs2,rs3,rs4,rs5;
String loc="all";
String sql;
String id,emp_id;
public void submit(){
	System.out.println("DONE");
}

public void retrive(){
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "user_id", "hello");
Statement st1=con.createStatement(); 
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
Statement st5=con.createStatement();
System.out.println("idd :"+id);
rs1=st1.executeQuery("select * from personal where id='"+id+"'");
rs2=st2.executeQuery("select * from work where id='"+id+"'");
rs3=st3.executeQuery("select * from projects where id='"+id+"'");
rs4=st4.executeQuery("select * from education where id='"+id+"'");
rs5=st5.executeQuery("select * from comments where EMP_ID='"+id+"' and ADM_ID='"+emp_id+"'");
}
catch(Exception e){
	System.out.println("error: "+e.toString());
}
}
%>
<%
Cookie[] ck=request.getCookies();
for(int i=0;i<ck.length;i++){
	if(ck[i].getName().equals("emp_userid")){
		emp_id=ck[i].getValue();
	}
}
System.out.println("emp_id : "+emp_id);
id=request.getParameter("id");
System.out.println("id : "+id);
retrive();

%>

		<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->
	<div class="image-container set-full-height" style="background-image: url('assets/img/bgsky.jpeg')">
	   
		

	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">

		            <!--      Wizard container        -->
		            <div class="wizard-container">
		            	
		                <div class="card wizard-card" data-color="azure" id="wizard">
		                <div class="row">
		                  <div class="row">
		                  <div class="wizard-header">
		                        	<hr><h3 class="wizard-title">Personal Details</h3><hr>
		                        	
		                  </div>

							<% 
							while(rs1.next())
							{
							%>
		                   <div class="col-sm-3">
								<div class="picture-container">
										<div class="picture">
											<img src="assets/img/default-avatar.jpg" class="picture-src"  title="" />
						
										</div>
										<h6 name="id"><%= rs1.getString(1) %></h6>
								</div>
											
							</div>
							<div class="col-sm-8 col-sm-offset-1">
								  <p ><strong>CandidateName:</strong><b> <%= rs1.getString(2) %></b></p>
													<p ><strong>Date of birth:</strong><b> <% String date[]= (rs1.getString(3)).split(" "); out.print(date[0]);  %></b></p>
													<p ><strong>Maretial State :</strong><b> <% if(rs1.getString(5).equals("m")){ out.print("married");} else{ out.print("Single");} %></b></p>
													<p ><strong>Gender:</strong><b> <%if(rs1.getString(4).equals("m")){ out.print("male");} else{ out.print("women");} %></b></p>
													<p ><strong>Refrenece ID:</strong><b> virtusasoft9876</b></p>
													<p ><strong>Email-ID:</strong><b> <%= rs1.getString(8) %></b></p>
													<p ><strong>Status:</strong><b>       selected</b></p>
													<%
													while(rs5.next())
													{
													%>
													<p ><strong>ratings:</strong><b>      <%= rs5.getString(3) %></b></p>
													<p ><strong>comments:</strong><b>      <%= rs5.getString(4) %></b></p>
													<%
													}
													%>
							</div>
							<%
							}
							%>
						</div>
						 <div class="row">
							<div class="wizard-header">
		                        		<hr><h3 class="wizard-title">Educational Details</h3><hr>
		                        	
		                    </div>
		                    <div class="col-sm-offset-1">
		                    	<table border="2" >
		                    		<tr>
		                    		<th>Course</th>
		                    		<th>Branch</th>
		                    		<th>CollegeName</th>
		                    		<th>Year Of Pass</th>
		                    		<th>Percentage</th>
		                    		</tr>
		                    		
		                    		<% while(rs4.next())
		                    			{
		                    			if(rs4.getString(2).equals("18"))
		                    			{
		               					
		                    		%>
		                    		
		                    		<tr>
		                    		<th>PG</th>
		                    		<th><%= rs4.getString(4) %></th>
		                    		<th><%= rs4.getString(3) %></th>
		                    		<th><% String date[]= (rs4.getString(6)).split("-"); out.print(date[0]);  %></th>
		                    		<th><%= rs4.getString(5) %></th>
		                    		</tr>
		                    		<%
		                    			}
		                    			if(rs4.getString(2).equals("14"))
		                    			{
		                    		%>
		                    		<tr>
		                    		<th>UG</th>
		                    		<th><%= rs4.getString(4) %></th>
		                    		<th><%= rs4.getString(3) %></th>
		                    		<th><% String date[]= (rs4.getString(6)).split("-"); out.print(date[0]);  %></th>
		                    		<th><%= rs4.getString(5) %></th>
		                    		</tr>
		                    		<%
		                    			}
		                    			if(rs4.getString(2).equals("12"))
		                    			{
		                    		%>
		                    		<tr>
		                    		<th>Intermediate</th>
		                    		<th><%= rs4.getString(4) %></th>
		                    		<th><%= rs4.getString(3) %></th>
		                    		<th><% String date[]= (rs4.getString(6)).split("-"); out.print(date[0]);  %></th>
		                    		<th><%= rs4.getString(5) %></th>
		                    		</tr>
		                    		<%
		                    			}
		                    			if(rs4.getString(2).equals("10"))
		                    			{
		                    		%>
		                    		<tr>
		                    		<th>SSLC</th>
		                    		<th></th>
		                    		<th><%= rs4.getString(3) %></th>
		                    		<th><% String date[]= (rs4.getString(6)).split("-"); out.print(date[0]);  %></th>
		                    		<th><%= rs4.getString(5) %></th>
		                    		</tr>
		                    		
		                    		<%
		                    			}
		                    			}
		                    		%>
		                    	</table>
		                    </div>
		                </div>
		                 <div class="row">
                          <div class="wizard-header">
		                       <hr><h3 class="wizard-title">Work Experience</h3><hr>
		                        	
		                  </div>
		                  
		                  <%
		                  while(rs2.next())
		                  {
		                  %>
		                  
                          <div class="col-sm-5 col-sm-offset-1">
								            <p ><strong>Dsignation:</strong><b><%= rs2.getString(2) %></b></p>
						 </div>
						  <div class="col-sm-5 col-sm-offset-1">
													<p ><strong>current CTC:</strong><b><%= rs2.getString(3) %></b></p>
												</div>
						<div class="col-sm-8 col-sm-offset-1">
													<p ><strong>Experiance:</strong><b><%= rs2.getString(6) %></b></p>
						
						</div>
						<div class="col-sm-8 col-sm-offset-1">
													<p ><strong>AppliedPosition:</strong><b><%= rs2.getString(7) %></b></p>
						
						</div>
						 <div class="col-sm-5 col-sm-offset-1">
													<p ><strong>Current Location:</strong><b><%= rs2.getString(4) %></b></p>
						</div>
						 <div class="col-sm-5 col-sm-offset-1">
													<p ><strong>Required Location:</strong><b><%= rs2.getString(5) %></b></p>
						</div>
						<%
						}
						%>
						 
						
						<div class="col-sm-5 col-sm-offset-3">						
							<div class="wizard-header" >
		                      <p class="category">Projects</p>
		                        	
		                     </div>
		                 </div>
		                 
		                 <%
		                 while(rs3.next())
		                 {
		                 %>
		                 
							<div class=" col-sm-8 col-sm-offset-1">
								<p>title : <%= rs3.getString(2) %></p>
								<p>start Date : <% String date[]= (rs3.getString(3)).split(" "); out.print(date[0]);  %>     </p>
								<p> End-Date: <% String date1[]= (rs3.getString(4)).split(" "); out.print(date1[0]);  %></p>
								<p><%= rs3.getString(5) %></p>
							</div>
							
							<%
		                	 }
							%>
							
                            
		                 </div>
		                 <form method="post" action="Insert_comment">
		                   <div class="col-sm-5 col-sm-offset-1">
		                                    	<div class="form-group">
		                                        	<label>GiveRatings</label>
		                                        	<select name="rating" class="form-control">
		                                                <option disabled="" selected="">- rating -</option>
		                                                <option value="1"> 1 </option>
		                                                <option value="2">2 </option>
		                                                <option value="3">3 </option>
		                                                <option value="4">4 </option>
		                                                <option value="5">5 </option>
		                                            </select>
		                                    	</div>
		                                	</div>
		                    <div class="col-sm-5 ">
		                                    	<div class="form-group">
		                                        	<label>Status</label>
		                                        	<select name="status" class="form-control">
		                                                <option disabled="" selected="">- select -</option>
		                                                <option value="select"> selected </option>
		                                                <option value="reject">rejected </option>
		                                               
		                                            </select>
		                                    	</div>
		                         </div>
		                      <div class="col-sm-10 col-sm-offset-1">
												<div class="form-group">
													<label>Comments <small>(required)</small></label>
													<input name="comments" type="textarea" class="form-control" placeholder="give the comments about Candidate">
												</div>
								<input type="text" value="<%= id %>" name="id" style="display:none"/>
							<div class="col-sm-offset-2 ">
							
												 <input type='submit' class='btn btn-finish btn-fill btn-primary btn-wd' name='submit' value='submit'  />
							
							</div>
							</form>
							</div> 
		                </div>
		            </div>
		            </div> <!-- wizard container -->
		        </div>
	        </div> <!-- row -->
	    </div> <!--  big container -->
	    
	    
	    
	    
	    
	    

		<div class="footer">
	        <div class="container text-center">
	            <p><center>&copy; 2019  All rights  Reserved |<a href="" target="target_blank">&nbsp; Virtusa Corporation </a></center></p>	     </div>
	    </div>
		<div class="fixed-plugin">
			
				<a href="admin.html" >
					<input type="button" name="back" value="Back" class="btn btn-fill">
				</a>
			
		</div>
		
	</div>

	<!--   Core JS Files   -->
	<script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard 
	<script src="assets/js/demo.js" type="text/javascript"></script>-->
	<script src="assets/js/paper-bootstrap-wizard.js" type="text/javascript"></script>

	<!--  More information about jquery.validate here: https://jqueryvalidation.org/	 -->
	<script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>

</html>
