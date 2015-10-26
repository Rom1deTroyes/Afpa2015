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
	 * Renvoie toute l'Entite de type class_ ayant pour clé ref
	 * @param class_ le type-entité
	 * @return Toute la table
	 * @TODO remplacer class_ == XX.class par XX.class.equals(o.getClass()) ?
	 */
	public abstract Object findObject(Class<?> class_);

	/**
	 * Renvoie le tuple de l'Entite de type class_ ayant pour clé ref
	 * @param class_ le type-entité
	 * @param ref la clé
	 * @return Entite de clé ref
	 * @TODO remplacer class_ == XX.class par XX.class.equals(o.getClass()) ?
	 */
	public abstract Object findObject(Class<?> class_, Object ref);

//	/**
//	 * Renvoie un Pays
//	 * @param ref Clé
//	 * @return le Pays ayant pour clé ref
//	 */
//	public abstract Pays findPays(Object ref);
//
//	/**
//	 * Renvoie une Region
//	 * @param ref Clé
//	 * @return la Région ayant pour clé ref
//	 */
//	public abstract Region findRegion(Object ref);
//
//	/**
//	 * Supprime tous les Groupes ayant l'id donnée
//	 * @param statementDelete Arraylist<Groupe>
//	 * @param cle Clé
//	 * @return	Nombre de tuples effacés
//	 */
//	public abstract int groupesDeletebyId(ArrayList<Groupe> statementDelete,
//			PK cle);
//
//	/**
//	 * Renvoie tous les Groupes pour un nom donné
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
//	 * Renvoie tous les artistes par instrument donné
//	 * 
//	 * @param statementSelect
//	 * @param id_artiste
//	 * @return
//	 */
//	public abstract int individusSelectbyNom(
//			ArrayList<Individu> statementSelect, PK cle);

	/**
	 * Insert une Entite
	 * @param statementInsert liste d'entitées
	 * @param o Entité à insérer
	 * @return le nombre d'entités insérées
	 */
	public abstract int InsertEntity(ArrayList<?> statementInsert, Object o);

	/**
	 * méthode générique de modification de la base
	 * 
	 * @param sql
	 *            requête SQL de modification de la base : update, delete,
	 *            insert.
	 */

	public abstract void modifTable(String sql);

//	/**
//	 * Convertit un Resultset en un Groupe (dé-sérialisation)
//	 * 
//	 * @param resultSet_
//	 * @param statementSelect
//	 */
//	public abstract void resultSetToGroupes(ResultSet resultSet_,
//			ArrayList<Groupe> statementSelect);

//	/**
//	 * Convertit un Resultset en un Individu (dé-sérialisation)
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
	 * Requête: select
	 * @param requete la requête sql 
	 * @param statementSelect les valeurs trouvés dans un objet ArrayList 
	 * @return nombre de tuples sélectionnés
	 */
	public abstract int selectOne(String requete,
			ArrayList<Object> statementSelect);

	/**
	 * REQUETE SELECT TOUTE TABLE
	 * Requête: select champ from table Renvoie toutes les valeurs d'un attribut
	 * @param champ Champs
	 * @param table Table 
	 * @param statementSelect paramètre de la table paramètre sous forme d'objet ArrayList 
	 * @return nombre de tuples sélectionnés
	 */
	public abstract int valeursSelect(String champ, String table,
			ArrayList<Object> statementSelect);

}