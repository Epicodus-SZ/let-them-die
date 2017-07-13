import org.sql2o.*;
import org.junit.*;
import static org.junit.Assert.*;
import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.List;
import java.util.UUID;


public class VoteTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void Vote_instantiatesCorrectly_true() {
    UUID testId = UUID.randomUUID();
    Vote testVote = new Vote(testId,1,2);
    assertEquals(true, testVote instanceof Vote);
  }

  @Test
  public void save_InsertsVoteIntoVoteTable_true() {
    UUID testId = UUID.randomUUID();
    Vote testVote = new Vote(testId,1,2);
    testVote.save();
    Vote dbVote = Vote.all().get(0);
    assertEquals(testVote.getId(), dbVote.getId());
  }

  // @Test
  // public void save_InsertsUserIDIntoUserTable_true() {
  //   Vote testVote = new Vote(1,2);
  //   testVote.save();
  //   User dbUser = User.all().get(0);
  //
  //   List<UUID> idList = Vote.all().stream().map(Vote::getUserId).collect(Collectors.toList());
  //   System.out.println(idList.get(0));
  //   assertEquals(dbUser.getId(), idList.get(0));
  // }

  // @Test
  // public void all_returnsAllInstancesOfVote_true() {
  //   Vote testVote = new Vote("Comcast");
  //   testVote.save();
  //   Vote testVote2 = new Vote("Safeco");
  //   testVote2.save();
  //   assertEquals(true, Vote.all().get(0).equals(testVote));
  //   assertEquals(true, Vote.all().get(1).equals(testVote2));
  // }
  //


} // end of VoteTest class
