/**
 * 
 */
package air2Java.bdd.entites;

import java.io.Serializable;
import java.util.Date;


/**
 * @author Rom1
 *
 */
public class Individu  extends Entite implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	int id_individu ;
	int id_civilite ;
	String nom ;
	String prenom ;
	Date date_naissance ;
	
	/**
	 * @param id_individu id_individu
	 * @param id_civilite id_civilite
	 * @param nom nom
	 * @param prenom prenom
	 * @param date date_naissance
	 */
	public Individu(int id_individu, int id_civilite, String nom, String prenom,
			Date date) {
		super();
		this.id_individu = id_individu;
		this.id_civilite = id_civilite;
		this.nom = nom;
		this.prenom = prenom;
		this.date_naissance = date;
	}
	
	/**
	 * @param id_individu id_individu
	 * @param id_civilite id_civilite
	 * @param nom nom
	 * @param prenom prenom
	 * @param date date_naissance
	 * @deprecated Utiliser int getId_individu() ou PK getPK()
	 */
	public Individu(PK id_individu, int id_civilite, String nom, String prenom,
			Date date) {
		this(Integer.parseInt(id_individu.getKey().toString()),id_civilite,nom,prenom,date);
	}

	/**
	 * 
	 */
	public Individu() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the id_individu
	 */
	public int getId_individu() {
		return this.id_individu;
	}

	/**
	 * @param id_individu the id_individu to set
	 */
	public void setId_individu(int id_individu) {
		this.id_individu = id_individu;
	}

	/**
	 * @return the id_civilite
	 */
	public int getId_civilite() {
		return this.id_civilite;
	}

	/**
	 * @param id_civilite the id_civilite to set
	 */
	public void setId_civilite(int id_civilite) {
		this.id_civilite = id_civilite;
	}

	/**
	 * @return the nom
	 */
	public String getNom() {
		return this.nom;
	}

	/**
	 * @param nom the nom to set
	 */
	public void setNom(String nom) {
		this.nom = nom;
	}

	/**
	 * @return the prenom
	 */
	public String getPrenom() {
		return this.prenom;
	}

	/**
	 * @param prenom the prenom to set
	 */
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	/**
	 * @return the date_naissance
	 */
	public Date getDate_naissance() {
		return this.date_naissance;
	}

	/**
	 * @param date_naissance the date_naissance to set
	 */
	public void setDate_naissance(Date date_naissance) {
		this.date_naissance = date_naissance;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Individu [id_individu=" + this.id_individu + ", id_civilite="
				+ this.id_civilite + ", nom=" + this.nom + ", prenom="
				+ this.prenom + ", date_naissance=" + this.date_naissance + "]";
	}

	/* (non-Javadoc)
	 * @see air2Java.bdd.entites.Entite#getPK()
	 */
	@Override
	public PK getPK() {
		return new PK(id_individu);
	}

}
