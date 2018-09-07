package eva;

public class ControlItemDo {
	
	@Override
	public String toString() {
		return "ControlItemDo [id=" + id + ", no=" + no + ", control_field=" + control_field + ", control_item="
				+ control_item + ", control_item_no=" + control_item_no + ", check_item=" + check_item + ", result="
				+ result + ", importance=" + importance + "]";
	}
	private int id;
	private String no;
	private String control_field;
	private String control_item_no;
	private String control_item;
	private String check_item;
	private String result;
	private String importance;
	private String management;
	private String physics;
	private String method;
	private String action;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getControl_field() {
		return control_field;
	}
	public void setControl_field(String control_field) {
		this.control_field = control_field;
	}
	public String getControl_item() {
		return control_item;
	}
	public void setControl_item(String control_item) {
		this.control_item = control_item;
	}
	public String getControl_item_no() {
		return control_item_no;
	}
	public void setControl_item_no(String control_item_no) {
		this.control_item_no = control_item_no;
	}
	public String getCheck_item() {
		return check_item;
	}
	public void setCheck_item(String check_item) {
		this.check_item = check_item;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getImportance() {
		return importance;
	}
	public void setImportance(String importance) {
		this.importance = importance;
	}
	public int parseInt() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public String getManagement() {
	      return management;
	   }
	   public void setManagement(String management) {
	      this.management = management;
	   }
	   public String getPhysics() {
	      return physics;
	   }
	   public void setPhysics(String physics) {
	      this.physics = physics;
	   }
	   public String getMethod() {
	      return method;
	   }
	   public void setMethod(String method) {
	      this.method = method;
	   }
	   public String getAction() {
	      return action;
	   }
	   public void setAction(String action) {
	      this.action = action;
	   }
	
	

}
