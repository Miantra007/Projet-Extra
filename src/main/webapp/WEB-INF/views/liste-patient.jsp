<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Patient" %>

<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta charset="UTF-8">
        <title>Liste des patients</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/liste-patient.css">
    </head>

    <body>

        <jsp:include page="layout/header.jsp" />

        <div class="page-container">

            <jsp:include page="layout/sidebar.jsp" />

            <main class="main-content">

                <h1>Liste des patients</h1>

                <div class="table-container">
                    <table>
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
                            <%
                                List<Patient> patients = (List<Patient>) request.getAttribute("patients");
                                
                                for (Patient p : patients) {
                                %>
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/fichePatient?id=<%= p.getId() %>">
                                            <%= p.getId() %>
                                        </a>
                                    </td>
                                    <td><%= p.getNom() %></td>
                                    <td><%= p.getPrenom() %></td>
                                    <td><%= p.getSexe().getLibelle() %></td>
                                    <td><%= p.getEtatCivil().getLibelle() %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>

                    <a class="btn-primary" href="${pageContext.request.contextPath}/ajoutPatient">
                        + Ajouter un patient
                    </a>

                </main>
            </div>

        </body>
    </html>