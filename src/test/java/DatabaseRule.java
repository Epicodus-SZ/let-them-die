import org.junit.rules.ExternalResource;
import org.sql2o.*;

public class DatabaseRule extends ExternalResource {

  @Override
  protected void before() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/let_them_die_test", null, null);
  }

  @Override
  protected void after() {
    try(Connection con = DB.sql2o.open()) {
      String deleteCompanysQuery = "DELETE FROM companies *;";
      con.createQuery(deleteCompanysQuery).executeUpdate();
      String deleteUsersQuery = "DELETE FROM users *;";
      con.createQuery(deleteUsersQuery).executeUpdate();
      String deleteVotesQuery = "DELETE FROM votes *;";
      con.createQuery(deleteVotesQuery).executeUpdate();

      // String deleteCustomersQuery = "DELETE FROM customers *;";
      // con.createQuery(deleteCustomersQuery).executeUpdate();
    }
  }

}
