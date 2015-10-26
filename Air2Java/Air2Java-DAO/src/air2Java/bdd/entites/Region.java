/**
 * 
 */
package air2Java.bdd.entites;

import java.io.Serializable;

/**
 * @author Rom1
 *
 */
public class Region extends Entite implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int id_region ;
	String region_label ;
	
	/**
	 * @param id_region Id_region
	 * @param region_label region_label
	 * @deprecated utiliser int getId_Region() ou PK getPK()
	 */
	public Region(PK id_region, String region_label) {
		this(Integer.parseInt(id_region.getKey().toString()),region_label);
	}
	
	/**
	 * @param id_region Id_region
	 * @param region_label region_label
	 */
	public Region(int id_region, String region_label) {
		super();
		this.id_region = id_region;
		this.region_label = region_label;
	}
	
	/**
	 * 
	 */
	public Region() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the id_region
	 */
	public int getId_region() {
		return this.id_region;
	}
	/**
	 * @param id_region the id_region to set
	 */
	public void setId_region(int id_region) {
		this.id_region = id_region;
	}
	/**
	 * @return the region_label
	 */
	public String getRegion_label() {
		return this.region_label;
	}
	/**
	 * @param region_label the region_label to set
	 */
	public void setRegion_label(String region_label) {
		this.region_label = region_label;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Region [id_region=" + this.id_region + ", region_label="
				+ this.region_label + "]";
	}
	/* (non-Javadoc)
	 * @see air2Java.bdd.entites.Entite#getPK()
	 */
	@Override
	public PK getPK() {
		return new PK(id_region);
	}

}
