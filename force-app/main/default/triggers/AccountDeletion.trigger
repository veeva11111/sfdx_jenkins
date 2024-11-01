trigger AccountDeletion on Account (before delete) {
    // Call the method from the Apex class
    AccountDeletionHandler.preventAccountDeletion(Trigger.old);
}