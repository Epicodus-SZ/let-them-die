import java.time.LocalDateTime;
import java.sql.Timestamp;
import java.util.List;
import org.sql2o.*;
import java.util.UUID;


public class User {
  private UUID id;

  public User(){
    id = UUID.randomUUID();
  }

  public UUID getId(){
    return id;
  }

  public void setId(UUID id){
    this.id = id;
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

  //  public static boolean exists(UUID id) {
  //    String sql = "SELECT case when exists (SELECT true from votes where id=:id) then 'true' else 'false' end";
  //    try(Connection con = DB.sql2o.open()) {
  //      return con.createQuery(sql)
  //       .addParameter("id", XXXXXXX.toString())
  //       .executeScalar(Boolean.class);
  //    }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      // will change in the future
      String sql = "INSERT INTO users (id) VALUES (:id) ON CONFLICT DO NOTHING";
      //String sql = "INSERT INTO users (id) VALUES (:id)";
      con.createQuery(sql, true)
        .addParameter("id", this.id)
        .executeUpdate();
    }
  }

} // end of User class
