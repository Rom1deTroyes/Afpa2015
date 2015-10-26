package air2Java.bdd.oracle;
///**
// * 
// */
//package bdd.oracle;
//
//import bdd.BdD;
//import bdd.ManagerEntityI;
//import entites.Article;
//import entites.Artiste;
//import entites.Category;
//import entites.Client;
//import entites.Interpreter;
//import entites.PK;
//import entites.Support;
//
///**
// * @author Gilbert
// * @author Rom1
// * 
// */
//public class ManagerEntity {
//
//	private Base base;
//
//	/**
//	 * 
//	 */
//	public ManagerEntity() {
//		// TODO Auto-generated constructor stub
//	}
//
//	/**
//	 * @param base
//	 *            base
//	 */
//	public ManagerEntity(BdD base) {
//		this.base = (Base) base;
//	}
//
//	/*
//	 * (non-Javadoc)
//	 * 
//	 * @TODO Changer .size()+1 en équivalant .max()+1
//	 * 
//	 * @see sonotheque.ManagerEntityI#createEntity(java.lang.Object)
//	 */
//	@Override
//	public Object createEntity(Object o) {
//		Object res = null;
//		PK key = null;
//
//		if (Article.class.equals(o.getClass())) {
//			// key = new PK(new Integer(base.getTableArticles().size() + 1)) ;
//			Article a = (Article) o;
//			key = new PK(a.getCodeArticle());
//			res = base.getTableArticles().put(key, a);
//			System.out.print("\tRES:" + res);
//			if (res == null) {
//				res = key;
//			}
//		} else if (Category.class.equals(o.getClass())) {
//			Category c = (Category) o;
//			key = new PK(c.getRefCat());
//			res = base.getTableCategories().put(key, c);
//			if (res == null) {
//				res = key;
//			}
//		} else if (Artiste.class.equals(o.getClass())) {
//			Artiste a = (Artiste) o;
//			key = new PK(a.getId_artiste());
//			res = base.getTableArtistes().put(key, a);
//			if (res == null) {
//				res = key;
//			}
//		} else if (Interpreter.class.equals(o.getClass())) {
//			Interpreter i = (Interpreter) o;
//			key = new PK(new int[] { i.getId_artiste(), i.getCodeArticle() });
//			res = base.getTableInterpreter().put(key, i);
//			if (res == null) {
//				res = key;
//			}
//
//			// TODO la PK avec 2 attributs !
//			// key = new PK(new Integer(base.getTableInterpreter().size() + 1))
//			// ;
//			// Interpreter i = base.getTableInterpreter().put(key, (Interpreter)
//			// o);
//			// res = i;
//		} else if (Support.class.equals(o.getClass())) {
//			Support s = (Support) o;
//			key = new PK(s.getRef_support());
//			res = base.getTableSupports().put(key, s);
//			if (res == null) {
//				res = key;
//			}
//		} else if (Client.class.equals(o.getClass())) {
//			Client c = (Client) o;
//			key = new PK(c.getIdclient());
//			res = base.getTableClients().put(key, c);
//			if (res == null) {
//				res = key;
//			}
//		}
//		return key;
//	}
//
//	/*
//	 * (non-Javadoc)
//	 * 
//	 * @see sonotheque.ManagerEntityI#readEntity(java.lang.Class,
//	 * java.lang.Object)
//	 */
//	@Override
//	public Object readEntity(Class<?> class_, Object cle) {
//		Object res = null;
//		if (class_ == Article.class) {
//			Article a = base.getTableArticles().get(cle);
//			res = a;
//		} else if (class_ == Category.class) {
//			Category c = base.getTableCategories().get(cle);
//			res = c;
//		} else if (class_ == Artiste.class) {
//			Artiste a = base.getTableArtistes().get(cle);
//			res = a;
//		} else if (class_ == Interpreter.class) {
//			Interpreter i = base.getTableInterpreter().get(cle);
//			res = i;
//		} else if (class_ == Support.class) {
//			Support c = base.getTableSupports().get(cle);
//			res = c;
//		} else if (class_ == Client.class) {
//			Client c = base.getTableClients().get(cle);
//			res = c;
//		}
//
//		return res;
//	}
//
//	/*
//	 * (non-Javadoc)
//	 * 
//	 * @see sonotheque.ManagerEntityI#updateEntity(java.lang.Object)
//	 */
//	@Override
//	public Object updateEntity(Object o) {
//
////		Article a = (Article) o;
////		a = base.getTableArticles().get(a.getCodeArticle());
////		if (a == null) {
////			return null;
////		} else {
////			base.getTableArticles().put(a.getCodeArticle(), a);
////			return a;
////		}
//
//		if(this.deleteEntity(o.getClass(), o) != null){
//			return this.createEntity(o);
//		}
//		return null ;
//	}
//
//	/*
//	 * (non-Javadoc)
//	 * 
//	 * @see sonotheque.ManagerEntityI#deleteEntity(java.lang.Class,
//	 * java.lang.Object)
//	 */
//	@Override
//	public Object deleteEntity(Class<?> class_, Object cle) {
//		Object res = null;
//		if (class_ == Article.class) {
//			if (base.getTableArticles().containsKey(cle)) {
//				Article a = base.getTableArticles().remove(cle);
//				res = a;
//			}
//		} else if (class_ == Category.class) {
//			if (base.getTableCategories().containsKey(cle)) {
//				Category c = base.getTableCategories().remove(cle);
//				res = c;
//			}
//		} else if (class_ == Artiste.class) {
//			if (base.getTableArtistes().containsKey(cle)) {
//				Artiste a = base.getTableArtistes().remove(cle);
//				res = a;
//			}
//		} else if (class_ == Interpreter.class) {
//			if (base.getTableInterpreter().containsKey(cle)) {
//				Interpreter i = base.getTableInterpreter().remove(cle);
//				res = i;
//			}
//		} else if (class_ == Support.class) {
//			if (base.getTableSupports().containsKey(cle)) {
//				Support s = base.getTableSupports().remove(cle);
//				res = s;
//			}
//		} else if (class_ == Client.class) {
//			if (base.getTableClients().containsKey(cle)) {
//				Client c = base.getTableClients().remove(cle);
//				res = c;
//			}
//		}
//		return res;
//	}
//}
