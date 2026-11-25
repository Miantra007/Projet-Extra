package model;

import jakarta.persistence.*;

@Entity
@Table(name = "etatCivil")
public class EtatCivil {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "libelle", nullable = false, length = 50)
    private String libelle;

    public EtatCivil() {}

    public int getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
}