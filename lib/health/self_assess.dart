class SelfAssess {
  List<String> question1 = [
   // 'Please note that information from this chat will be used for monitoring & management of the current health crisis and research in the fight against COVID-19.',
    'Please answer the following questions to monitor your health of being in risk of contracting of coronavirus.'
    'Are you experiencing any of the following symptoms?',
  ];

  List<String> option1 = [
    'Cough',
    'Fever',
    'Difficulty in Breathing',
    'A loss of smell and taste',
  ];

  List<String> question2 = ['Have you ever had any of the following disease?'];

  List<String> option2 = [
    'Diabetes',
    'Hypertension',
    'Lung disease',
    'Heart disease',
    'Kidney Disorder',
  ];

  List<String> question3 = ['Which of the following is applicable to you?'];

  List<String> option3 = [
    'Traveled internationally in the last 28-45 days',
    'Recently interacted or lived with COVID-19 patient',
    'Working as a healthcare worker',
  ];

  List<String> answerOk = ['You don\'t have any risk of infection', 'Please stay at home to avoid contraction of coronavirus', 'Retake the Self-Assessment Test if you develop symptoms or come in contact with a COVID-19 confirmed patient.'];

  List<String> answerAtRisk = [
    'You have moderate risk of infection',
    'Please avoid going to public places and being in physical contact with anyone',
    'Timely medical intervention and safety we can control the spread of coronavirus'
  ];

  List<String> answerNominalRisk = [
    'You are at High Risk of infection ', 'Please isolate yourself & your immediate family members', 'You are advised for testing as your risk of infection is high. Please call the toll-free helpline 1075 to schedule your testing'
  ];
}
