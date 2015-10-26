/**
 * 
 */
package air2Java.bdd.oracle;

/**
 * @author Gilbert
 *
 */

/*
 *   				Classe bdd.AccessPool
 */

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import air2Java.bdd.entites.Groupe;
import air2Java.bdd.entites.Individu;
import air2Java.bdd.entites.PK;
import air2Java.bdd.entites.Pays;
import air2Java.bdd.entites.Region;
import air2Java.bdd.entites.User;
import air2Java.utils.Dates;

/**
 * @author Rom1
 * 
 */
public class AccessDao extends ConnectDao implements AccessDaoI {

	/**
	 * 
	 */
	public AccessDao() {
		createStatement(); // Pour initialiser connection
	}

	/**
	 * @param groupe Clé
	 */
	public void deleteGroupe(Groupe groupe) {
		System.out.println("// " + this.getClass() +" DeleteGroupe "+ groupe);
	}

	@Override
	protected void finalize() throws Throwable {
		disconnection();
		super.finalize();
	}

	/**
	 * Renvoie un Groupe
	 * @param ref Clé
	 * @return Le Groupe ayant pour clé ref
	 */
	public Groupe findGroupe(Object ref) {
		createStatement();
		try {
			String sql = "select * from GROUPES where ID_GROUPE = ? ";
			pstatement_ = connect_.prepareStatement(sql);
			pstatement_.setInt(1, (int) ref);
			resultSet_ = pstatement_.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			disconnection();
			return null;
		}
		ArrayList<Groupe> statementSelect = new ArrayList<Groupe>();
		resultSetToGroupes(resultSet_, statementSelect);
		disconnection();
		return statementSelect.get(0);
	}

