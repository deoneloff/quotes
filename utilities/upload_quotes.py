import json
import firebase_admin
from firebase_admin import credentials, firestore

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
    print(f"Uploaded quote: {quote_data['quote']}")
    counter = +1

print(f"All {counter} quotes uploaded successfully!")
