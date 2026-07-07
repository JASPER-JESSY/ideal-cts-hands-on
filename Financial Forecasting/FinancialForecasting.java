public class FinancialForecasting {
   public static double calculateFutureValue(double presentValue, double growthRate, int years) {
        
        if (years == 0) {
            return presentValue;
        }
        
        return calculateFutureValue(presentValue, growthRate, years - 1) * (1 + growthRate);
    }
    public static void main(String[] args) {
        double presentValue = 10000.0;
        double growthRate = 0.10;      
        int years = 5;                 

        double futureValue = calculateFutureValue(presentValue, growthRate, years);

        System.out.printf("Present Value: Rs.%.2f%n", presentValue);
        System.out.printf("Growth Rate: %.0f%%%n", growthRate * 100);
        System.out.printf("Years: %d%n", years);
        System.out.printf("Predicted Future Value: Rs.%.2f%n", futureValue);
    }
}