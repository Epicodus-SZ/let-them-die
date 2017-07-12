import java.util.HashMap;
import java.util.Map;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;
import java.util.List;
import java.util.Random;
import org.sql2o.*;
import java.util.UUID;


public class App {
  public static UUID siteCookie;

  public static void dummyData(){
    Company testCompany = new Company("Comcast");
    testCompany.save();
    Company testCompany2 = new Company("Microsoft");
    testCompany2.save();
    Company testCompany3 = new Company("Amazon");
    testCompany3.save();
  }

  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    //add some data to Company table
    dummyData();

    get("/hello", (request, response) -> "Hello Friend!");


    get("/votes", (request, response) -> {

      if (request.cookie("user_id") != null) {
        siteCookie = UUID.fromString(request.cookie("user_id"));
      } else {
        response.cookie("user_id", UUID.randomUUID().toString(), 3600);
      }




      Map<String, Object> model = new HashMap<String, Object>();

      //make a list of 2 companies
      //random logic here
      Random rand = new Random();

      List<Company> dbCompanies = Company.all();
      int companyCount = dbCompanies.size();
      int randomNum = rand.nextInt((companyCount - 0) + 1);
      Company option1 = dbCompanies.get(randomNum);
      Company option2;

      do {
        int randomNum2 = rand.nextInt((companyCount - 0) + 1);
        option2 = dbCompanies.get(randomNum2);
      }
      while (option1.getName().equals(option2.getName()));

      model.put("option1", option1);
      model.put("option2", option2);
      model.put("template", "templates/vote.vtl");



      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());


    // // temp testing route
    // get("/cookieTest", (request, response) -> {
    //   Map<String, Object> model = new HashMap<String, Object>();
    //   String test = request.cookie("foo");
    //   model.put("cookie", test);
    //   model.put("template", "templates/vote-success.vtl");
    //   return new ModelAndView(model, layout);
    // }, new VelocityTemplateEngine());


    post("/votes", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();

      int winner = Integer.parseInt(request.queryParams("winner"));
      int loser;

      int option1 = Integer.parseInt(request.queryParams("option1"));
      int option2 = Integer.parseInt(request.queryParams("option2"));
      if (winner==option1){
        loser = option2;
      } else {
        loser = option1;
      }

      Vote newVote = new Vote(winner,loser);
      newVote.save();
      model.put("template", "templates/vote-success.vtl");


      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());


  }
}
