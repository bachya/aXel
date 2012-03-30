package com.altova.extfunc;

public class Packagedfruit {
	//static variable
	private static String fruitType = "citrus";
	
	// instance variable
	private String FruitColor;
	public Packagedfruit(String inColor)
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
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Packagedfruit  orange = new Packagedfruit("orange");
		Packagedfruit  lime   = new Packagedfruit("green");
		System.out.println("The Fruit named orange is " +
				orange.getFruitColor());
		System.out.println("The Fruit named lime   is " + 
				lime.getFruitColor());
		System.out.println("Oranges and Limes are " +
				Packagedfruit.getFruitType() + " fruits.");

	}

}