	/**
	 * Renvoie un Individu
	 * @param ref Clé
	 * @return L'Individu ayant pour Clé ref
	 */
	public Individu findIndividu(Object ref) {
		createStatement();
		try {
			String sql = "select id_individu, id_civilite, nom, prenom, date_naissance from INDIVIDUS where ID_INDIVIDU = ? ";
			pstatement_ = connect_.prepareStatement(sql);
			pstatement_.setInt(1, (int) ref);
			resultSet_ = pstatement_.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			disconnection();
			return null;
		}
		ArrayList<Individu> statementSelect = new ArrayList<Individu>();
		resultSetToIndividus(resultSet_, statementSelect);
		disconnection();
		return statementSelect.get(0);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see air2Java.bdd.oracle.AccessDaoI#findObject(java.lang.Class)
	 */
	@Override
	public Object findObject(Class<?> class_) {

		createStatement();

		if (class_ == Groupe.class) {
			try {
				String sql = "select * from GROUPES";
				pstatement_ = connect_.prepareStatement(sql);
				// pstatement_.setString(1, ref.toString());
				resultSet_ = pstatement_.executeQuery();
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
				disconnection();
				return null;
			}
			ArrayList<Groupe> statementSelect = new ArrayList<Groupe>();
			resultSetToGroupes(resultSet_, statementSelect);
			disconnection();
			return statementSelect;
		} else if (Individu.class.equals(class_)) {
			try {
				String sql = "select * from INDIVIDUS";
				pstatement_ = connect_.prepareStatement(sql);
				resultSet_ = pstatement_.executeQuery();
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
				disconnection();
				return null;
			}
			ArrayList<Individu> statementSelect = new ArrayList<Individu>();
			resultSetToIndividus(resultSet_, statementSelect);
			disconnection();
			return statementSelect;
		} else if (Pays.class.equals(class_)) {
			try {
				String sql = "select * from PAYS";
				pstatement_ = connect_.prepareStatement(sql);
				resultSet_ = pstatement_.executeQuery();
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
				disconnection();
				return null;
			}
			Set<Pays> statementSelect = new HashSet<Pays>();
			resultSetToPays(resultSet_, statementSelect);
			disconnection();
			return statementSelect;
		}
		
			// } else if (class_ == Supporte.class) {
			// Supporte_PK pk = (Supporte_PK) ref;
			// try {
			// String sql =
			// "select * from SUPPORTE where REFSUPPORT = ? and REFCAT = ?";
			// pstatement_ = connect_.prepareStatement(sql);
			// pstatement_.setInt(1, pk.getRefSupport());
			// pstatement_.setInt(2, pk.getRefCat());
			// resultSet_ = pstatement_.executeQuery();
			// } catch (Exception e) {
			// e.printStackTrace();
			// e.getMessage();
			// disconnection();
			// return null;
			// }
			// ArrayList<Supporte> statementSelect = new ArrayList<Supporte>();
			// cdAll_.resultSetToSupportes(resultSet_, statementSelect);
			// disconnection();
			// return statementSelect.get(0);
			// }


		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see air2Java.bdd.oracle.AccessDaoI#findObject(java.lang.Class,
	 * java.lang.Object)
	 */
	@Override
	public Object findObject(Class<?> class_, Object ref) {

		createStatement();

		if (class_ == Groupe.class) {
			try {
				String sql = "select * from GROUPES where ID_GROUPE like ? ";
				pstatement_ = connect_.prepareStatement(sql);
				pstatement_.setString(1, ref.toString());
				resultSet_ = pstatement_.executeQuery();
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
				disconnection();
				return null;
			}
			ArrayList<Groupe> statementSelect = new ArrayList<Groupe>();
			resultSetToGroupes(resultSet_, statementSelect);
			disconnection();
			return statementSelect.get(0);
		} else if (Individu.class.equals(class_)) {
			try {
				String sql = "select * from INDIVIDUS where ID_INDIVIDU = ? ";
				pstatement_ = connect_.prepareStatement(sql);
				pstatement_.setInt(1, (int) ref);
				resultSet_ = pstatement_.executeQuery();
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
				disconnection();
				return null;
			}
			ArrayList<Individu> statementSelect = new ArrayList<Individu>();
			resultSetToIndividus(resultSet_, statementSelect);
			disconnection();
			return statementSelect.get(0);
		}  else if (Pays.class.equals(class_)) {
			try {
				String sql = "select * from PAYS where ID_PAYS = ? ";
				pstatement_ = connect_.prepareStatement(sql);
				pstatement_.setInt(1, (int) ref);
				resultSet_ = pstatement_.executeQuery();
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
				disconnection();
				return null;
			}
			Set<Pays> statementSelect = new HashSet<Pays>();
			resultSetToPays(resultSet_, statementSelect);
			disconnection();
			return statementSelect.toArray()[0];
		}
		

			// } else if (class_ == Supporte.class) {
			// Supporte_PK pk = (Supporte_PK) ref;
			// try {
			// String sql =
			// "select * from SUPPORTE where REFSUPPORT = ? and REFCAT = ?";
			// pstatement_ = connect_.prepareStatement(sql);
			// pstatement_.setInt(1, pk.getRefSupport());
			// pstatement_.setInt(2, pk.getRefCat());
			// resultSet_ = pstatement_.executeQuery();
			// } catch (Exception e) {
			// e.printStackTrace();
			// e.getMessage();
			// disconnection();
			// return null;
			// }
			// ArrayList<Supporte> statementSelect = new ArrayList<Supporte>();
			// cdAll_.resultSetToSupportes(resultSet_, statementSelect);
			// disconnection();
			// return statementSelect.get(0);
			// }
		
		return null;
	}

	
	/**
	 * @param ref Clé
	 * @return	Pays
	 */
	public Pays findPays(Object ref) {
		createStatement();
		try {
			String sql = "select Id_Pays, Pays_label from Pays where ID_Pays = ? ";
			pstatement_ = connect_.prepareStatement(sql);
			pstatement_.setInt(1, (int) ref);
			resultSet_ = pstatement_.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			disconnection();
			return null;
		}
		Set<Pays> statementSelect = new HashSet<Pays>();
		resultSetToPays(resultSet_, statementSelect);
		disconnection();
		return (Pays) statementSelect.toArray()[0];		
	}

	/**
	 * @param grE
	 * @return
	 */
	public Set<Pays> findPaysSelectbyGroupe(Groupe grE) {
		// TODO Auto-generated method stub
		try {
			String sql = "select id_pays, pays_label from pays right join represente_pays using (id_pays) where id_groupe = ? order by pays_label ";
			pstatement_ = connect_.prepareStatement(sql);
			pstatement_.setInt(1, (int) grE.getId_groupe());
			resultSet_ = pstatement_.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			disconnection();
			return null;
		}
		Set<Pays> statementSelect = new HashSet<Pays>();
		resultSetToPays(resultSet_, statementSelect);
		disconnection();
		return statementSelect;
	}

	/**
	 * @param grE
	 * @return
	 */
	public Set<Region> findRegionsSelectbyGroupe(Groupe grE) {
		try {
			String sql = "select id_region, region_label from regions right join represente_region using (id_region) where id_groupe = ? order by region_label " ;
			pstatement_ = connect_.prepareStatement(sql);
			pstatement_.setInt(1, (int) grE.getId_groupe());
			resultSet_ = pstatement_.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			disconnection();
			return null;
		}
		Set<Region> statementSelect = new HashSet<Region>();
		resultSetToRegions(resultSet_, statementSelect);
		disconnection();
		return statementSelect;
	}
	

	
	/**
	 * @param ref Clé
	 * @return Region
	 */
	public Region findRegion(Object ref) {
		createStatement();
		try {
			String sql = "select Id_region, region_label from REGIONS where ID_REGION = ? ";
			pstatement_ = connect_.prepareStatement(sql);
			pstatement_.setInt(1, (int) ref);
			resultSet_ = pstatement_.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			disconnection();
			return null;
		}
		Set<Region> statementSelect = new HashSet<Region>();
		resultSetToRegions(resultSet_, statementSelect);
		disconnection();
		return (Region) statementSelect.toArray()[0];
	}

	/***********************************************
	 * 
	 * REQUETES SELECT DE TYPE PROJECTION
	 **********************************************/
	
	 /**
	 * Renvoie un utilisateur de la base à partir de son nom et pwd
	 * 
	 * @param nom
	 *            nom
	 * @param pwd
	 *            password
	 * @return User TODO : une vraie identification par la table Utilisateur !
	 */
	public User getUser(String nom, String pwd) {
		createStatement();
		// String requete =
		// "select * from Individus where NOM   = ?  and MOTDEPASSE   = '" + pwd
		// +"'";
		String requete = "select * from INDIVIDUS where NOM = ? and PRENOM = ? ";
		PreparedStatement reqp;
		try {
			reqp = connect_.prepareStatement(requete);
			System.out.println("// AccessDao - requete: " + requete + " - "
					+ nom + " / " + pwd);
			reqp.setString(1, nom);
			reqp.setString(2, pwd);

			// execution de la requete
			ResultSet result = reqp.executeQuery();
			result.next();
			User util = new User();
			util.setNom(result.getString("NOM"));
			util.setPassword(result.getString("PRENOM"));
			System.out.println("// AccessDao - Utilisateur identifié: "
					+ util.getNom());
			reqp.close();
			return util;
		} catch (SQLException sqlE) {
			System.out.println("// AccessDao - Erreur SQL : "
					+ sqlE.getMessage().toString());
			return null;
		} catch (Exception e) {
			System.out.println("// AccessDao - Erreur autre que SQL : "
					+ e.getMessage().toString());
			return null;
		}
	}

	/**
	 * @param statementDelete 
	 * @param cle Clé
	 * @return 
	 * 
	 */
	public int groupesDeletebyId(ArrayList<Groupe> statementDelete, PK cle) {
		if (statementDelete == null) {
			disconnection();
			return (-1);
		}
		if (Integer.parseInt(cle.getKey().toString()) < 1)
			return -2;
		else
			statementDelete.clear(); // clear liste pour résultats
		createStatement();
		try {
			resultSet_ = statement_
					.executeQuery("delete from groupes where ID_GROUPE" + " = "
							+ cle.getKey());

			// générer le résultat
		} catch (SQLException e) {
			disconnection();
			e.printStackTrace();
		}
		System.out.println("AccessPool - Nombre de tuples lus: "
				+ statementDelete.toString());
		disconnection();
		return statementDelete.size();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see air2Java.bdd.oracle.AccessDaoI#modifTable(java.lang.String)
	 */

	/**
	 * @param statementSelect Liste de Groupes
	 * @param cle Clé
	 * @return nombre de Groupes trouvés
	 */
	public int groupesSelectbyNom(ArrayList<Groupe> statementSelect, PK cle) {
		if (statementSelect == null) {
			disconnection();
			return (-1);
		}
		if (cle.getKey() == null)
			return (-2);
		else
			statementSelect.clear(); // clear liste pour résultats
		createStatement();
		try {
			System.out.println("KEY GROUPE :" + cle.getKey());
			String sql = "SELECT id_groupe, id_individu, denomination, caracteristiques FROM groupes WHERE denomination LIKE ? ORDER BY denomination";
			pstatement_ = connect_.prepareStatement(sql);
			pstatement_.setString(1, cle.getKey().toString());
			resultSet_ = pstatement_.executeQuery();

			// générer le résultat
			while (resultSet_.next()) { // recopier dans la collection
				Groupe unGroupe = new Groupe(new PK(
						resultSet_.getInt("id_groupe")),
						resultSet_.getInt("id_individu"),
						resultSet_.getString("denomination"),
						resultSet_.getString("caracteristiques"));
				statementSelect.add(unGroupe);
			}
		} catch (SQLException e) {
			disconnection();
			e.printStackTrace();
			e.getMessage();
			return (-3);
		}

		System.out.println("AccessPool - Nombre de tuples lus: "
				+ statementSelect.size());
		disconnection();
		return statementSelect.size();
	}

	/*************************************************
	 * 
	 * REQUETES SELECT
	 * 
	 ************************************************/

	/** 
	 * @param statementSelect Liste de Individu 
	 * @param cle  Clé
	 * @return nombre d'Individu trouvés
	 */	 
	public int individusSelectbyNom(ArrayList<Individu> statementSelect, PK cle) {
		if (statementSelect == null) {
			disconnection();
			return (-1);
		}
		if (cle.getKey() == null)
			return (-2);
		else
			statementSelect.clear(); // clear liste pour résultats
		createStatement();
		try {
			System.out.println("KEY INDIVIDU :" + cle.getKey());
			String sql = "SELECT id_individu, id_civilite, nom, prenom, date_naissance FROM individus WHERE nom LIKE ? ORDER BY nom, prenom";
			pstatement_ = connect_.prepareStatement(sql);
			pstatement_.setString(1, cle.getKey().toString());
			resultSet_ = pstatement_.executeQuery();

			// resultSet_ = statement_
			// .executeQuery("select * from individus where NOM" + " LIKE '%"
			// + cle.getKey()+"%'");

			// générer le résultat
			while (resultSet_.next()) { // recopier dans la collection
				Individu unIndividu = new Individu(new PK(
						resultSet_.getInt("id_individu")),
						resultSet_.getInt("id_civilite"),
						resultSet_.getString("nom"),
						resultSet_.getString("prenom"),
						resultSet_.getDate("date_naissance"));
				statementSelect.add(unIndividu);
			}
		} catch (SQLException e) {
			disconnection();
			e.printStackTrace();
			e.getMessage();
			return (-3);
		}

		System.out.println("AccessPool - Nombre de tuples lus: "
				+ statementSelect.size());
		disconnection();
		return statementSelect.size();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see air2Java.bdd.oracle.AccessDaoI#InsertEntity(java.util.ArrayList,
	 * java.lang.Object)
	 * TODO Ajouter un test si existe (Select Objet from TABLE) { update } else { insert }
	 */
	@Override
	public int InsertEntity(ArrayList<?> statementInsert, Object o) {
		String table = "";
		String values = "";
		String sql = "";
		try {

			if (statementInsert == null) {
				disconnection();
				return (-1);
			} else if (Groupe.class.equals(o.getClass())) {
				table = "GROUPES";
				values = "?,?,?,?";
				sql = "insert into " + table + " values (" + values + ")";

				Groupe gr = (Groupe) o;

				statementInsert.clear(); // clear liste pour résultats
				createStatement();
				// resultSet_ = pstatement_.executeQuery(sql);
				pstatement_ = connect_.prepareStatement(sql);
				pstatement_.setInt(1, (int) gr.getId_groupe());
				pstatement_.setInt(2, gr.getId_individu());
				pstatement_.setString(3, gr.getDenomination());
				pstatement_.setString(4, gr.getCaracteristiques());

			} else if (Individu.class.equals(o.getClass())) {
				table = "INDIVIDUS";
				values = "?,?,?,?,?";
				sql = "insert into " + table + " values (" + values + ")";

				Individu ind = (Individu) o;

				System.out.println(ind.getClass() + " : " + ind.toString());
				System.out.println(sql);

				statementInsert.clear(); // clear liste pour résultats
				createStatement();
				// resultSet_ = pstatement_.executeQuery(sql);
				pstatement_ = connect_.prepareStatement(sql);
				pstatement_.setInt(1, (int) ind.getId_individu());
				pstatement_.setInt(2, ind.getId_civilite());
				pstatement_.setString(3, ind.getNom());
				pstatement_.setString(4, ind.getPrenom());
				pstatement_
						.setDate(5, Dates.javaToSql(ind.getDate_naissance()));

			} else {
				return -2;
			}

			System.out.println(o.getClass() + " : " + o.toString());
			System.out.println("pstatement : " + pstatement_.toString());

			resultSet_ = pstatement_.executeQuery();

		} catch (SQLException e) {
			// e.printStackTrace();
			e.getMessage();
			disconnection();
			if (e instanceof java.sql.SQLIntegrityConstraintViolationException) {
				System.out.println(e.getLocalizedMessage());
			}
			return e.getErrorCode();
		}
		disconnection();
		return statementInsert.size();
	}

	/**
	 * @param groupe Clé
	 */
	public void modifierGroupe(Groupe groupe) {
		System.out.println("// " + this.getClass() +" ModifGroupe "+ groupe);		
	}

	@Override
	synchronized public void modifTable(String sql) {
		createStatement();
		PreparedStatement ps;
		try {
			ps = connect_.prepareStatement(sql);
			ps.executeUpdate();
			disconnection();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		ConnectDao.razStatements();

	}

	/**
	 * (non-Javadoc)
	 * @param resultSet_ ResultSet
	 * @param statementSelect Liste de Groupes
	 * 
	 * @see
	 * air2Java.bdd.oracle.AccessDaoI#resultSetToEntites(java.sql.ResultSet,
	 * java.util.ArrayList)
	 */
	private void resultSetToGroupes(ResultSet resultSet_,
			ArrayList<Groupe> statementSelect) {
		// générer le résultat
		try {
			while (resultSet_.next()) { // recopier dans la collection
				Groupe unGroupe = new Groupe(new PK(
						resultSet_.getInt("id_groupe")),
						resultSet_.getInt("id_individu"),
						resultSet_.getString("denomination"),
						resultSet_.getString("caracteristiques"));

				statementSelect.add(unGroupe);
			}
		} catch (SQLException e) {
			disconnection();
			e.printStackTrace();
		}
	}

	// final static String verrou = "Attente" ;
	//
	// public static void setClientIncrement(Client c) {
	// synchronized(verrou) {
	// // Récupération de la valeur max de numcom pour incrémentation
	// int max = AccessDao.selectMaxTable("IDCLIENT", "CLIENT");
	// e.setIdClient(++max) ;
	// AccessDao.insertClient(e) ;
	// }
	// }

	/**
	 * @param resultSet_ResultSet
	 * @param statementSelect Liste de Individus
	 * @see air2Java.bdd.oracle.AccessDaoI#resultSetToEntites(java.sql.ResultSet, java.util.ArrayList)
	 */

	private void resultSetToIndividus(ResultSet resultSet_,
			ArrayList<Individu> statementSelect) {
		// générer le résultat
		try {
			while (resultSet_.next()) { // recopier dans la collection
				Individu unIndividu = new Individu(new PK(
						resultSet_.getInt("ID_INDIVIDU")),
						resultSet_.getInt("id_civilite"),
						resultSet_.getString("nom"),
						resultSet_.getString("prenom"),
						resultSet_.getDate("date_naissance"));
				statementSelect.add(unIndividu);
			}
		} catch (SQLException e) {
			disconnection();
			e.printStackTrace();
		}
	}

	/**
	 * Convertit un Resultset en une liste de Pays (dé-sérialisation)
	 * 
	 * @param resultSet_
	 * @param statementSelect
	 */
	private void resultSetToPays(ResultSet resultSet_,
			Set<Pays> statementSelect) {
		// générer le résultat
		try {
			while (resultSet_.next()) { // recopier dans la collection
				Pays unPays = new Pays(new PK(
						resultSet_.getInt("id_pays")),
						resultSet_.getString("pays_label"));
				statementSelect.add(unPays);
			}
		} catch (SQLException e) {
			disconnection();
			e.printStackTrace();
		}
	}

	/**
	 * @param nom
	 * @param pwd
	 * @return
	 */
	// /**
	// * @param nom nom
	// * @param pass password
	// * @return
	// */
	// public User findUser(String nom, String pass) {
	// createStatement();
	// try {
	// String sql = "SELECT id_pays, pays_label FROM pays WHERE Id_Pays = ? ";
	// pstatement_ = connect_.prepareStatement(sql);
	// pstatement_.setInt(1, (int) ref);
	// resultSet_ = pstatement_.executeQuery();
	// } catch (Exception e) {
	// e.printStackTrace();
	// e.getMessage();
	// disconnection();
	// return null;
	// }
	// Set<Pays> statementSelect = new HashSet<Pays>();
	// resultSetToPays(resultSet_, statementSelect);
	// disconnection();
	// return statementSelect.toArray()[0];
	// }

	/**
	 * Convertit un Resultset en une liste de Region (dé-sérialisation)
	 * 
	 * @param resultSet_
	 * @param statementSelect
	 */
	private void resultSetToRegions(ResultSet resultSet_,
			Set<Region> statementSelect) {
		
		// générer le résultat
		try {
			while (resultSet_.next()) { // recopier dans la collection
				Region uneRegion = new Region(new PK(
						resultSet_.getInt("id_region")),
						resultSet_.getString("region_label"));
				statementSelect.add(uneRegion);
			}
		} catch (SQLException e) {
			disconnection();
			e.printStackTrace();
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see air2Java.bdd.oracle.AccessDaoI#selectMaxTable(java.lang.String,
	 * java.lang.String)
	 */
	@Override
	public int selectMaxTable(String attribut, String table) {
		int max = 0;
		createStatement();
		String requete = "select max(" + attribut + ") as maximum from "
				+ table;
		try {
			resultSet_ = statement_.executeQuery(requete);
			resultSet_.next();
			max = resultSet_.getInt("maximum");
			System.out.println("Valeur maximum de " + attribut + " de table "
					+ table + ": " + max);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnection();
		return max;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see air2Java.bdd.oracle.AccessDaoI#selectOne(java.lang.String,
	 * java.util.ArrayList)
	 */
	@Override
	public int selectOne(String requete, ArrayList<Object> statementSelect) {
		createStatement();
		if (statementSelect == null)
			return (-1);
		if (requete == null)
			return (-1);
		else
			statementSelect.clear(); // clear liste pour résultats
		try {
			resultSet_ = statement_.executeQuery(requete);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			while (resultSet_.next()) {
				statementSelect.add(resultSet_.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Nombre de tuples lus: " + statementSelect.size());
		disconnection();
		return statementSelect.size();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see air2Java.bdd.oracle.AccessDaoI#valeursSelect(java.lang.String,
	 * java.lang.String, java.util.ArrayList)
	 */
	@Override
	public int valeursSelect(String champ, String table,
			ArrayList<Object> statementSelect) {
		createStatement();
		if (statementSelect == null) {
			return (-1);
		} else
			statementSelect.clear(); // clear liste pour résultats
		try {
			resultSet_ = statement_.executeQuery("select " + "\"" + champ
					+ "\"" + " from " + table + " order by \"" + champ + "\"");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			while (resultSet_.next()) {
				statementSelect.add(resultSet_.getString(champ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Nombre de tuples lus: " + statementSelect.size());
		disconnection();
		return statementSelect.size();
	}
	

}