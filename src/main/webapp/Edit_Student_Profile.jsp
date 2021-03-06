

<%@page import="model.FacultyModel"%>
<%@page import="model.StudentModel"%>

<%
StudentModel sm=(StudentModel)session.getAttribute("userModel");
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="MDB Free/img/img1.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Korero</title>
        
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/autocompleter.js"></script>
        <link rel="stylesheet" href="js/jquery-ui.css">

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="MDB Free/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>

    
</head>

<body>
<style type="text/css">
	.img:hover{
		opacity: 0.6;
	}
</style>
<script>
    var branch="<%= sm.getBranch() %>";
    var sem="<%= sm.getSemester() %>";
    var sec="<%= sm.getSection() %>";
</script>
<nav class="navbar navbar-fixed-top navbar-info" role="navigation">
	<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						 <a class="navbar-brand" href="MyFeed">
                <img src="MDB Free/img/logo.png" class="img-fluid" style="width: 180px">
            </a>

					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="MyFeed">Home</a></li>
			        		<li><a href="MyProfile">Profile</a></li>
			        		<li><a href="Post_Question.jsp">Ask a question</a></li>
                                                <li><a href="AboutUs.jsp">About Us</a></li>
				    		</ul>
						<ul class="nav navbar-nav navbar-right">
							
							
							<li class="dropdown">
			        			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="material-icons">person</i></a>
			        			<ul class="dropdown-menu">
								 
								  <li><a href="EditProfile">Edit Profile</a></li>
								  <li class="divider"></li>
								  <li><a href="ChangePassword.jsp?uid=<%= sm.getSid() %>">Change Password</a></li>
								  <li class="divider"></li>
							      <li><a href="LogOut">Log Out</a></li>
			        			</ul>
			        		</li>
										
						</ul>

						<form class="navbar-form navbar-right" role="search" action="AskQuestion">
							<div class="form-group  is-empty">
								<input type="text" class="form-control search" placeholder="Search -- Question,  @Username,  #Workspaces" style="width: 400px;" id="search" name="search">
								<span class="material-input"></span>
							</div>
							<button type="submit" class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i><div class="ripple-container"></div>
							</button>
						</form>
					</div>
				</div>
