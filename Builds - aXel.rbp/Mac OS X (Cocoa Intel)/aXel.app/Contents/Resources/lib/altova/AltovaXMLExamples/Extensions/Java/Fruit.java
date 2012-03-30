//MAG 2008
public class Fruit {

	//static variable
	private static String fruitType = "citrus";
	
	// instance variable
	private String FruitColor;
	public Fruit(String inColor)
	{
		FruitColor = inColor;
	}
	public String getFruitColor()
	{
		return this.FruitColor;  
	}
	//static method
	public static String getFruitType()
	{
		return fruitType;  
	}

	//Test routine (to catch any bugs)


	public static void main (String[] argsIn) {
		Fruit  orange = new Fruit("orange");
		Fruit  lime   = new Fruit("green");
		System.out.println("The Fruit named orange is " +
				orange.getFruitColor());
		System.out.println("The Fruit named lime   is " + 
				lime.getFruitColor());
		System.out.println("Oranges and Limes are " +
				Fruit.getFruitType() + " fruits.");
	}
}
