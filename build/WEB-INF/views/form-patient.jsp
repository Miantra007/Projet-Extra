<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.EtatCivil" %>
<%@ page import="model.Sexe" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ajouter un patient</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form-patient.css">
    </head>
    <body>

        <jsp:include page="layout/header.jsp" />

        <div class="page-container">

            <jsp:include page="layout/sidebar.jsp" />

            <main class="main-content">

                <div class="page-title">
                    <h1>Ajouter un patient</h1>
                    <p>Remplissez les informations du nouveau patient.</p>
                </div>

                <div class="form-container">

                    <form action="${pageContext.request.contextPath}/enregisterPatient" method="POST">

                        <div class="form-group">
                            <label for="nom">Nom</label>
                            <input type="text" id="nom" name="patient.nom"
                            placeholder="Entrez le nom" required>
                        </div>

                        <div class="form-group">
                            <label for="prenom">Prénom</label>
                            <input type="text" id="prenom" name="patient.prenom"
                            placeholder="Entrez le prénom" required>
                        </div>

                        <div class="form-group">
                            <label for="etatCivil">État civil</label>
                            <select id="etatCivil" name="patient.etatCivil.id" required>
                                <%
                                    List<EtatCivil> etatCivils =
                                    (List<EtatCivil>) request.getAttribute("etatCivils");
                                    
                                    for (EtatCivil e : etatCivils) {
                                    %>
                                    <option value="<%= e.getId() %>">
                                        <%= e.getLibelle() %>
                                    </option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="sexe">Sexe</label>
                                <select id="sexe" name="patient.sexe.id" required>
                                    <%
                                        List<Sexe> sexes =
                                        (List<Sexe>) request.getAttribute("sexe");
                                        
                                        for (Sexe s : sexes) {
                                        %>
                                        <option value="<%= s.getId() %>">
                                            <%= s.getLibelle() %>
                                        </option>
                                        <% } %>
                                    </select>
                                </div>

                                <div class="form-actions">
                                    <a href="${pageContext.request.contextPath}/" class="btn-cancel">
                                        Annuler
                                    </a>

                                    <button type="submit" class="btn-submit">
                                        Ajouter le patient
                                    </button>
                                </div>

                            </form>

                        </div>

                    </main>
                </div>

            </body>
        </html>