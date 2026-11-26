<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Patient" %>

<%
    Patient patient = (Patient) request.getAttribute("patient");
%>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fiche patient</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fiche-patient.css">
    </head>
    <body>

        <jsp:include page="layout/header.jsp" />

        <div class="page-container">

            <jsp:include page="layout/sidebar.jsp" />

            <main class="main-content">

                <div class="page-title">
                    <h1>Fiche du patient</h1>
                    <p>Consultez les informations du patient.</p>
                </div>

                <div class="patient-card">

                    <div class="patient-card-header">
                        <div>
                            <h2><%= patient.getNom() %> <%= patient.getPrenom() %></h2>
                            <span>Patient N° <%= patient.getId() %></span>
                        </div>
                    </div>

                    <div class="patient-informations">

                        <div class="information-item">
                            <span class="information-label">Identifiant</span>
                            <span class="information-value"><%= patient.getId() %></span>
                        </div>

                        <div class="information-item">
                            <span class="information-label">Nom</span>
                            <span class="information-value"><%= patient.getNom() %></span>
                        </div>

                        <div class="information-item">
                            <span class="information-label">Prénom</span>
                            <span class="information-value"><%= patient.getPrenom() %></span>
                        </div>

                        <div class="information-item">
                            <span class="information-label">Sexe</span>
                            <span class="information-value">
                                <%= patient.getSexe().getLibelle() %>
                            </span>
                        </div>

                        <div class="information-item">
                            <span class="information-label">État civil</span>
                            <span class="information-value">
                                <%= patient.getEtatCivil().getLibelle() %>
                            </span>
                        </div>

                    </div>

                    <div class="patient-actions">
                        <a href="${pageContext.request.contextPath}/" class="btn-back">
                            Retour à la liste
                        </a>
                    </div>

                </div>

            </main>
        </div>

    </body>
</html>