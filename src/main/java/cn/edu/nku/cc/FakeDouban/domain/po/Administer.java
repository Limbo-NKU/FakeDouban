package cn.edu.nku.cc.FakeDouban.domain.po;

public class Administer {
	 	private Integer id;
	    private String adminName;
	    private String password;
		private Integer level;
		public Administer(Integer id, String adminName, String password, Integer level) {
			super();
			this.id = id;
			this.adminName = adminName;
			this.password = password;
			this.level = level;
		}
		public Administer() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getAdminName() {
			return adminName;
		}
		public void setAdminName(String adminName) {
			this.adminName = adminName;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public Integer getLevel() {
			return level;
		}
		public void setLevel(Integer level) {
			this.level = level;
		}
	
		

}
