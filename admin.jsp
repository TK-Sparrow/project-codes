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
	<title>Candidates List</title>

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
ResultSet rs;
String loc="all";
String sql;
public void retrive(){
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "user_id", "hello");
Statement st=con.createStatement();  
rs=st.executeQuery(sql);
}
catch(Exception e){
	System.out.println("error: "+e.toString());
}
}
%>
<%
sql="select personal.name,work.* from personal inner join work on personal.id=work.id";
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
	        	<form action="">
                <div class="col-sm-2 col-sm-offset-2">
						 <input name="experiance" type="int" class="form-control" placeholder="experiance">
			    </div>
	        	<div class="col-sm-3">
					<div class="form-group">
						 <input name="email_ref" type="text" class="form-control" placeholder="email/reference Id">
					</div>
				</div>
				<div class="col-sm-2">
						 <input name="location" type="text" class="form-control" placeholder="location">		 
				</div>
				<input type="submit" value="submit" style="background-color:orange" class=" btn btn-finish btn-wd"name="search">
			     </form>

			    

		        <div class="col-sm-8 col-sm-offset-2">

		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <div class="card wizard-card" data-color="azure" id="wizard">
		                    <form action="" method="">
		                

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">Welcome</h3>
		                        	<p class="category">Candidates list</p>
		                    	</div>

								<div class="wizard-navigation">
									
									<ul>
			                            <li>
											<a href="#details" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-list"></i>
												</div>
												CandidatesList
											</a>
										</li>
			                            
			                        </ul>
								</div>
		                        <div class="tab-content">
		                            <div class="tab-pane" id="details">
		                            	<div class="row">
		                            	<%
		                            	while(rs.next())
		                            	{
		                            	%>
                                        <a href="candidate-view.html">
		                                	<div class="wizard-card">
		                                	<div class="col-sm-3">
												<div class="picture-container">
													<div class="picture">
														<img src="assets/img/default-avatar.jpg" class="picture-src"  title="" />
						
													</div>
													<h6><%= rs.getString(2) %></h6>
												</div>
											
											</div>
											<div class="col-sm-8 col-sm-offset-1">
											        <p ><strong>CandidateName:</strong><b> <%= rs.getString(1) %></b></p>
													<p ><strong>Designation:</strong><b> <%= rs.getString(3) %></b></p>
													<p ><strong>Location</strong><b>      <%= rs.getString(5) %></b></p>
													<p ><strong>Experience:</strong><b>  <%= rs.getString(7) %></b></p>
													<p ><strong></strong><b>      <%= rs.getString(8) %></b></p>
								
											</div>
										

		                                </div>
		                                </a>
		                                 <%
		                                 }
		                                 %>
		                                
		                                
			      			                                 
			                            </div>
		                        	</div>
		                          </div> 
		                           </form>
		                        </div>
		                        <div class="wizard-footer">
		                            
		                            <div class="clearfix"></div>
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
			<div class="dropdown open">
				<a href="#" data-toggle="dropdown">
					<i class="fa fa-cog fa-2x"> </i>
				</a>
				<ul class="dropdown-menu">
					<li class="header-title"></li>
					
					<li class="active">
						<a href="admin.html">
						   <img src="assets/img/wizard-find-desk.png">
						   CandidatesList
						</a>
					</li>
					<li>
						<a href="selected-candidates.html">
						   <img src="assets/img/wizard-create-profile.png">
						   Selected Candidates
						</a>
					</li>
					<li>
						<a href="view-status.html">
						   <img src="assets/img/wizard-list-place.png">
						   SignOut
						</a>
					</li>
					
				  
				</ul>
			</div>
		</div>
	</div>
</body>
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
