public class TemperatureConverter {//Gitlab CICD FB2--Authenticated by sfdx auth url: 28th April 2024
  // Takes a Fahrenheit temperature and returns the Celsius equivalent.
  public static Decimal fahrenheitToCelsius(Decimal fh) {
    Decimal cs = (fh - 32) * 5/9;
    return cs.setScale(2);
  }
}