global class UpdateEventBatchSchedule implements Schedulable{
    global void execute(SchedulableContext sc) {
        UpdateEventBatch batch = new UpdateEventBatch();
        database.executebatch(batch);
    }

}
