import java.util.HashMap;
import java.util.Map;
import java.time.LocalDateTime;
import java.sql.Timestamp;
import java.util.List;
import org.sql2o.*;
import java.util.UUID;
import static spark.Spark.*;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import java.util.Random;



//generate random UUIDs
// return UUID.randomUUID();


public class Vote {
  private int id;
  private UUID user_id;
  private int winner_id;
  private int loser_id;
  private LocalDateTime date;
  private Company option1;
  private Company option2;

  public Vote(int winner_id, int loser_id){
    this.user_id = App.siteCookie;
    this.winner_id = winner_id;
    this.loser_id = loser_id;
    this.date = LocalDateTime.now();

  }

  public int getId(){
    return id;
  }

  public UUID getUserId(){
    return user_id;
  }

  // @Override
  // public boolean equals(Object otherVote){
  //   if (!(otherVote instanceof Vote)) {
  //     return false;
  //   } else {
  //     Vote newVote = (Vote) otherVote;
  //     return this.getName().equals(newVote.getName()) &&
  //            this.getId() == newVote.getId();
  //   }
  // } //end of equals

  public static List<Vote> all() {
     String sql = "SELECT id, user_id, winner_id, loser_id, date FROM votes";
     try(Connection con = DB.sql2o.open()) {
       return con.createQuery(sql).executeAndFetch(Vote.class);
     }
   }

  public void save() {
    Timestamp timestamp = Timestamp.valueOf(this.date); //need to convert LocalDateTime to Timestamp

    // cookie logic here
    //set a cookie

    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO votes (user_id, winner_id, loser_id, date) VALUES (:user_id, :winner_id, :loser_id, :date);";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("user_id", this.user_id)
        .addParameter("winner_id", this.winner_id)
        .addParameter("loser_id", this.loser_id)
        .addParameter("date", timestamp)
        .executeUpdate()
        .getKey();

      String sql2 = "INSERT INTO users (id) VALUES (:user_id);";
      con.createQuery(sql2, true)
        .addParameter("user_id", this.user_id)
        .executeUpdate();
    }
  }

} // end of Vote class
