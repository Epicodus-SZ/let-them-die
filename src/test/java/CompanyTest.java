import org.sql2o.*;
import org.junit.*;
import static org.junit.Assert.*;
import java.util.Arrays;

public class CompanyTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void Company_instantiatesCorrectly_true() {
    Company testCompany = new Company("Comcast");
    assertEquals(true, testCompany instanceof Company);
  }

  @Test
  public void all_returnsAllInstancesOfCompany_true() {
    Company testCompany = new Company("Comcast");
    testCompany.save();
    Company testCompany2 = new Company("Safeco");
    testCompany2.save();
    assertEquals(true, Company.all().get(0).equals(testCompany));
    assertEquals(true, Company.all().get(1).equals(testCompany2));
  }

  @Test
  public void save_assignsIdToObject() {
    Company testCompany = new Company("Comcast");
    testCompany.save();
    Company dbCompany = Company.all().get(0);
    assertEquals(testCompany.getId(), dbCompany.getId());
  }

} // end of CompanyTest class
