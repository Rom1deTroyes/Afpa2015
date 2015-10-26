/**
 * 
 */
package air2Java.bdd.entites;

import java.io.Serializable;


/**
 * @author Rom1
 *
 */
public class User extends Entite implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	PK id_user ;
	String nom ;
	String password ;
	
	
	/**
	 * 
	 */
	public User() {
		this(new PK(0),"Nom","Password");
	}


	/**
 * @param id_user Id_user
 * @param nom	nom
 * @param password	password
 */
public User(PK id_user, String nom, String password) {
	super();
	this.id_user = id_user;
	this.nom = nom;
	this.password = password;
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



	/* (non-Javadoc)
	 * @see air2Java.bdd.entites.Entite#getPK()
	 */
	@Override
	public PK getPK() {
		return id_user;
	}


	/**
	 * @return the id_user
	 */
	public PK getId_user() {
		return this.id_user;
	}


	/**
	 * @return the password
	 */
	public String getPassword() {
		return this.password;
	}


	/**
	 * @param id_user the id_user to set
	 */
	public void setId_user(PK id_user) {
		this.id_user = id_user;
	}


	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Users [id_user=" + this.id_user + ", nom=" + this.nom
				+ ", password=" + this.password + "]";
	}

}
