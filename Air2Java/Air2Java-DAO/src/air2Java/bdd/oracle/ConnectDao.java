/**
 * @author Gilbert
 *   				Classe bdd.ConnectDao
 */

package air2Java.bdd.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Rom1
 *
 */
public class ConnectDao {

	// Attributs accès BD
	static final String URL_BASECDI = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	static final String URL_XE = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	static final String driver = "oracle.jdbc.driver.OracleDriver";

	static Connection connect_;
	static Statement statement_;
	static PreparedStatement pstatement_;
	static ResultSet resultSet_;
	/**
	 * Ouvre la connexion à la BdD si elle est fermée.
	 * @return la connexion.
	 */
	static public Connection connection() {
		Connection c = connection(driver, URL_XE, "AIR2JAVA", "Air2Java");
		if (connect_ == null)
			c = connection(driver, URL_BASECDI, "Air2Java", "Air2Java");
		return c;
	}

	/**
	 * 
	 * CONNECTIONS A LA BD
	 * 
	 */
	static private Connection connection(String driver, String bd, String user,
			String pwd) {
		try {
			Class.forName(driver);
			connect_ = DriverManager.getConnection(bd, user, pwd);
			System.out
					.println("// ConnectDao.java - Connexion à la base effectuée");
		} catch (Exception ev) {
			ev.printStackTrace();
			System.out.println("// ConnectDao.java - Connexion à la base " + bd
					+ " impossible ");
			return null;
		}
		System.out
				.println("// ConnectDao.java - Connexion à la base effectuée "
						+ connect_.toString());
		return connect_;
	}

	/**
	 * Ferme la Connexion.
	 */
	static public void disconnection() {
		if (connect_ != null) {
			try {
				connect_.close();
				connect_ = null;
			} catch (Exception ex) {
			}
		}
		System.out
				.println("// ConnectDao.java - Déconnexion de la base effectuée ");
	}

	/** Accesseurs Singleton connection 
	 * @return le connecteur
	 */
	public static Connection getConnect_() {
		if (connect_ == null)
			connection();
		return connect_;
	}

	/**
	 * 
	 */
	static public void razStatements() {
		System.out.println("Raz statements " + connect_.toString());
		try {
			if (statement_ != null)
				statement_.close();
			if (resultSet_ != null)
				resultSet_.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected String msgError = "Erreur Base de données";

	// Access constructeur interdit (pattern Singleton)
	protected ConnectDao() {
	}

	/**
	 * Creation statement
	 */
	synchronized public void createStatement() {
		connect_ = getConnect_();

		try {
			ConnectDao.statement_ = connect_.createStatement();
		} catch (SQLException e) {
			System.out
					.println("//// AccessPool - Erreur SQL création statement dataSource");
			e.printStackTrace();
		}

	}

}
