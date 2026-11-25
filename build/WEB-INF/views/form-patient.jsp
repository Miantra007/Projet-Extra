<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.EtatCivil" %>
<%@ page import="model.Sexe" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta charset="UTF-8">
        <title>Résultat du test</title>
    </head>

    <body>
        <h1>Formulaire d'ajout patient</h1>
        <form action="${pageContext.request.contextPath}/enregisterPatient" method="POST">
            <p>Nom : <input type="text" name="patient.nom"></p>
            <p>Prenom : <input type="text" name="patient.prenom"></p>
            <p>Etat civil : <select name="patient.etatCivil.id">
                <% List<EtatCivil> etatCivils =(List<EtatCivil>) request.getAttribute("etatCivils");
                for(EtatCivil e : etatCivils){ %>
                <option value="<%= e.getId() %>"><%= e.getLibelle() %></option>
                <% } %>
            </select></p>
            <p>Sexe : <select name="patient.sexe.id">
                <% List<Sexe> sexe = (List<Sexe>) request.getAttribute("sexe");
                for(Sexe e : sexe){ %>
                <option value="<%= e.getId() %>"><%= e.getLibelle() %></option>
                <% } %>
            </select></p>
            <input type="submit" value="Ajouter">
        </form>
    </body>

</html>