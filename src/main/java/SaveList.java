import java.util.List;
import org.sql2o.*;



public class SaveList{
  private String name;
  private int saves;

  public SaveList(){

  }
  public static List<SaveList> getSavesList() {
    String sql = "select count(v.winner_id) as saves, c.name from votes v left join companies c on c.id=v.winner_id group by v.winner_id, c.id order by saves desc";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(SaveList.class);
    }
  }
  public String getName(){
    return name;
  }

  public int getSaves(){
    return saves;
  }
}
