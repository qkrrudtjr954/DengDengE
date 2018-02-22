package delegator;

public class Delegator {
	
	// singleton 싱글턴 
	private static Delegator delegator = null;
	
	private Delegator() {
		
	}
	
	public Delegator getInstance() {
		if(delegator==null) {
			delegator = new Delegator();
		}
		
		return delegator;
	}
}
