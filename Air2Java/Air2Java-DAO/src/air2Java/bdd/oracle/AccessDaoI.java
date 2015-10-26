/**
 * 
 */
package air2Java.bdd.oracle;

import java.util.ArrayList;


/**
 * @author Rom1
  */
public interface AccessDaoI {


	/**
	 * Renvoie toute l'Entite de type class_ ayant pour cl� ref
	 * @param class_ le type-entit�
	 * @return Toute la table
	 * @TODO remplacer class_ == XX.class par XX.class.equals(o.getClass()) ?
	 */
	public abstract Object findObject(Class<?> class_);

	/**
	 * Renvoie le tuple de l'Entite de type class_ ayant pour cl� ref
	 * @param class_ le type-entit�
	 * @param ref la cl�
	 * @return Entite de cl� ref
	 * @TODO remplacer class_ == XX.class par XX.class.equals(o.getClass()) ?
	 */
	public abstract Object findObject(Class<?> class_, Object ref);

//	/**
//	 * Renvoie un Pays
//	 * @param ref Cl�
//	 * @return le Pays ayant pour cl� ref
//	 */
//	public abstract Pays findPays(Object ref);
//
//	/**
//	 * Renvoie une Region
//	 * @param ref Cl�
//	 * @return la R�gion ayant pour cl� ref
//	 */
//	public abstract Region findRegion(Object ref);
//
//	/**
//	 * Supprime tous les Groupes ayant l'id donn�e
//	 * @param statementDelete Arraylist<Groupe>
//	 * @param cle Cl�
//	 * @return	Nombre de tuples effac�s
//	 */
//	public abstract int groupesDeletebyId(ArrayList<Groupe> statementDelete,
//			PK cle);
//
//	/**
//	 * Renvoie tous les Groupes pour un nom donn�
//	 * @param statementSelect
//	 *            statement
//	 * @param cle
//	 *            nom du groupe
//	 * @return nombre de tuples ou code erreur
//	 */
//	public abstract int groupesSelectbyNom(ArrayList<Groupe> statementSelect,
//			PK cle);
//
//	/**
//	 * Renvoie tous les artistes par instrument donn�
//	 * 
//	 * @param statementSelect
//	 * @param id_artiste
//	 * @return
//	 */
//	public abstract int individusSelectbyNom(
//			ArrayList<Individu> statementSelect, PK cle);

	/**
	 * Insert une Entite
	 * @param statementInsert liste d'entit�es
	 * @param o Entit� � ins�rer
	 * @return le nombre d'entit�s ins�r�es
	 */
	public abstract int InsertEntity(ArrayList<?> statementInsert, Object o);

	/**
	 * m�thode g�n�rique de modification de la base
	 * 
	 * @param sql
	 *            requ�te SQL de modification de la base : update, delete,
	 *            insert.
	 */

	public abstract void modifTable(String sql);

//	/**
//	 * Convertit un Resultset en un Groupe (d�-s�rialisation)
//	 * 
//	 * @param resultSet_
//	 * @param statementSelect
//	 */
//	public abstract void resultSetToGroupes(ResultSet resultSet_,
//			ArrayList<Groupe> statementSelect);

//	/**
//	 * Convertit un Resultset en un Individu (d�-s�rialisation)
//	 * 
//	 * @param resultSet_
//	 * @param statementSelect
//	 */
//	public abstract void resultSetToIndividus(ResultSet resultSet_,
//			ArrayList<Individu> statementSelect);

	/**
	 * Select valeur max de tuples quelconques
	 * @param attribut Attribut
	 * @param table Table
	 * @return Max de la Table
	 */
	public abstract int selectMaxTable(String attribut, String table);

	
	 /**
	 * Requ�te: select
	 * @param requete la requ�te sql 
	 * @param statementSelect les valeurs trouv�s dans un objet ArrayList 
	 * @return nombre de tuples s�lectionn�s
	 */
	public abstract int selectOne(String requete,
			ArrayList<Object> statementSelect);

	/**
	 * REQUETE SELECT TOUTE TABLE
	 * Requ�te: select champ from table Renvoie toutes les valeurs d'un attribut
	 * @param champ Champs
	 * @param table Table 
	 * @param statementSelect param�tre de la table param�tre sous forme d'objet ArrayList 
	 * @return nombre de tuples s�lectionn�s
	 */
	public abstract int valeursSelect(String champ, String table,
			ArrayList<Object> statementSelect);

}