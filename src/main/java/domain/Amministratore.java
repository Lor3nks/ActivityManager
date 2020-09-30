package domain;

import java.io.Serializable;

public class Amministratore  implements Serializable {
	private static final long serialVersionUID = -1858579404541578878L;
	private String username;
    private String password;
	
    public Amministratore(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
    public Amministratore() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
