<%@ page import="com.covid19.DatabaseSetup" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset = "UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Notifications </title>
    <link rel="stylesheet" href="styleindex.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script>src="https://code.jquery.com/jquery-3.2.1.slim.min.js"</script>
    <script>src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"</script>

</head>
<body>
<div class="header">
    <div class="menu-bar">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="index.jsp"><img src="resources/logo.png" alt="Home"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="profile.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="requests.jsp">Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>

<%
    String current  = (String) session.getAttribute("username");
    DatabaseSetup dbSetup = new DatabaseSetup();
    try {
        List<String> infected = new ArrayList<>(dbSetup.notifyUser(current));
        if(!infected.isEmpty()){
            for (String friend : infected){ %>

 <h5>Your friend <%=friend%> has declared himself infected </h5>

<%      }
} else { %>
<h3> You don't have any Notification </h3>
<%}
}
catch (ClassNotFoundException e) {
    e.printStackTrace();
} %>



</body>
</html>