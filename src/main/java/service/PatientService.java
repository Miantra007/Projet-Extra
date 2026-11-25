package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Patient;
import repository.PatientRepository;

@Service
public class PatientService {

    @Autowired
    private PatientRepository patientRepository;

    public List<Patient> lister() {
        return patientRepository.findAll();
    }

    public Patient trouver(int id) {
        return patientRepository.findById(id).orElse(null);
    }

    public Patient enregistrer(Patient patient) {
        return patientRepository.save(patient);
    }

    public void supprimer(int id) {
        patientRepository.deleteById(id);
    }

}
