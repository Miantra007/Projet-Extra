package controller;

import java.util.List;

import org.springframework.context.ApplicationContext;

import mg.itu.miantra.annotation.Controller;
import mg.itu.miantra.annotation.Url;

import service.PatientService;
import util.ModelAndView;
import model.Patient;
import repository.EtatCivilRepository;
import repository.SexeRepository;

@Controller
public class PatientController {

    @Url(value = "/", method = "GET")
    public ModelAndView index(ApplicationContext springContext) {
        ModelAndView mv = new ModelAndView("liste-patient");
        PatientService patientService = springContext.getBean(PatientService.class);
        List<Patient> patients = patientService.lister();
        mv.addObject("patients", patients);
        return mv;
    }

    @Url(value = "/ajoutPatient", method = "GET")
    public ModelAndView formAjoutPatient(ApplicationContext springContext) {
        ModelAndView mv = new ModelAndView("form-patient");
        EtatCivilRepository etatCivilRepository = springContext.getBean(EtatCivilRepository.class);
        SexeRepository sexeRepository = springContext.getBean(SexeRepository.class);
        mv.addObject("etatCivils", etatCivilRepository.findAll());
        mv.addObject("sexe", sexeRepository.findAll());
        return mv;
    }

    @Url(value = "/enregisterPatient", method = "POST")
    public ModelAndView enregistrerPatient(ApplicationContext springContext, Patient p) {
        ModelAndView mv = new ModelAndView("liste-patient");
        PatientService patientService = springContext.getBean(PatientService.class);
        patientService.enregistrer(p);
        List<Patient> patients = patientService.lister();
        mv.addObject("patients", patients);
        return mv;
    }

    @Url(value = "/fichePatient", method = "GET")
    public ModelAndView trouverPatient(ApplicationContext springContext, int id) {
        ModelAndView mv = new ModelAndView("fiche-patient");
        PatientService patientService = springContext.getBean(PatientService.class);
        Patient p = patientService.trouver(id);
        mv.addObject("patient", p);
        return mv;
    }

}