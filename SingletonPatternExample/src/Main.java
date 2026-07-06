
public class Main {
    public static void main(String[] args) {
        
        Logger logger1 = Logger.getInstance();
        logger1.log("First message");
        
        Logger logger2 = Logger.getInstance();
        logger2.log("Second message");
        
        if (logger1 == logger2) {
            System.out.println("Both logger1 and logger2 are the same instance");
        }
        
        System.out.println("logger1 hashCode: " + logger1.hashCode());
        System.out.println("logger2 hashCode: " + logger2.hashCode());
    }
}