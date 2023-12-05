START TRANSACTION;
DROP TABLE IF EXISTS pathway;

CREATE TABLE pathway(
    entry_id serial NOT NULL,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(1000),
    keywords VARCHAR(300),
    link VARCHAR(500)
);
COMMIT;

INSERT INTO pathway(title, description, keywords, link) VALUES
(
'Managing Stress And Imposter Syndrome', 

'In the intense environment of a coding bootcamp, managing stress is essential. Establish a consistent schedule, include breaks, and affirm your purpose for learning. Avoid comparisons with others, prioritize physical activity, stay hydrated, and celebrate your achievements. These simple habits promote overall mental health and resilience during the challenging bootcamp experience.',

'imposter | stress | mental health | goals | managing stress | imposter syndrome',
 
'https://lms.techelevator.com/cohorts/542/blocks/29/content_files/05_Managing_Stress_and_Imposter_Syndrome/01-stress-intro.md'
),
(
'Time Management',

'At any point in time during the cohort you are sure to be managing several different things at once: the coding bootcamp (which includes your technical education and your Pathway curriculum), your family and friends, a job or side hustle, and/or lifes general commitments. Thus, it is crucially important during the cohort that you practice productive time management techniques. Techniques such as Pomodoro technique are good methods for managing time during your cohort.',

'time | pomodoro | burnout | calendar | exhaustion | cynicism | inefficacy | management | time management',

'https://lms.techelevator.com/cohorts/542/blocks/29/content_files/07_Time_Management/03-burnout-prevention.md | 
https://www.healthline.com/health/tips-for-identifying-and-preventing-burnout | 
https://www.workplacestrategiesformentalhealth.com/resources/prevent-burnout |
https://hbr.org/2016/11/beating-burnout'


),
(
'Elevator Pitch',

'Your Elevator Pitch will serve as your first impression when meeting new people - both professionally and personally. First impressions are formed within the first 7 to 17 seconds of meeting someone, which is why having a well-crafted elevator pitch will be a vital part of your job search. Elevator pitches should: Be short and sweet, showcase your personality, be clear and engaging, and also contain good non-verbal cues',

'elevator pitch | interview | introduction | meeting | job ',

'https://lms.techelevator.com/cohorts/542/blocks/29/content_files/03_Elevator_Pitch/01-elevator-pitch.md | 
https://drive.google.com/file/d/1w5K9SXOBLVG2KUu8AnupknA7r2B17Yam/preview'

),
(
'Resumes',

'Your resume will serve as your first impression when applying to jobs and we want to ensure that you are putting your best foot forward with your resume as you begin applying to jobs in the technology industry. It usually takes a few drafts to perfect your resume. Resumes should contain the following sections: Name/Contact Info, Professional Summary, Technical Skills, Technical Experience, Professional Experience, and Education',

'resume | resumes | skills | experience | education | job search | application | job',

'https://lms.techelevator.com/cohorts/542/blocks/30/content_files/01_Resumes/01-intro.md | 
https://www.hiration.com/ '
);