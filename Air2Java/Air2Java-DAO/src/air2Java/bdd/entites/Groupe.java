/**
 * 
 */
package air2Java.bdd.entites;

import java.io.Serializable;

import air2Java.bdd.entites.PK;

/**
 * @author Rom1
 *
 */
public class Groupe extends Entite implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	int id_groupe ;
	int id_individu ;
	String denomination ;
	String caracteristiques ;
	/**
	 * 
	 */
	public Groupe() {
		this(0, 0, "denomination",
				"caracteristiques");

	}
	
	/**
	 * @param id_groupe Id_groupe
	 * @param id_individu Id_individu
	 * @param denomination	denomination
	 * @param caracteristiques caracterisiques
	 */
	public Groupe(int id_groupe, int id_individu, String denomination,
			String caracteristiques) {
		super();
		this.id_groupe = id_groupe;
		this.id_individu = id_individu;
		this.denomination = denomination;
		this.caracteristiques = caracteristiques;
	}

	
	/**
	 * @param id_groupe Id_groupe
	 * @param id_individu Id_individu
	 * @param denomination	denomination
	 * @param caracteristiques caracterisiques
	 * @deprecated utiliser int getID() ou PK getPK()
	 */
	public Groupe(PK id_groupe, int id_individu, String denomination,
			String caracteristiques) {
		this(Integer.parseInt(id_groupe.getKey().toString()),id_individu,denomination,caracteristiques);
	}
	
	/**
	 * @return the caracteristiques
	 */
	public String getCaracteristiques() {
		return this.caracteristiques;
	}

	/**
	 * @return the denomination
	 */
	public String getDenomination() {
		return this.denomination;
	}

	/**
	 * @return the id_groupe
	 */
	public int getId_groupe() {
		return this.id_groupe;
	}

	/**
	 * @return the id_individu
	 */
	public int getId_individu() {
		return this.id_individu;
	}

	/**
	 * @param caracteristiques the caracteristiques to set
	 */
	public void setCaracteristiques(String caracteristiques) {
		this.caracteristiques = caracteristiques;
	}

	/**
	 * @param denomination the denomination to set
	 */
	public void setDenomination(String denomination) {
		this.denomination = denomination;
	}

	/**
	 * @param id_groupe the id_groupe to set
	 */
	public void setId_groupe(int id_groupe) {
		this.id_groupe = id_groupe;
	}

	/**
	 * @param id_individu the id_individu to set
	 */
	public void setId_individu(int id_individu) {
		this.id_individu = id_individu;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Groupe [id_groupe=" + this.id_groupe + ", id_individu="
				+ this.id_individu + ", denomination=" + this.denomination
				+ ", caracteristiques=" + this.caracteristiques + "]";
	}

	/* (non-Javadoc)
	 * @see air2Java.bdd.entites.Entite#getPK()
	 */
	@Override
	public PK getPK() {
		return new PK(id_groupe);
	}

}
