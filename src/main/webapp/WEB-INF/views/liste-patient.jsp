<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Patient" %>

<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta charset="UTF-8">
        <title>Liste des patients</title>
    </head>

    <body>

        <h1>Liste des patients</h1>

        <table border="1" cellpadding="10" cellspacing="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Sexe</th>
                    <th>État civil</th>
                </tr>
            </thead>

            <tbody>
                <% List<Patient> patients = (List<Patient>) request.getAttribute("patients");
                    
                    for (Patient p : patients) {
                    %>
                    <tr>
                        <td>
                            <a href="${pageContext.request.contextPath}/fichePatient?id=<%= p.getId() %>"><%= p.getId() %></a>
                        </td>
                        <td>
                            <%= p.getNom() %>
                        </td>
                        <td>
                            <%= p.getPrenom() %>
                        </td>
                        <td>
                            <%= p.getSexe().getLibelle() %>
                        </td>
                        <td>
                            <%= p.getEtatCivil().getLibelle() %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/ajoutPatient">Ajouter un patient</a>
        </body>

    </html>