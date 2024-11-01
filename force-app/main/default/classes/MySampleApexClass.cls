public class MySampleApexClass {    //Class definition and body --CICD by Bitbucket Pipeline
//Added comment
   public static Integer myValue = 0;  //Class Member variable
   public String myString = ''; //Class Member variable
   
   public static Integer getCalculatedValue () {
   // Method definition and body
   // do some calculation
      myValue = myValue+10;
      return myValue;
   }
}