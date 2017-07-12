import java.util.HashMap;
import java.util.Map;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;
import java.util.List;
import java.util.Random;
import org.sql2o.*;

public class App {

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


    get("/", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();

      //make a list of 2 companies
      //random logic here
      Random rand = new Random();

      List<Company> dbCompanies = Company.all();
      int companyCount = dbCompanies.size();
      int randomNum = rand.nextInt((companyCount - 0) + 1);
      Company option1 = dbCompanies.get(randomNum);
      int randomNum2 = rand.nextInt((companyCount - 0) + 1);
      Company option2 = dbCompanies.get(randomNum2);

      model.put("option1", option1);
      model.put("option2", option2);
      model.put("template", "templates/vote.vtl");

      //set a cookie
      //response.cookie("foo", "bar");

      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());



    get("/votes", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();

      model.put("template", "templates/vote.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());


    // post("/votes", (request, response) -> {
    //   Map<String, Object> model = new HashMap<String, Object>();
    //   Category category = Category.find(Integer.parseInt(request.queryParams("categoryId")));
    //   String description = request.queryParams("description");
    //   Task newTask = new Task(description, category.getId());
    //   newTask.save();
    //   model.put("category", category);
    //   model.put("template", "templates/vote-success.vtl");
    //
    //
    //   return new ModelAndView(model, layout);
    // }, new VelocityTemplateEngine());


  }
}
