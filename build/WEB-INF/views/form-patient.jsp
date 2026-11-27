<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.EtatCivil" %>
<%@ page import="model.Sexe" %>
<%@ page import="model.Patient" %>''
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
                    <% Patient p = (Patient) request.getAttribute("patient");
                    String param = (String) request.getAttribute("param");%>

                    <% if(param != null) { %>

                    <h1>Ajouter un patient</h1>
                    <p>Remplissez les informations du nouveau patient.</p>

                    <% } else {%>
                    <h1>Modifier un patient</h1>
                    <% } %>

                </div>

                <div class="form-container">

                    <% if( param == null) {%>
                    <form action="${pageContext.request.contextPath}/enregisterPatient" method="POST">
                        <% } else { %>
                        <form action="${pageContext.request.contextPath}/modifierPatient" method="POST">
                            <input type="hidden" name="patient.id" value="<%= p.getId() %>">
                            <% }%>

                            <div class="form-group">
                                <label for="nom">Nom</label>
                                <input type="text" id="nom" name="patient.nom" placeholder="Entrez le nom" value="<%= p != null ? p.getNom() : ""%>" required>
                            </div>

                            <div class="form-group">
                                <label for="prenom">Prénom</label>
                                <input type="text" id="prenom" name="patient.prenom"  placeholder="Entrez le prénom" value="<%= p != null ? p.getPrenom() : ""%>" required>
                            </div>

                            <div class="form-group">
                                <label for="etatCivil">État civil</label>
                                <select id="etatCivil" name="patient.etatCivil.id" required>
                                    <%
                                        List<EtatCivil> etatCivils =
                                        (List<EtatCivil>) request.getAttribute("etatCivils");
                                        
                                        for (EtatCivil e : etatCivils) {
                                        %>
                                        <option value="<%= e.getId() %>" <%= p != null && p.getEtatCivil().getId() == e.getId() ? "selected" : "" %>>
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
                                            <option value="<%= s.getId() %>" <%= p != null && p.getSexe().getId() == s.getId() ? "selected" : "" %>>
                                                <%= s.getLibelle() %>
                                            </option>
                                            <% } %>
                                        </select>
                                    </div>

                                    <div class="form-actions">
                                        <a href="${pageContext.request.contextPath}/" class="btn-cancel">
                                            Annuler
                                        </a>

                                        <% if( param == null) {%>
                                        <button type="submit" class="btn-submit">
                                            Ajouter le patient
                                        </button>
                                        <% } else { %>
                                        <button type="submit" class="btn-submit">
                                            Modifier le patient
                                        </button>
                                        <% }%>
                                    </div>

                                </form>

                            </div>

                        </main>
                    </div>

                </body>
            </html>