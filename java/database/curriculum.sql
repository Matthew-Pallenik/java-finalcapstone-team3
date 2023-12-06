START TRANSACTION;
DROP TABLE IF EXISTS curriculum;

CREATE TABLE curriculum(
    entry_id serial NOT NULL,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(1500),
    keywords VARCHAR(500),
    link VARCHAR(2000)
);
COMMIT;

INSERT INTO curriculum(title, description, keywords, link) VALUES
(
'File System and Command Line',

'Programming is more than just writing code. It also involves working with files, which store code along with data and other resources such as configurations, pictures, and sounds. The built-in file managers for Windows and macOS are File Explorer and Finder, respectively. However, many developers use the command line to navigate folders and files, perform tasks like running scripts, and utilizing tools. This unit will teach you how file systems work and how to interact with them using the command line.',

'file | command | command-line | CLI | explorer | terminal | Bash | folders | paths | directory',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/command-line/01-introduction.md |
https://en.wikibooks.org/wiki/Guide_to_Unix/Commands/File_System_Utilities'
),
(
'Git',

'Version control is a software tool that helps track changes to a codebase over time. It is used to protect the source code for a software project. Version control systems are a category of software tools that help teams manage changes to source code over time. They offer three major benefits: Teams can go back in time when a bug occurs and compare different versions of the source code. Version control simplifies sharing changes between team members, which guarantees that everyone has the latest copy. Team members can develop code in parallel through the use of branches and merge them together when complete. Git is software that you install and run on your development computer. Once you start using Git on your computer, all of the changes you make to your code are tracked and saved in a local database, or repository.',

'Git | Github | Gitlab | version control | repository | workflow | tree | add | commit | push | clone',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/Git/01-what-is-version-control.md'
),
(
'Java - Intro',

'Java is a computer programming language developed by Sun Microsystems in 1995, later acquired by Oracle. Java’s syntax is similar to earlier programming languages like C and C++. However, unlike those languages, Java was designed to be compiled and run on a virtual machine, making it more readily deployable on a wide variety of platforms. When you write a Java program, the code you write is referred to as source code and is stored in a file named with the “.java” extension. Before you can run the program, you must compile that source code into bytecode. The bytecode file has the same name as the source code file, but it has the “.class” extension. Bytecode is highly optimized and is intended for processing by the virtual machine, rather than being read or edited by programmers. A JVM (Java Virtual Machine) is a program that runs Java bytecode. A JDK (Java Development Kit) is a collection of software that includes a JVM along with other development tools and standard libraries.',

'Java | intro | JVM | JDK | source code | bytecode | virtual machine | compiler | language | .class',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/java/01-intro-to-java.md'
);