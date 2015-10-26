/**
 * 
 */
package air2Java.utils;

/**
 * @author Gilbert
 *
 */
import air2Java.bdd.entites.*;


/**
 * @author Rom1
 *
 */
public class UtilEntity {
	 
	/**
	 * @param o Objet à afficher
	 */
	public  void affiche(Object o) {
		
		if(o == null){
			System.out.println("Impossible d'afficher un objet null");
			return;
		}
		
		if (o instanceof Groupe) {
			Groupe gr = (Groupe) o ;
			System.out.println(gr.toString());
			
//			System.out.println("Article:: " + a.getCodeArticle() + " Auteur: "
//					+ a.getAuteur() + " Prix:" + " " + a.getPrix() + " Categorie:"  + a.getRefCat());
		} else if (o instanceof Individu) {
			Individu i = (Individu) o ;
			System.out.println(i.toString());
		}

		 
			
	}
	

}