</nav>
	<div class="wrapper">

	    <div class="sidebar" data-color="blue" data-image="img/testd.jpg" style="margin-top: 50px;">
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

	    	<div class="sidebar-wrapper">
	            <ul class="nav">
	            <li class="container-fluid">
	            	<img src="ImageLoader?uid=<%= sm.getSid() %>" alt="Circle Image" class="img-circle img-responsive" style="padding: 0px 35px;">
	            <div class="content text-center">
					<h6 class="category text-gray">STUDENT</h6>
					<h4 class="card-title"><%= sm.getName() %></h4>
    			</div>
	            </li>
	                <li>
	                    <a href="MyFeed">
	                        <i class="material-icons">dashboard</i>
	                        <p>My Feed</p>
	                    </a>
	                </li>
	                <li class="active">
	                    <a>
	                        <i class="material-icons">person</i>
	                        <p>Edit Profile</p>
	                    </a>
	                </li>
	                <li>
                            <a href="poll/pollhome.jsp">
	                        <i class="material-icons">list</i>
	                        <p>Polling</p>
	                    </a>
	                </li>
	                <li>
                            <a href="book advisory/bookhome.jsp">
	                        <i class="material-icons text-gray">book</i>
	                        <p>Book Advisory</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    </div>

	    <div class="main-panel">

			<div class="content" style="padding-top: 50px;margin-top: 20px;">
		 <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-8">
	                        <div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">Edit Profile</h4>
									<p class="category">Complete your profile</p>
	                            </div>
	                            <div class="card-content">
                                        <form id="editProfileForm" onsubmit="setFormParameters()" method="post">
	                                    <div class="row" >
	                                        <div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label">User Category</label>
													<input type="text" name="utype" value="Student" class="form-control" disabled>
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">User ID</label>
													<input type="text" name="uid" class="form-control" value="<%= sm.getSid() %>" disabled>
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">Email address</label>
													<input type="email" name="email" value="<%= sm.getEmail() %>" class="form-control" disabled>
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label"> Name</label>
                                                                                                        <input type="text" name="uname" value="<%= sm.getName() %>" class="form-control" >
												</div>
	                                        </div>
	                                        
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-4">
		                                        <div class="dropdown" style="background-color: transparent;">
													<a id="Branch" class="btn dropdown-toggle" data-toggle="dropdown" style="background-color: #00bcd4;">
												    	<%= sm.getBranch() %>
												    	<b class="caret"></b>
													</a>
													<ul class="dropdown-menu">
                                                                                                            <li><a class="dropdown-item" id="1" onclick="myfunct3(this.id)">COMPUTER SCIENCE</a></li>
                                                                                                            <li> <a class="dropdown-item" id="2" onclick="myfunct3(this.id)">MECHANICAL</a></li>
                                                                                                            <li> <a class="dropdown-item" id="3" onclick="myfunct3(this.id)">INFORMATION TECHNOLOGY</a></li>
                                                                                                            <li> <a class="dropdown-item" id="4" onclick="myfunct3(this.id)">ELECTRICAL</a></li>                                    
                                                                                                            <li> <a class="dropdown-item" id="5" onclick="myfunct3(this.id)">ELECTRONICS</a></li>
                                                                                                            <li> <a class="dropdown-item" id="6" onclick="myfunct3(this.id)">FIRE TECH</a></li>
                                                                                                            <li> <a class="dropdown-item" id="7" onclick="myfunct3(this.id)">CHEMICAL</a></li>
                                                                                                            <li> <a class="dropdown-item" id="8" onclick="myfunct3(this.id)">CIVIL</a></li>
                                                                                                               
													</ul>
												</div>
	                                        </div>
                                                <div class="col-md-1">
                                                </div>
	                                        <div class="col-md-4">
		                                        <div class="dropdown" style="background-color: transparent;">
													<a class="btn dropdown-toggle" id="sem" data-toggle="dropdown" style="background-color: #00bcd4;">
												    	<%= sm.getSemester() %>
												    	<b class="caret"></b>
													</a>
													<ul class="dropdown-menu">
                                                                                                                <li><a href="#" id="s1" onclick="myfunc2(this.id)">1</a></li>
														<li><a href="#" id="s2" onclick="myfunc2(this.id)">2</a></li>
														<li><a href="#" id="s3" onclick="myfunc2(this.id)">3</a></li>	
														<li><a href="#" id="s4" onclick="myfunc2(this.id)">4</a></li>
														<li><a href="#" id="s5" onclick="myfunc2(this.id)">5</a></li>
														<li><a href="#" id="s6" onclick="myfunc2(this.id)">6</a></li>
														<li><a href="#" id="s7" onclick="myfunc2(this.id)">7</a></li>	
														<li><a href="#" id="s8" onclick="myfunc2(this.id)">8</a></li>
													</ul>
												</div>
	                                        </div>
	                                        <div class="col-md-3">
		                                        <div class="dropdown" style="background-color: transparent;">
													<a class="btn dropdown-toggle" id="sec" data-toggle="dropdown" style="background-color: #00bcd4;">
												    	<%= sm.getSection() %>
												    	<b class="caret"></b>
													</a>
													<ul class="dropdown-menu">
                                                                                                                <li><a href="#" id="sc1" onclick="myfunc1(this.id)">A</a></li>
														<li><a href="#" id="sc2" onclick="myfunc1(this.id)">B</a></li>
														<li><a href="#" id="sc3" onclick="myfunc1(this.id)">C</a></li>	
														<li><a href="#" id="sc4" onclick="myfunc1(this.id)">D</a></li>
														<li><a href="#" id="sc5" onclick="myfunc1(this.id)">E</a></li>
														<li class="divider"></li>
														<li><a href="#" id="sc6" onclick="myfunc1(this.id)">Other</a></li>
													</ul>
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-12">
	                                            <div class="form-group">
	                                                <label>About Me</label>
													<div class="form-group label-floating">
									    				<label class="control-label"> write something that describes you</label>
								    					<textarea name="about" class="form-control" rows="3"><%= sm.getAboutme() %></textarea>
		                        					</div>
	                                            </div>
	                                        </div>
	                                    </div>

                                                                                <button type="submit"  class="btn btn-info pull-right">Update Profile</button>
	                                    <div class="clearfix"></div>
	                                </form>
	                            </div>
	                        </div>
	                    </div>
						<div class="col-md-4">
    						<div class="card card-profile" style="margin-top: 150px;">
    							<div class="card-avatar">
    								<a href="#pablo">
                                                                        
    									<img class="img" onclick="document.getElementById('editprofilephoto').click(); return false" src="ImageLoader?uid=<%= sm.getSid() %>" />
                                                                        
                                                                </a>
    							</div>

    							<div class="content">
                                                            <form action="ImageUploader?uid=<%=sm.getSid() %>"  id="imageUploaderForm" method="post" enctype="multipart/form-data" >
                                                            <input type="file" name="image" id="editprofilephoto" style="visibility: hidden"/>
                                                            </form>
                                                            <small><a href="#" onclick="document.getElementById('editprofilephoto').click(); return false" style="color: #00bcd4;">Edit Profile Picture</a></small>
                                                            
    								<h6 class="category text-gray">STUDENT</h6>
    								<h4 class="card-title"><%= sm.getName() %></h4>
    								<p class="card-content">
    									<%= sm.getAboutme() %>
    								</p>
    								
    							</div> 						
			    			</div>
	                    </div>
	                    </div>
	            </div>
	        
		</div>

			<footer class="footer">
				<div class="container-fluid">
					<nav >
					</nav>
					<p class="copyright pull-right">
						&copy; <script>document.write(new Date().getFullYear())</script> , made with love <i class="fa fa-heart"></i> by team Korero
					</p>
				</div>
			</footer>
		</div>
	</div>

