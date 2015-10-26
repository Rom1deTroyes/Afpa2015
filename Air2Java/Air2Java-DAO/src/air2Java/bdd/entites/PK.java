/**
 * 
 */
package air2Java.bdd.entites;

/**
 * @author Rom1
 * 
 */
public class PK {

	Object key;

	/**
	 * 
	 */
	public PK(){
		this(new Object());
	}
	
	/**
	 * @param key
	 *            clé
	 */
	public PK(Object key) {
		super();
		this.key = key;
	}

	/**
	 * @return the key
	 */
	public Object getKey() {
		return this.key;
	}

	/**
	 * @param key
	 *            the key to set
	 */
	public void setKey(Object key) {
		this.key = key;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PK [key=" + this.key + "]";
	}

}
