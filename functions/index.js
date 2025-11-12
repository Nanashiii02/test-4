const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.syncToFirestore = functions.database.ref("/journals/{userId}/{entryId}")
    .onWrite(async (change, context) => {
      const firestore = admin.firestore();
      const { userId, entryId } = context.params;

      const firestorePath = `journals/${userId}/entries/${entryId}`;

      // If the data is deleted in Realtime Database, delete it in Firestore.
      if (!change.after.exists()) {
        return firestore.doc(firestorePath).delete();
      }

      // Otherwise, create or update the data in Firestore.
      const data = change.after.val();
      return firestore.doc(firestorePath).set(data);
    });