</body>
	
	<!--   Core JS Files   -->
	<!--<script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>-->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/material.min.js" type="text/javascript"></script>

	<!--  Notifications Plugin    -->
	<script src="js/bootstrap-notify.js"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="js/demo.js"></script>
   
	<script>
	function myfunct3(id) {
    document.getElementById("Branch").innerHTML = document.getElementById(id).innerHTML;
    branch=document.getElementById(id).innerHTML;
    branch=branch.substr(0,branch.indexOf('<'));
}

function myfunc2(id) {
    document.getElementById("sem").innerHTML = document.getElementById(id).innerHTML;
    sem=document.getElementById(id).innerHTML;
    sem=sem.substr(0,sem.indexOf('<'));
}

function myfunc1(id) {
    document.getElementById("sec").innerHTML = document.getElementById(id).innerHTML;
    sec=document.getElementById(id).innerHTML;
    sec=sec.substr(0,sec.indexOf('<'));
    console.log(branch+"        "+sem+"           "+sec);
    
}

function setFormParameters()
{
    
    
    
    console.log(branch+"        "+sem+"           "+sec);
    
    document.getElementById("editProfileForm").setAttribute("action","UpdateProfile?utype=Student&branch="+branch+"&sem="+sem+"&sec="+sec);
}

</script>
	 

<script>
    var flag1=true;
    
        var _URL = window.URL || window.webkitURL;

$("#editprofilephoto").change(function(e){
    
    var image, file;

    if ((file = this.files[0])) {
       
        image = new Image();
        
        image.onload = function() {
            
           if(this.width==this.height)
           {
               document.getElementById("imageUploaderForm").submit();
           }
           else
           {
               flag1=false;
               alert("Dimensions Of Image Should Be Equal..");
              
           }
        };
    
        image.src = _URL.createObjectURL(file);


    }

});

    </script>

</html>
