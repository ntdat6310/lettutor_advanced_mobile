const apiSecretKey = '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';
const apiSecretKeyForErrorTest =
    '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';

enum SenderType {
  user,
  bot,
}

class Constants {
  static Map<String, String> specialties = {
    "all": "All",
    "business-english": "Business",
    "conversational-english": "Conversational",
    "english-for-kids": "Kids",
    "ielts": "Ielts",
    "starters": "Starters,",
    "movers": "Movers",
    "flyers": "Flyers",
    "ket": "Ket",
    "pet": "Pet",
    "toefl": "Toefl",
    "toeic": "Toeic",
  };
}
