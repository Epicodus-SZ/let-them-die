import java.time.LocalDateTime;
import java.sql.Timestamp;
import java.util.List;
import org.sql2o.*;

public class Company {
  private int id;
  private String name;

  public Company(String name){
    this.name = name;
  }

  public String getName(){
    return name;
  }

  public int getId(){
    return id;
  }

  @Override
  public boolean equals(Object otherCompany){
    if (!(otherCompany instanceof Company)) {
      return false;
    } else {
      Company newCompany = (Company) otherCompany;
      return this.getName().equals(newCompany.getName()) &&
             this.getId() == newCompany.getId();
    }
  } //end of equals

  public static List<Company> all() {
     String sql = "SELECT id, name FROM companies";
     try(Connection con = DB.sql2o.open()) {
       return con.createQuery(sql).executeAndFetch(Company.class);
     }
   }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO companies (name) VALUES (:name);";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", this.name)
        .executeUpdate()
        .getKey();
    }
  }

} // end of Company class
