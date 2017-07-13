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

  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    //test route for testing only, can be deleted
    get("/hello", (request, response) -> {
      return "Hello Friend!";
    });


    get("/votes", (request, response) -> {
      //make a new user
      User voteUser = new User();
      // Determine if this is a new user
      if (request.cookie("user_id") != null) {
        //a cookie exists retrieve it
        voteUser.setId(UUID.fromString(request.cookie("user_id"))) ;
      } else {
        //no cookie, make one
        response.cookie("user_id", voteUser.getId().toString(), 3600);
      }
      Map<String, Object> model = new HashMap<String, Object>();

      //Randomly select 2 different companies
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
      model.put("cookie", voteUser.getId().toString());
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
      //get post information
      User voteUser = new User();

      int winner = Integer.parseInt(request.queryParams("winner"));
      int loser;

      voteUser.setId(UUID.fromString(request.cookie("user_id")));
      UUID voter_id = voteUser.getId();
      int option1 = Integer.parseInt(request.queryParams("option1"));
      int option2 = Integer.parseInt(request.queryParams("option2"));
      if (winner==option1){
        loser = option2;
      } else {
        loser = option1;
      }
      Vote newVote = new Vote(voter_id,winner,loser);

      newVote.save();
      voteUser.save();
      response.redirect("/votes");

      Map<String, Object> model = new HashMap<String, Object>();
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());


  }
}
