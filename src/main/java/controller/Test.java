// package main.java.controller;

// import mg.itu.miantra.annotation.Auth;
// import mg.itu.miantra.annotation.Controller;
// import mg.itu.miantra.annotation.Url;
// import mg.itu.miantra.annotation.WebApi;

// import java.util.List;
// import java.util.Map;

// import org.springframework.context.ApplicationContext;

// import com.fasterxml.jackson.annotation.JsonCreator.Mode;

// import Service.MessageService;
// import main.java.model.Personne;
// import main.java.model.Chien;
// import util.MapFile;
// import util.ModelAndView;
// import util.Session;

// @Controller
// public class Test {

//     @WebApi
//     @Url(value = "/logiiin", method = "GET")
//     public ModelAndView login(ApplicationContext springContext) {
//         System.out.println("methode login éxécuté avec succes");

//         ApplicationContext context = springContext;
//         MessageService messageService = context.getBean(MessageService.class);

//         Map<String, String> infosAccueil = messageService.getInfosAccueil();
//         ModelAndView mv = new ModelAndView("hello");
//         mv.addObject("username", infosAccueil.get("msg"));
//         mv.addObject("role", infosAccueil.get("status"));
//         return mv;
//     }

//     @WebApi
//     @Url(value = "/login2", method = "GET")
//     public String login2(ApplicationContext springContext) {
//         return "methode login2 éxécuté avec succes";
//     }

//     @Url(value = "/sum", method = "GET")
//     public ModelAndView somme(ApplicationContext springContext, String nom) {
//         int a = 12;
//         int b = 8;
//         ModelAndView mv = new ModelAndView("form");
//         mv.addObject("a", a);
//         mv.addObject("b", b);
//         mv.addObject("resultat", a + b);
//         return mv;
//     }

//     @Url(value = "/showForm", method = "GET")
//     public ModelAndView showForm() {
//         ModelAndView mv = new ModelAndView("save");
//         return mv;
//     }

//     @WebApi
//     @Url(value = "/save", method = "GET")
//     public ModelAndView save(ApplicationContext springContext, Session session) {
//         ModelAndView mv = new ModelAndView("hello");
//         // mv.addObject("nom", nom);
//         // mv.addObject("age", age);

//         Object name = session.get("nomUtilisateur");
//         mv.addObject("nomSession", name);

//         return mv;
//     }

//     @WebApi
//     @Url(value = "/saveObjet", method = "POST")
//     public ModelAndView save(
//             ApplicationContext springContext,
//             Personne e,
//             Chien c,
//             MapFile photo,
//             Session session) {

//         // Test 1 : enregistrer des données dans la session
//         session.set("nomUtilisateur", "Alice");
//         session.set("ageUtilisateur", 20);

//         // Test 2 : récupérer les données
//         Object nom = session.get("nomUtilisateur");
//         Object age = session.get("ageUtilisateur");

//         ModelAndView mv = new ModelAndView("hello");

//         // Afficher les données de la session dans la vue
//         mv.addObject("nomSession", nom);
//         mv.addObject("ageSession", age);

//         mv.addObject("nomC", c.getNom());
//         mv.addObject("ageC", c.getAge());

//         mv.addObject("nomP", e.getNom());
//         mv.addObject("ageP", e.getAge());
//         // mv.addObject("dtnP", e.getDtn());
//         mv.addObject("comP", e.getCompetences());

//         if (e.getCin() != null) {
//             mv.addObject("cinN", e.getCin().getName());
//             mv.addObject("cinE", e.getCin().getExtension());
//             mv.addObject("cinTaille", e.getCin().getBytes().length);
//         }

//         if (photo != null) {
//             mv.addObject("pN", photo.getName());
//             mv.addObject("pE", photo.getExtension());
//             mv.addObject("pTaille", photo.getBytes().length);
//         }

//         if (e.getEnfant() != null) {
//             mv.addObject("nomE", e.getEnfant().getNom());
//             mv.addObject("ageE", e.getEnfant().getAge());
//         }

//         return mv;
//     }

//     @Auth
//     @Url(value = "/profil", method = "GET")
//     public String profil(Session session) {
//         return "Bienvenue sur votre profil";
//     }

//     @Auth(roles = "RH")
//     @Url(value = "/rh", method = "GET")
//     public String gestionCandidatures() {
//         return "Bienvenue dans l'espace rh";
//     }

//     @Auth(roles = "ADMIN")
//     @Url(value = "/admin", method = "GET")
//     public String admin() {
//         return "Bienvenue dans l'espace administrateur";
//     }

//     @Url(value = "/login", method = "GET")
//     public ModelAndView authForm() {
//         return new ModelAndView("auth");
//     }

//     @Url(value = "/verify", method = "POST")
//     public String login(String identifiant, String motDePasse, Session session) {

//         if ("alice".equals(identifiant) && "1234".equals(motDePasse)) {

//             session.set("isAuth", true);
//             session.set("role", "ADMIN");

//             return "redirect:/admin";
//         }

//         if ("hery".equals(identifiant) && "1234".equals(motDePasse)) {

//             session.set("isAuth", true);
//             session.set("role", "RH");

//             return "redirect:/rh";
//         }

//         return "redirect:/login";
//     }
// }
