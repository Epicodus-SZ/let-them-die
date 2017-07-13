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

    get("/", (request, response) -> {
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
      int randomNum = rand.nextInt((companyCount - 0));
      Company option1 = dbCompanies.get(randomNum);
      //Company option1 = dbCompanies.get(55);
      Company option2;
      do {
        int randomNum2 = rand.nextInt((companyCount - 0));
        option2 = dbCompanies.get(randomNum2);
      }
      while (option1.getName().equals(option2.getName()));
      model.put("cookie", voteUser.getId().toString());
      model.put("option1", option1);
      model.put("option2", option2);
      model.put("template", "templates/index.vtl");

      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/saved", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      //Query the database and get saves List
      //Create a list Object
      // Put the database results in this Object
      List<LTDList> dbSaveList = LTDList.getSavesList();
      //put that object in the model
      model.put("saveListList", dbSaveList);
      model.put("template", "templates/saved.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/died", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      //Query the database and get saves List
      //Create a list Object
      // Put the database results in this Object
      List<LTDList> dbDieList = LTDList.getDiedList();
      //put that object in the model
      model.put("diedList", dbDieList);
      model.put("template", "templates/died.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/", (request, response) -> {
      //get post information
      User voteUser = new User();

      int winner = Integer.parseInt(request.queryParams("winner"));
      int loser;

      //check for cookie and set user_id
      if (request.cookie("user_id") != null) {
        //a cookie exists retrieve it
        voteUser.setId(UUID.fromString(request.cookie("user_id"))) ;
      } else {
        //no cookie, make one
        response.cookie("user_id", voteUser.getId().toString(), 3600);
      }

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
      response.redirect("/");

      Map<String, Object> model = new HashMap<String, Object>();
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());


  }
}
