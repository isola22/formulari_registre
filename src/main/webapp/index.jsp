<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String nom="";
String errorNom="";

String cognom="";
String errorCognom="";

String email="";
String errorEmail="";

String dataNaixement="";
String errorDataNaixement="";

String sexe="";
String errorSexe="";

String tipus="pelicules";
String errorTipus="";

String generes="";
String errorGeneres="";

String contrasenya1="";
String errorContrasenya1="";

String contrasenya2="";
String errorContrasenya2="";

boolean hiHaError=false;

if (request.getParameter("boto")!=null){
	// Nom
	if(request.getParameter("nom")==""){
		errorNom="El camp esta buit";
		hiHaError=true;
	} else nom=request.getParameter("nom");
	
	// Cognom
	if(request.getParameter("cognom")==""){
		errorCognom="El camp esta buit";
		hiHaError=true;
	} else cognom=request.getParameter("cognom");
	
	// Email X
	if(request.getParameter("email")==""){
		errorEmail="El camp esta buit";
		hiHaError=true;
	} else if(!request.getParameter("email").contains("@") || request.getParameter("email").indexOf("@")<1 || !request.getParameter("email").contains(".") || request.getParameter("email").indexOf(".")<3){
		errorEmail="El correu no es correcte";
		hiHaError=true;
	} else {
		email=request.getParameter("email");
	}

	// Data Naixement
	if(request.getParameter("dataNaixement")==""){
		//errorDataNaixement="El camp esta buit";
		//hiHaError=true;
	} else if(2026-Integer.parseInt(request.getParameter("dataNaixement").substring(0,4)) < 5){
	        errorDataNaixement="La data ha de ser minim 5 anys anterior a l'actual";
	        hiHaError=true;
	}
	else dataNaixement=request.getParameter("dataNaixement");
	
	// Sexe
	if(request.getParameter("sexe")==""){
		errorSexe="El camp esta buit";
		hiHaError=true;
	} else sexe=request.getParameter("sexe");
	
	// Tipus
	tipus=request.getParameter("tipus");
	
	// Generes
	if(request.getParameter("generes")!=null){
		generes=request.getParameter("generes");
	}
	
	// Contrasenya1
	if(request.getParameter("contrasenya1")==""){
		errorContrasenya1="El camp esta buit";
		hiHaError=true;
	} else if(request.getParameter("contrasenya1").length()<8){
		errorContrasenya1="El camp te menys de 8 caracterets";
		hiHaError=true;
	}

	// Contrasenya2
	if (request.getParameter("contrasenya1")!="" || request.getParameter("contrasenya2")!="") {
		if (!request.getParameter("contrasenya1").equals(request.getParameter("contrasenya2"))) {
			errorContrasenya2="Les contrasenyes no son iguals";
			hiHaError=true;	
		} else {
			contrasenya1=request.getParameter("contrasenya1");
			contrasenya2=request.getParameter("contrasenya2");
			}
	}
	if(!hiHaError){
		%><jsp:forward page="desti.jsp"/><%
	}
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Registre</title>
</head>
<body>
	<form method="POST" action="#">
		<label>Nom: <input type="text" name="nom" value="<%= nom %>"></label>
		<%if (errorNom!="") {%>
		<span style="color:red"><%=errorNom%></span>
		<%}%>
		<br>
		
		<label>Cognom: <input type="text" name="cognom" value="<%= cognom %>"></label>
		<%if (errorCognom!="") {%>
		<span style="color:red"><%=errorCognom%></span>
		<%}%>
		<br>
		
		<label>Email: <input type="text" name="email" value="<%= email %>"></label>
		<%if (errorEmail!="") {%>
		<span style="color:red"><%=errorEmail%></span>
		<%}%>
		<br>
		
		<label>Data de naixement: <input type="date" name="dataNaixement" value="<%= dataNaixement %>"></label>
		<%if (errorDataNaixement!="") {%>
		<span style="color:red"><%=errorDataNaixement%></span>
		<%}%>
		<br>
		
		<!-- ??? -->
		<label>Sexe: 
			<select name="sexe">
				<option value="">-- Selecciona --</option>
				<option value="home" <%if (sexe.equals("home")){%>selected<%}%>>Home</option>
				<option value="dona" <%if (sexe.equals("dona")){%>selected<%}%>>Dona</option>
				<option value="no_declarat" <%if (sexe.equals("no_declarat")){%>selected<%}%>>No declarat</option>
			</select>
		</label>
		<%if (errorSexe!="") {%>
		<span style="color:red"><%=errorSexe%></span>
		<%}%>
		<br>
		
		<label>Tipus:</label> 
		<input type="radio" name="tipus" value="pelicules" <%if (tipus.equals("pelicules")){%>checked<%}%>> Pelicules
		<input type="radio" name="tipus" value="series" <%if (tipus.equals("series")){%>checked<%}%>> Series
		<%if (errorTipus!="") {%>
		<span style="color:red"><%=errorTipus%></span>
		<%}%>
		<br>
		
		<label>Géneros:</label>
		<%if (errorGeneres!="") {%>
		<span style="color:red"><%=errorGeneres%></span>
		<%}%>
		<br> 
		<input type="checkbox" name="generes" value="accion" <%if (generes.equals("accion")){%>checked<%}%>> Acció<br> 
		<input type="checkbox" name="generes" value="cienciaFiccio" <%if (generes.equals("cienciaFiccio")){%>checked<%}%>> Ciencia Ficció<br> 
		<input type="checkbox" name="generes" value="historica" <%if (generes.equals("historica")){%>checked<%}%>> Històrica<br> 
		<input type="checkbox" name="generes" value="drama" <%if (generes.equals("drama")){%>checked<%}%>> Drama<br> 
		<input type="checkbox" name="generes" value="comedia" <%if (generes.equals("comedia")){%>checked<%}%>> Comedia<br>
		
		<label>Contrasenya: <input type="password" name="contrasenya1" value="<%= contrasenya1 %>"></label>
		<%if (errorContrasenya1!="") {%>
		<span style="color:red"><%=errorContrasenya1%></span>
		<%}%>
		<br>
		
		<label>Repetir contrasenya: <input type="password" name="contrasenya2" value="<%= contrasenya2 %>"></label>
		<%if (errorContrasenya2!="") {%>
		<span style="color:red"><%=errorContrasenya2%></span>
		<%}%>
		<br>
		
		<button type="submit" name="boto">Enviar</button>
	</form>
</body>
</html>