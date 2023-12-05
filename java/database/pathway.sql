START TRANSACTION;
DROP TABLE IF EXISTS pathway;

CREATE TABLE pathway(
    entry_id serial NOT NULL,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(1500),
    keywords VARCHAR(500),
    link VARCHAR(2000)
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
),
(
'Cover Letters',

'For many technology roles, cover letters will be an optional addition to your application. Thus, it is recommended that you skip the addition of a cover letter unless the following 2 situations arise: It is a job you REALLY want, such as your dream job OR You have valuable information to share that is not already included within your resume. A one-page cover letter comprises key elements, starting with your contact information, date, and optionally the employers details. Introduce yourself in the first paragraph, stating your name, the company, the job title, and expressing why you are a suitable candidate. The body paragraphs (2-3) should directly align with the job description, emphasizing how your experiences, skills, and achievements meet the companys needs. Avoid repeating resume details and focus on relevant contributions. Conclude with a call-to-action paragraph, restating interest, providing contact information, and expressing gratitude.',

'cover letter | resume | application | job',

'https://lms.techelevator.com/cohorts/542/blocks/30/content_files/11_Cover_Letters/01-introduction.md |
https://www.thebalancemoney.com/sample-career-change-cover-letter-2060185'
),
(
'LinkedIn',

'Not only is LinkedIn a critical tool in your job search, but it will also become a major tool in managing your career after Tech Elevator. Social media has become integral to daily life. Platforms like Facebook, Instagram, and TikTok dominate personal interactions. In contrast, LinkedIn is a dedicated space for professional engagement. Functioning as an online resume, LinkedIn offers networking opportunities, job searches, experience sharing, and serves as a research tool for interviews. It plays a crucial role in managing and advancing ones professional life, distinguishing itself from other platforms focused on personal connections and content sharing.',

'LinkedIn | resume | job | job search | networking | research ',

'https://lms.techelevator.com/cohorts/542/blocks/30/content_files/02_LinkedIn/05-introduction.md |
 https://drive.google.com/file/d/1YJrci4XICJ_MIRX6vwkMkAIIGl2lekvS/preview'

),
(
'Technical Roles',

'As you explore potential technology career paths, you will discover a myriad of options. Our compiled list of common technology roles aims to provide clarity on post-graduation opportunities and familiarize you with the diverse positions you may encounter in your technology career. 
Application Programmer/Developer: Write programs to handle a specific job, such as a program to track inventory within an organization. |
Project Manager: Project Managers have the responsibility of the planning and execution of a project. |
QA Automation Engineer: QA Automation Engineers design, program, simulate and test automated machinery and processes in order to complete exact tasks. |
IT Support Analyst: The IT Support Analyst  will provide front-line primary technical support to end users on various technical issues and problems relating to hardware, software, and peripherals.',

'technical role | job | title | position | careers',

'https://lms.techelevator.com/cohorts/542/blocks/30/content_files/12_Technical_Roles/01-technical-roles.md |
https://en.wikipedia.org/wiki/Programmer#Application_versus_system_programming |
https://en.wikipedia.org/wiki/Project_manager#Software_Project_Manager |
https://yojji.io/blog/qa-automation-engineer '

),
(
'Working With Recruiters',

'As you begin your job search for a job in technology, you will find that it is not uncommon to work with third party recruiters for roles. Because technology is such an in-demand field, companies will often work with outside recruiting agencies to assist them with finding individuals for their roles. There are several well-known agencies that your Pathway Team will recommend working with once you begin your job search, but as a best practice, you should have a relationship with at least 2-3 recruiters when you are actively looking. There are efficient ways, such as LinkedIn to get in touch with recruiters. It is important to share MOATS: Money (Your salary and/or hourly wage goals), Opportunities (What kind of roles you are interested in), Area (How far you are willing to commute), Timing (When you can work), Skills(Important tech skills) ',

'recruiters | recruiting | jobs | job search | employment | contract | recruitment | employers | offer',

'https://lms.techelevator.com/cohorts/542/blocks/30/content_files/04_Working_With_Recruiters/01-introduction.md | 
https://www.roberthalf.com/ | 
https://www.teksystems.com/en |
https://www.randstadusa.com/ '

),
(
'Portfolio Products',

'Prepare for the common employer question about your outside projects by planning and starting early. Focus on your passions, tying your efforts to hobbies, sports, data, programming languages, or historical periods. This makes the work more motivating. Gain domain knowledge related to your chosen topic. Even small projects, like a unique mortgage calculator, or the beginning of a larger project with user stories, demonstrate initiative. Track activities like meetups, podcasts, and self-studying additional coding languages. Incomplete projects still offer valuable experiences—employers want insights into your design process, encountered roadblocks, alternative approaches, and future plans for the project. Showcase your ability to think through and learn from the development process beyond classroom projects.',

'projects | side projects | portfolio | interview preparation | application | plans | career',

'https://lms.techelevator.com/cohorts/542/blocks/30/content_files/05_Portfolio_Projects/01-introduction.md'

),
(
'Networking',

'Networking in tech involves building professional connections to advance your career. Attend industry events, meetups, and conferences to meet professionals and potential mentors. Utilize online platforms like LinkedIn to connect with professionals in your field. Networking helps in job searches, provides learning opportunities, and fosters collaborations. Develop a strong online presence, share your expertise, and be proactive in reaching out to professionals. Building a robust network can lead to job opportunities, industry insights, and career growth.',

'networking | social event | network | job search | meetups | career',

'https://lms.techelevator.com/cohorts/542/blocks/31/content_files/01_Networking/01-introduction.md |
https://drive.google.com/file/d/1b0vb7L2MICYxNZlTeRp_ywMrqLmvm0EK/preview'
),
(
'Prepping For Interviews',

'Interviewing begins the moment you receive a call or email from the recruiter informing you that they are interested in scheduling an interview. From that moment until the day of your interview, you need to ensure that you are as prepared as possible.
Research: Research the company itself through their website, you should feel comfortable explaining to a friend or family member what the company actually does,
Arrive Prepared: Bring copies of your resume, a notebook and pen, turn off your phone, make sure interview space has no distractions,
Appearance: Dress in professional attire, things such as a button-up, skirt/dress, or suit and tie are good examples of professional attire; in addition to this be well groomed.',

'interview | attire | preparation | prepare | job | offer | clothing | company | research | employer | employment| career',

'https://lms.techelevator.com/cohorts/542/blocks/31/content_files/02_Prepping_for_Interviews/01-introduction.md | 
https://drive.google.com/file/d/1tJ_H4PJKzoi9kmoikBnBHp7JYRKXumlT/preview  '
),
(
'HR Interviews',

'HR interviews will be a big part of your job search as you begin applying for technology careers. Companies are not only looking for someone who checks the boxes in regard to technical skills, they want someone who is also a culture fit for their team and their company. The HR interview is a conversation to assess/confirm that your qualifications meet the needs of the role, to evaluate your level of cultural fit with the company, and to ask a varity of straighforward questions (for example, "Why are you switching careers?"). HR interviews/phone screens are shorter in length, lasting, on average, 15-30 minutes. 
Examples of HR Interview questions may be: "Tell me why you are switching careers", "What is your target salary", "What are your strengths", "What are your weaknesses", etc ',

'phone screen | interviews | interview | HR | job | culture | company',

'https://lms.techelevator.com/cohorts/542/blocks/31/content_files/03_Behavioral_Interviews/01-introduction.md'
),
(
'Behavioral Interviews',

'Behavioral interviews are a more in-depth assessment of a candidate. Behavioral interviews are a structured interview technique used by hiring managers and HR professionals where they request information about a candidates past behavior in order to predict future behavior.  Behavioral interviews include a variety of open ended questions that will request context about a candidates specific past experience (key word: specific). The idea is that behavioral interview questions will force interviewees to give objective, real-life answers as opposed to telling the interviewer what they think they want to hear. Example behavioral questions may be: "Tell me about a time you failed", "Tell me about a time you ___ ". An efficient way to respond to these questions is by using Situation Task Action Result, or STAR stories for short.',

'behavioral | interview | interviews | HR | questions | job | culture | company | STAR',

'https://lms.techelevator.com/cohorts/542/blocks/31/content_files/03_Behavioral_Interviews/01-introduction.md |
https://drive.google.com/file/d/1X-7mPFQeZo9AHM_WH_JZJCpSe238Ruca/preview'
),
(
'Technical Interviews',

'While you likely have experience in general or behavioral interviews, we are guessing you have yet to encounter a technical interview. The technical interview is very specific to the industry you are entering and is usually a blend of technical questions, whiteboarding, and/or coding problems.'

)
