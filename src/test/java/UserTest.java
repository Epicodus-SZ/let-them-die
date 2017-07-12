// import org.sql2o.*;
import org.junit.*;
import static org.junit.Assert.*;

public class UserTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void User_instantiatesCorrectly_true() {
    User testUser = new User();
    assertEquals(true, testUser instanceof User);
  }

  // @Test
  // public void all_returnsAllInstancesOfUser_true() {
  //   User testUser = new User("Comcast");
  //   testUser.save();
  //   User testUser2 = new User("Safeco");
  //   testUser2.save();
  //   assertEquals(true, User.all().get(0).equals(testUser));
  //   assertEquals(true, User.all().get(1).equals(testUser2));
  // }
  //
  // @Test
  // public void save_assignsIdToObject() {
  //   User testUser = new User("Comcast");
  //   testUser.save();
  //   User dbUser = User.all().get(0);
  //   assertEquals(testUser.getId(), dbUser.getId());
  // }

} // end of UserTest class
