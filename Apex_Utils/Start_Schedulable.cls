//run the schedulable every hour
AwwSchedulable m = new AwwSchedulable();
String sch = '0 0 * * * ?';
String jobID = system.schedule('Execute Posts Update - Job', sch, m);