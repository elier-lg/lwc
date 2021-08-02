global class AwwSchedulable implements Schedulable {
   global void execute(SchedulableContext SC) {
      AwwPostService sv = new AwwPostService();
      sv.Update_Posts(); 
   }
}