import java.util.List;
import org.sql2o.*;



public class LTDList{
  private String name;
  private int saves;
  private int deaths;

  public LTDList(){

  }
  public static List<LTDList> getSavesList() {
    String sql = "select count(v.winner_id) as saves, c.name from votes v left join companies c on c.id=v.winner_id group by v.winner_id, c.id order by saves desc";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(LTDList.class);
    }
  }

  public static List<LTDList> getDiedList() {
    String sql = "select count(v.loser_id) as deaths, c.name from votes v left join companies c on c.id=v.loser_id group by v.loser_id, c.id order by deaths desc";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(LTDList.class);
    }
  }

  public String getName(){
    return name;
  }

  public int getDeaths(){
    return deaths;
  }

  public int getSaves(){
    return saves;
  }
}
