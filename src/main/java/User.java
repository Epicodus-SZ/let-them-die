import java.time.LocalDateTime;
import java.sql.Timestamp;
import java.util.List;
import org.sql2o.*;

public class User {
  private int id;

  public User(){
    //nothing here yet
  }

  public int getId(){
    return id;
  }

  @Override
  public boolean equals(Object otherUser){
    if (!(otherUser instanceof User)) {
      return false;
    } else {
      User newUser = (User) otherUser;
      return this.getId() == newUser.getId();
    }
  } //end of equals

  public static List<User> all() {
     String sql = "SELECT id FROM users";
     try(Connection con = DB.sql2o.open()) {
       return con.createQuery(sql).executeAndFetch(User.class);
     }
   }

  // public void save() {
  //   try(Connection con = DB.sql2o.open()) {
  //     // will change in the future
  //     String sql = "INSERT INTO users (name) VALUES (:name);";
  //     this.id = (int) con.createQuery(sql, true)
  //       .addParameter("name", this.name)
  //       .executeUpdate()
  //       .getKey();
  //   }
  // }

} // end of User class
