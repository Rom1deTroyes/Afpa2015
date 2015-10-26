/**
 * 
 */
package air2Java.bdd;

/**
 * @author Gilbert
 * @author Rom1
 */

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.NamingException;

import air2Java.bdd.entites.Groupe;
import air2Java.bdd.entites.Individu;
import air2Java.bdd.entites.PK;
import air2Java.bdd.oracle.AccessDao;
import air2Java.utils.Dates;
import air2Java.utils.UtilEntity;

/**
 * @author Rom1
 * 
 */
public class testeOracle {

	/**
		 * 
		 */
	public testeOracle() {
		// TODO Auto-generated constructor stub
	}

	private static AccessDao cd_ = new AccessDao();
	private static UtilEntity u = new UtilEntity();

	/**
	 * @param args Passés à l'Appel
	 * @throws NamingException Name
	 * @throws SQLException SQL
	 */
	public static void main(String[] args) throws NamingException, SQLException {

		manip();
	}

	/**
	 * 
	 */
	public static void manip() {
		System.out.println("TEST BDD pour select");

		// AFFICHE UN Groupe
		System.out.println("\nAffiche UN Groupe");
		Groupe gr = cd_.findGroupe(15);
		u.affiche(gr);
		
		gr = (Groupe) cd_.findObject(Groupe.class, "15");
		u.affiche(gr);

		 // findObject(Groupe) renvoie des Groupe
		@SuppressWarnings("unchecked")
		ArrayList<Groupe> groups = (ArrayList<Groupe>) cd_.findObject(Groupe.class);
		for (Groupe grs : groups) {
			System.out.println(grs.toString());
		}
		
		// AFFICHE les Groupes
		String nomgroupe = "%%";
		System.out.println("\nAffiche Groupes " + nomgroupe);
		groups = new ArrayList<Groupe>();
		cd_.groupesSelectbyNom(groups, new PK(nomgroupe));
		for (Groupe grs : groups) {
			System.out.println(grs.toString());
		}

		// // AFFICHE ARTICLES POUR UNE CATEGORIE
		// int refCat = 100;
		// System.out.println("\nAffiche articles de categorie " + refCat);
		// ArrayList<Article> as = new ArrayList<Article>();
		// cd_.articlesSelectbyChamp(as, new PK(refCat));
		// for (Article a : as) {
		// u.affiche(as);
		// }

		// AFFICHE UN Individu
		System.out.println("\nAffiche UN Individu");
		Individu indi = cd_.findIndividu(58);
		System.out.println(indi.toString());

		// AFFICHE Individus de nom
		String nom = "%%";
		System.out.println("\nAffiche Individus " + nom);
		ArrayList<Individu> indivs = new ArrayList<Individu>();
		cd_.individusSelectbyNom(indivs, new PK(nom));
		for (Individu ind : indivs) {
			System.out.println(ind.toString());
		}

		// Ajouter UN Individu
		System.out.println("\nAjouter un Individu");
		Date date = Dates.toDate("1981-11-23 00:00:00");
		cd_.InsertEntity(indivs, new Individu(new PK(81), 15, "Boquet",
				"Nadia", date));
		Individu indiv = cd_.findIndividu(81);
		System.out.println(indiv.toString());

		// Ajouter un Groupe
		System.out.println("\nAjouter un Groupe");
		cd_.InsertEntity(groups, new Groupe(new PK(81), 81, "Encluminure",
				"Le groupe de Nadia"));
		Groupe groupe = cd_.findGroupe(81);
		System.out.println(groupe.toString());

		//
		// // AFFICHE ARTISTES POUR UN INSTUMENT
		// System.out.println("\nAffiche artistes jouant " + instrument);
		// arts = new ArrayList<Artiste>();
		// cd_.artistesSelectbyInstrument(arts, new PK(instrument));
		// for (Artiste a : arts) {
		// System.out.println(a.toString());
		// }

	}

}
