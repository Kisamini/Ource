import java.util.Scanner;

public class test {
	
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String who = scan.nextLine();
			
		if(who.matches("^[§°-∆Ra-zA-Z0-9]*$")){
			System.out.println("«—±€¿”");
		}
		else{
			System.out.println("§§§§");
		}
	}

}
