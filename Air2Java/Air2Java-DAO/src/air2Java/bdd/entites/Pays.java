/**
 * 
 */
package air2Java.bdd.entites;

import java.io.Serializable;

/**
 * @author Rom1
 * 
 */
public class Pays extends Entite implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int id_pays;

	String pays_label;

	/**
	 * 
	 */
	public Pays() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param id_pays
	 *            Id_pays
	 * @param pays_label
	 *            pays_label
	 */
	public Pays(int id_pays, String pays_label) {
		super();
		this.id_pays = id_pays;
		this.pays_label = pays_label;
	}

	/**
	 * @param id_pays
	 *            Id_pays
	 * @param pays_label
	 *            pays_label
	 * @deprecated utiliser int getId_Pays() ou PK getPK()
	 */
	public Pays(PK id_pays, String pays_label) {
		this(Integer.parseInt(id_pays.getKey().toString()),pays_label);
	}

	/**
	 * @return the id_pays
	 */
	public int getId_pays() {
		return this.id_pays;
	}

	/**
	 * @return the pays_label
	 */
	public String getPays_label() {
		return this.pays_label;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see air2Java.bdd.entites.Entite#getPK()
	 */
	@Override
	public PK getPK() {
		return new PK(id_pays);
	}

	/**
	 * @param id_pays
	 *            the id_pays to set
	 */
	public void setId_pays(int id_pays) {
		this.id_pays = id_pays;
	}

	/**
	 * @param pays_label
	 *            the pays_label to set
	 */
	public void setPays_label(String pays_label) {
		this.pays_label = pays_label;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Pays [id_pays=" + this.id_pays + ", pays_label="
				+ this.pays_label + "]";
	}

}
