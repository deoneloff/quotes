import json
import os
import firebase_admin
from firebase_admin import credentials, firestore

os.environ.pop('FIRESTORE_EMULATOR_HOST', None)
cred = credentials.Certificate(
    "utilities/quotes-10001-firebase-adminsdk-w4128-548db06cac.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
with open("utilities/quotes.json", "r") as f:
    quotes = json.load(f)
counter = 0
for quote_data in quotes:
    doc_ref = db.collection("quotes").document()
    doc_ref.set(quote_data)
    counter += 1

print(f"All {counter} quotes uploaded successfully!")
