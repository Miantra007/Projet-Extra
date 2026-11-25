<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Patient" %>

<%
    Patient patient = (Patient) request.getAttribute("patient");
%>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Fiche patient</title>
    </head>
    <body>

        <h1>Fiche du patient</h1>

        <p>ID : <%= patient.getId() %></p>
        <p>Nom : <%= patient.getNom() %></p>
        <p>Prénom : <%= patient.getPrenom() %></p>
        <p>Sexe : <%= patient.getSexe().getLibelle() %></p>
        <p>État civil : <%= patient.getEtatCivil().getLibelle() %></p>

    </body>
</html>