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

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/command-line/01-introduction.md'
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
),
(
'IntelliJ',

'IntelliJ IDEA is a popular IDE among Java programmers. Git, as well as other versioning systems, have built-in support. IntelliJ usage is built around the idea of projects. Each application and its various resources are represented by a project. The IDE refers to project settings as project structure. You can create, open, run, and test projects in IntelliJ.',

'IntelliJ | IDEA | project | git | Maven | Integrated Development Environment | IntelliSense | syntax | run test | debugger | breakpoint | application',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/intellij/01-integrated-development-environment.md'
),
(
'PostgreSQL',

'PostgreSQL (also known as Postgres) is a widely used, open source relational database management system (RDBMS). When you''re using PostgreSQL for learning and development, you''ll run it locally on your computer, but it''s still a server application that runs in the background. PostgreSQL doesn''t have a visible user interface. This means that to use PostgreSQL, you''ll need a client application like pgAdmin.
There are many options available for storing data. Some reasons a developer might choose PostgreSQL include: Price - Unlike commercial options such as Oracle or Microsoft SQL Server, PostgreSQL is free. SQL - PostgreSQL supports SQL, which is a powerful language for working with data. Other options like MongoDB don''t support SQL. Compatibility - Some options like Apache Derby or H2 are primarily intended for use with Java, but PostgreSQL can be used with virtually any programming language. Scalability - PostgreSQL can be used for large amounts of data and many simultaneous users. Other options like SQLite are intended for a single user or smaller data sets. Advanced features - While other options like MySQL focus on speed or ease-of-use, PostgreSQL offers a larger set of features for developers to use.',

'database | postgres | PostgreSQL | relational database management system | RDBMS | pgAdmin',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/postgresql/01-intro-to-postgresql.md'
),
(
'Postman',

'Postman is a software tool that helps developers test Web APIs. An API, or application programming interface, is a way for different computer programs to transfer data between each other. A Web API is an API that''s accessible over the internet. Postman is an effective testing tool because it allows you to quickly create API requests, input request data, and read response data. If you''re writing APIs, you can use Postman to test if your APIs are reacting correctly to requests. If you''re writing software that interacts with an API, you can use Postman to analyze response data and troubleshoot your requests.',

'Postman | API | application programming interface | Scratch Pad | request',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/postman/01-whats-postman.md'
),
(
'NPM',

'NPM is a package manager for JavaScript code. It''s one of the most widely used package managers in software development and is often touted as having the largest repository. Its name is short for Node.js Package Manager. Node.js is a runtime environment for running complex applications in JavaScript without a browser. NPM stores the information of the packages you use for a project in a file named package.json. This file also usually contains other information about the project like its name and version.',

'package | node | node.js | package.json | package-lock.json | node_modules | NPM | package manager | install',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/npm/01-whats-a-package.md'
),
(
'Visual Studio Code',

'Visual Studio Code—also referred to as VS Code—is a free, lightweight, source code editor from Microsoft. It runs on Windows, macOS, and Linux, and supports several languages like JavaScript, CSS, and HTML. Support for many other languages can be added on through extensions. It''s a popular choice among programmers in general, and is widely used in web development. VS Code comes with a built-in terminal that you can use to run commands in your project folder, such as npm. VS Code''s terminal supports Bash, PowerShell, and Windows Command Prompt. VS Code has many extensions that add features like a local web server, support for other programming languages, and code formatting. At the time of this writing, the VS Code Extensions Marketplace has over 20,000 extensions.',

'Visual Studio Code | VS Code | projects | terminal | extensions | Microsoft | source code editor',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/vscode/01-introduction-to-vscode.md'
),
(
'Chrome Dev Tools',

'Most modern web browsers provide an extensive feature-set to help software developers build web pages and applications. While these features, known as DevTools, are similar from browser to browser, Tech Elevator focuses on using the DevTools included in Google''s Chrome browser. There are several different ways to open the DevTools, but the most convenient is to right-click in a web page and select Inspect from the context menu. Doing so opens the DevTools to the Elements view with a focus on the item in which you click.
The Elements view includes an interactive tree view of the DOM (Document Object Model). This view shows the parent-child structure of the HTML elements and the styling applied to them in the Styles sub-tab. These tools are invaluable when troubleshooting display and layout problems. The Console view shows messages generated from the browser as it loads the page and any messages generated from JavaScript code. The Sources view shows the resources used when loading the page. The Network view shows the requests that the browser makes to the server. Use this view to check if requests for files or other resources are successful.',

'DevTools | Google Chrome | view | Elements | Console | Sources | Network',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/chrome-dev-tools/01-introduction.md'
),
(
'Cypress',

'Cypress is a testing framework for web pages and applications that run in a browser. You write Cypress tests in JavaScript with a syntax that''s meant to be approachable and understandable. Cypress can test anything that runs in a browser and lets you alter any aspect of how your application works. This level of control allows you to write end-to-end tests, integration tests, and unit tests using Cypress. Cypress doesn''t require any prerequisites, but it''s best to install through npm. There are two ways to run Cypress tests: in a browser window, or in the command-line with no visible browser. This is also known as headless.',

'Cypress | testing | framework | npm | tests | npm run test | headless | npm run test-headless',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/cypress/01-intro-to-cypress.md'
),
(
'Vue',

'Vue is an open source JavaScript framework for building web applications. It''s most often used to build single-page applications. Vue is similar to other JavaScript frameworks such as Angular and React. To run an existing Vue project, you must first install its dependencies. Dependencies are additional software packages that your application requires to run. NPM handles this using the project''s package.json and package-lock.json files.',

'Vue | dependencies | project | JavaScript | framework | single-page application | SPA | VueJS | Vue DevTools | Volar | ESLint',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/vue/01-introduction-to-vue.md'
),
(
'Variables and Data Types',

'Typical programs like web applications need to store and manipulate data. Programmers try to write these applications with as little repetitive code as possible. For example, building a password reset flow for every single user is time consuming. So, to save time, programmers use variables to store the user''s email address. This allows them to write their code in a generic and reusable manner.',

'variable | comment | line comment | data type | boolean | byte | short | int | long | float | double | char | string | declare | data-type identifier | camel-case | constant | expression | precedence | concatenate | type conversion | widen | narrow | literal',

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/01_Variables_Data_Types/01-variables.md'
),
(
'Logical Branching',

'As a programmer, you may come across a situation where your program must decide what to do next based on the data available to it. Some concepts that enable code to make decisions and determine what to do next include: boolean expressions, if/else statements, and methods.',

'logical branching | boolean expressions | block | method | conditional code | scope | comparison | operator | if/else | XOR | ternary operator | nested block',

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/02_Logical_Branching/01-introduction.md'
),
(
'Loops and Arrays',

'Arrays are a special data type found in almost all programming languages. They make it more convenient to work with values in aggregate rather than a series of individual variables. When you want to work with collections of values, you use arrays. Rather than creating multiple variables, you create a single variable name that can represent multiple values. You can create arrays to hold any data type. Loops provide a convenient way to write a small amount of code that can iterate through all of the values in an array one by one.',

'array | collection | declare | initialize | length | element | index | notation | loop | for | while | do-while | initializer | condition | iterator | scope | break | continue | return type | name | parameter',

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/03_Loops_and_Arrays/01-arrays.md'
),
(
'Command-line Programs',

'These days, when programs interact with a user, they usually do so through a graphical user interface (GUI) that provides visual controls like buttons and toggle switches. Not all programs have a GUI, though. Many system administration and developer tools interact only through text output to the screen and input from the keyboard. These are called command-line programs. At a high-level, a command-line program typically does three things: prompts the user to provide input, does something with that input, and outputs the result.',

'command-line | program | user input | I/O | system.out.print | scanner | system.in | nextLine | parse',

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/04_Command_Line_Programs/01-introduction.md'
),
(
'Intro to Objects',

'Object-Oriented Programming is about organizing your problem-solving into objects. An object is an in-memory data structure that combines state and behavior into a usable and useful abstraction. In other words, objects are a collection of variables and methods. Objects have many benefits: they''re modular, they hide information, they allow you to reuse code, and they''re pluggable and testable. To make objects, you must write classes. A class is to an object like a blueprint is to a house. A class defines the features of the objects created as instances of that class.',

'abstraction | object | object-oriented programming | oop | modular | class | instantiation | constructor | stack | heap | memory address | string | length | substring | contains | index | toUpperCase | toLowerCase | BigDecimal | LocalDate',

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/05_Intro_to_Objects_Strings/01-whats-an-object.md'
),
(
'Collections (Part 1)',

'The List<T> interface is the most common data structure used to handle collections in the Java language. Like an array, a List serves as a general-purpose, type-safe collection of values. The primary difference between the two is that Lists can grow and shrink in size, while arrays are always fixed in length. Another important distinction for Lists is they maintain the order in which items were added. The first item added is index 0, and the second is index 1. The Stack<T> class is similar to List in that it maintains the order in which items are added and removed, but it is far less commonly used than List. A Stack is a last-in, first-out (LIFO) data structure. Stacks allow you to "push" and "pop" items on and off the top of the collection. This is the one like a Pringles can. Like the Stack class, the Queue<T>interface is rarely used in general practice. A Queue is an "ordered" First-In First-Out (FIFO) data structure. New items are added at the end of the collection, and existing items are pulled from the beginning.',

'collection | fixed | import | data structures | java.util.list | list | ArrayList | ordered | foreach | stack | queue | push | pop | LinkedList | offer | poll | add | remove | get',

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/06_Collections_Part_1_Lists_Stacks_Queues/01-array-recap.md'
),
(
'Collections (Part 2)',

'The Map class offers a distinct advantage over Lists. Maps consist of key-value pairs where each value is associated with a unique key, and the keys are arranged within the collection so that they can be instantly located and the values retrieved. There is no need to iterate through the collection looking for a particular value. A program should only loop through a Map when it needs to access every single value within. On the other hand, one disadvantage to Maps is they don''t maintain order in the sense of keeping track of the order in which items were added. Another unordered data structure is Set, a collection that holds unique values. It allows you to quickly determine if the value already exists in the set. Because Sets are unordered, they don''t maintain indexes. Items in a Set are identified by hashcodes. A hashcode is a specially computed value which uniquely identifies each item in the Set.',

'binary search | map | key | value | put | get | containsKey | entry set | hashmap | set | hashcode | add | remove | hashset',

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/07_Collections_Part_2_Maps/01-introduction.md'
),
(
'Classes and Encapsulation',

'Programmers often need to solve problems that the Java language doesn''t have an out-of-the-box solution for. To create these sorts of applications, programmers need to represent things like shopping carts and user profiles as custom data types. Using classes, they can define what characteristics and behaviors a data type has. Programmers can create as many instances of objects from the class blueprint as needed. The bundling of an object''s state and behaviors together is part of the definition of encapsulation, the first pillar of object-oriented programming.',

'class | state | instance | blueprint | behavior | encapsulation | object-oriented-programming | oop | attribute | property | properties | getter | setter | access modifier | this | derived | default | constructor | static | overload | coupled | loose | tight',

'https://lms.techelevator.com/cohorts/535/blocks/9/content_files/01_Classes_and_Encapsulation/01-introduction.md'
),
(
'Inheritance',

'One OOP principle is Inheritance, which is the act of having one class adopt the properties and methods of another class. This prevents code duplication and allows you to share code across classes while having the source code live in only one class file.',

'object-oriented-programming | oop | inheritance | superclass | subclass | super | override | extend',

'https://lms.techelevator.com/cohorts/535/blocks/9/content_files/02_Inheritance/01-inheritance.md'
),
(
'Polymorphism',

'In object-oriented programming, polymorphism is the idea that something can be assigned a different meaning or usage based on its context. This specifically allows variables and objects to take on more than one form. Often, you want to write code that can make a basic request, and based on context, allow different behaviors to take place. Polymorphism means you can write one generic method call that uses whatever specific version of that method is appropriate when it runs.',

'object-oriented-programming | oop | polymorphism | code smell | loosely coupled | interface | implement',

'https://lms.techelevator.com/cohorts/535/blocks/9/content_files/03_Polymorphism/01-whats-polymorphism.md'
),
(
'Managing Inheritance',

'When you''re designing a new class, you can require other classes to implement certain methods, prevent other classes from overriding certain methods, and control which properties and methods child classes can access. Doing those things is an important way to communicate with other developers and helps ensure they use your code correctly. An abstract class is a class that you can''t create an instance of. An abstract method is a method with no implementation that''s declared in an abstract class. A final class is a class that other classes can''t inherit from. A final method is a method that a child class can''t override.',

'abstract | final | protected | access | concrete | polymorphism',

x'https://lms.techelevator.com/cohorts/535/blocks/9/content_files/04_Managing_Inheritance/01-introduction.md'
),
(
'Unit Testing'

'Unit testing is a crucial aspect of software testing, focusing on verifying the functionality of individual components or units within an application. These units represent the smallest testable parts of the software, typically corresponding to methods in object-oriented languages like Java. Unit tests are code snippets designed to automatically run and evaluate the performance of specific units, ensuring that each unit operates according to its design. By automating the testing process, unit tests seamlessly integrate into the overall development cycle. To illustrate, consider the analogy of building a car with components such as ball bearings, brakes, and wheels. Unit tests for ball bearings might assess their ability to handle a billion rotations, while brake tests may evaluate stability in slippery conditions. Each component undergoes thorough testing, mirroring the meticulous inspection of individual parts in car manufacturing. Key characteristics of unit tests include automation, isolation of program parts for individual correctness verification, early detection of issues, and the promotion of thoughtful consideration by developers regarding inputs, outputs, and error conditions. In essence, unit tests play a fundamental role in maintaining software integrity and reliability throughout the development process.'

'unit testing | testing | edge case | quality assurance | manual testing | automated testing | test | debug'

'https://lms.techelevator.com/cohorts/535/blocks/12/content_files/01_Unit_Testing/01-whats-unit-testing.md'
),
(
'Exception Handling'

'Java incorporates a robust exception handling mechanism to address unexpected scenarios during program execution, known as exception handling. This practice involves anticipating and managing anomalies to provide meaningful feedback to users when interacting with applications. Mistakes are inevitable, and effective exception handling is essential to convey clear error messages rather than cryptic ones. Properly implemented exception handling in Java enables the display of specific error messages to users and notifies other programmers about incomplete code execution. Without such handling, uncaught exceptions could potentially expose sensitive program information. Key concepts include the raising of exceptions during unexpected situations, abrupt program control stops, and the propagation of exceptions until caught. Developers utilize the try-catch keywords to manage potential errors, where the try block encapsulates code that might trigger an exception, and the catch block handles the exception, displaying relevant messages or logging them. Additionally, developers can employ the throw keyword to raise custom exceptions when code cannot complete its task, such as encountering null parameters or out-of-range values. In summary, Java''s exception handling is integral for user-friendly error messages, developer notification, and safeguarding against unintended exposure of sensitive information, contributing to the reliability and security of Java programs.'

'java | exception handling | feedback | error | raising exceptions | try | catch | try-catch | block | defensive programming | finally'

'https://lms.techelevator.com/cohorts/535/blocks/13/content_files/01_Exception_Handling/01-handling-program-errors.md'
),
(
'File I/O Reading'

'In programming, managing files—reading and writing—is commonplace, with file handling being a crucial skill. Understanding file manipulation is vital, given that data often resides in text files. Programming languages universally offer classes in their standard libraries for consistent file handling patterns. Java employs the Scanner class for file reading, capable of processing files character by character, line by line, or entirely. Understanding file reading involves grasping data streams—structures in computer science that read data as ordered bytes, akin to an assembly line. This stream-based approach accommodates varying file sizes, even exceeding gigabytes. To open a file in Java, obtain the file path, create a File object, and utilize a Scanner to open the file, preparing the data stream for text reading. Reading text involves a systematic while loop using hasNextLine() and nextLine() methods, processing the file line by line. File input and output inevitably introduce errors, like FileNotFoundExceptions for absent or deleted files. Efficient file closing is crucial to prevent locks that may impede other applications. The try-with-resources block in Java addresses these concerns, automatically closing the file and handling exceptions. This structure ensures a clean and secure file handling approach in Java programs.'

'file | input | output | reading | scanner | data | stream | file path | try | try-with-resources'

'https://lms.techelevator.com/cohorts/535/blocks/13/content_files/02_File_IO_Reading/01-file-input-and-output.md'
),
(
'File I/O Writing'

'Reading from one file and writing to another, a common practice in text file manipulations such as search and replace, can be facilitated using a try-with-resources block. This involves opening the relevant files for reading and writing simultaneously. However, a crucial cautionary note advises against reading and writing to the same file, as it can lead to various complications. To modify a file directly, like finding and replacing a word, it is recommended to follow an alternative approach: read from the original file, write to a new empty file, and only replace the original file with the new one once the process is successfully completed. This ensures data integrity and circumvents potential issues associated with simultaneous reading and writing to the same file.'

'file | input | output | writing | try-with-resources | scanner | print-writer | overwrites | file-output-stream'

'https://lms.techelevator.com/cohorts/535/blocks/13/content_files/03_File_IO_Writing/01-writing-to-files.md'
),
(
'Intro to Databases'

'Persisting data is crucial to retain information beyond program execution. Simple text files suffice for small applications with limited, loosely organized data. However, business-oriented applications, like online bookstores, demand more robust solutions. Relational databases, organized collections of data with quick retrieval and update capabilities, excel in such scenarios. Unlike text files, relational databases, managed by Relational Database Management Systems (RDBMS), support large datasets and maintain consistency and integrity. A relational database resembles an Excel spreadsheet, consisting of tables with named columns and data types, allowing efficient storage and retrieval. The Structured Query Language (SQL) facilitates interaction with relational databases. SQL, a declarative language, enables developers to specify desired outcomes rather than step-by-step instructions. Three types of SQL statements serve distinct purposes: Data Manipulation Language (DML) for inserting, updating, deleting, and selecting data; Data Definition Language (DDL) for creating tables and defining data types; and Data Control Language (DCL) for managing database users and access permissions. RDBMS ensures data consistency by enforcing data type specifications for each table column. SQL accommodates various data types, including strings, numbers, booleans, dates, IP addresses, and geographic points.'

'database | relational | RDBMS | SQL | data-type | varchar | DML | DDL | DCL | select | from | where'

'https://lms.techelevator.com/cohorts/535/blocks/10/content_files/01_Intro_to_Databases/01-relational-databases.md'
),
(
'Ordering, Limiting, and Grouping'

'By default, rows come back from the database in an unspecified order. It''s up to the DBMS to decide how it returns rows from a SELECT statement. However, by adding an ORDER BY clause, you can set the order the database returns your rows in. By default, all ORDER BY clauses are ASC or ascending, starting at the lowest value and going to the highest value. So if you''re ordering by a number, the first row you get back has the lowest value, and the last row has the highest value. For strings, a is considered the lowest value, so ASC order goes from a to z, which means it''s alphabetical. Adding two columns to the ORDER BY clause indicates to the server that you want it to first sort by the first column and then sort by the second column. You can also add another clause to your SQL to only return a certain number of rows, called the LIMIT clause. This can be useful for retrieving the top result of a query or for paging results from a SQL query. In PostgreSQL, the string concatenation operator is ||. Placing it between the names of two fields combines the contents of those fields into a single column in the result set. You can combine any number of fields and literal strings with the concatenation operator, and you can include any number of concatenated columns in the query results.'

'SQL | ordering | limiting | grouping | order | aggregate function | concatenation | table'

'https://lms.techelevator.com/cohorts/535/blocks/10/content_files/02_Ordering_Limiting_and_Grouping/01-introduction.md'
),
(
'SQL Joins'

'Understanding relationships in databases is crucial for using the SELECT statement effectively. Relational databases derive their power from linking tables rather than just storing data. Two primary relationship types are one-to-many and many-to-many. In a one-to-many relationship, like cities and countries, a city is in one country, and a country has many cities. SQL tables model this with primary keys on both tables and a foreign key on the ''many'' side. Conversely, a many-to-many relationship, like films and actors, requires a join table, such as actor_film, connecting primary keys from both tables through foreign keys. The naming convention for tables and columns is usually singular and snake-cased. Primary keys follow the pattern (tablename)_id, and foreign keys share the name with their corresponding primary key. Join tables concatenate both table names alphabetically with an underscore. The query introduces subqueries, allowing SELECT statements within other statements. Subqueries enable dynamic retrieval without hardcoding IDs. The operation performed is an inner join, excluding entities with no corresponding entries in the linked table. To include all entities, an outer join is employed, providing flexibility in querying databases. SQL uses "left" and "right" to describe the two tables, designating the first as the left table and the second as the right table. A left outer join retrieves all rows from the left table, enhancing flexibility in querying databases.'

'SQL Joins | SQL | primary key | foreign key | constraint | cardinality | one-to-many | many-to-many | subquery | join | table'

'https://lms.techelevator.com/cohorts/535/blocks/10/content_files/03_Joins/01-primary-and-foreign-keys.md'
),
(
' Insert, Update, and Delete'

'To modify data in a database, SQL employs three key statements: INSERT for adding rows, UPDATE for altering existing data, and DELETE for removing records. When inserting, the INSERT statement is used, and it''s recommended to specify columns to avoid ambiguity. Serial columns, such as auto-incrementing integers, serve as surrogate primary keys. Although these keys aren''t explicitly included in INSERT statements, a RETURNING clause can retrieve the newly generated values, eliminating the need for additional queries. In situations involving foreign keys, subqueries are employed to dynamically obtain primary key values from related tables. The UPDATE statement facilitates changing existing data, necessitating a WHERE clause to specify the target rows. Caution is urged to avoid unintended modifications, emphasizing the importance of using a WHERE clause. Overall, understanding these SQL statements is essential for effective data management within a relational database system.'

'SQL | insert | update | delete | column | natural keys | surrogate keys | returning | subquery | where | constraint | foreign key constraint'

'https://lms.techelevator.com/cohorts/535/blocks/10/content_files/04_INSERT_UPDATE_and_DELETE/01-introduction.md'
),
(
'Database Design'

'In the journey through database fundamentals, you''ve mastered CRUD operations, understood table components, and comprehended the significance of primary and foreign keys. Now, it''s time to delve into database design. This process involves data modeling, logical design adhering to relational model rules, physical design optimization, and eventual implementation. A developer''s tasks encompass creating tables, sequences, indexes, views, and ensuring user access. Long-term database administration involves monitoring access, backups, performance enhancements, and privilege management, typically handled by a Database Administrator. Designing a relational database begins with data modeling, identifying key entities, determining primary keys for uniqueness, and establishing relationships like one-to-one, one-to-many, or many-to-many. The iterative process involves identifying main entities, assigning primary keys, and recognizing relationships. In the scenario of a recipe database, a many-to-many relationship between recipes and ingredients necessitates an associative entity—a linking table with composite primary keys. Additionally, considerations like cardinality and ordinality guide the representation of entity relationships in the design. This comprehensive overview equips you to embark on effective database design and implementation.'

'database design | CRUD | primary key | foreign key | data modeling | logical design | physical design | simple key | composite key | one-to-one | one-to-many | many-to-many'

'https://lms.techelevator.com/cohorts/535/blocks/10/content_files/05_Database_Design/01-introduction.md'
),
(
'Data access (Part 1)'

'To connect to a database in a Java application, you need to understand the Java Database Connectivity (JDBC) API. For example, connecting to a database named "bookstore" on localhost and port 5432 would use "jdbc:postgresql://localhost:5432/bookstore." Next, you utilize the JDBC DataSource interface, responsible for creating database connections. The Apache BasicDataSource, an open-source implementation, is commonly used for simplicity. This DataSource is then passed to JdbcTemplate, a class from the Spring framework, which streamlines SQL database interactions by managing low-level details like connection handling. In the context of a one-to-many relationship between two tables (authors and books), exemplified by the JdbcAuthorDao and JdbcBookDao classes, running SQL queries is facilitated by JdbcTemplate''s methods. The queryForRowSet() method, for instance, takes a SQL query as a parameter. However, dealing with null values in database columns requires caution. For instance, attempting to convert a database NULL for a value type may yield default values (0 for integers, false for booleans), while for reference types, like Date or BigDecimal, a null value can lead to NullPointerExceptions when calling methods or attributes. To mitigate this, it''s crucial to check for null before invoking any methods on potentially null values.'

'JDBC | connection string | dataSource | JdbcTemplate | Spring framework | database connection | one-to-many | jdbcAuthorDao | sql queries'

'https://lms.techelevator.com/cohorts/535/blocks/14/content_files/01_Data_Access_Part_1/01-introduction.md'
),
(
'Data Access (Part 2)'

'SELECT queries, these statements are dynamic and employ SQL arguments. Exception handling is crucial to gracefully manage errors, whether related to SQL statements or server/database connectivity. DAO methods follow a consistent naming convention—create, update, and delete, followed by the object name. Exceptionally, delete methods include the property in the WHERE clause. Parameters and return types adhere to object instances for create and update methods, while delete methods utilize property values and return the affected row count. Associative table methods, like link and unlink, facilitate INSERT and DELETE operations with void return types. Error handling is imperative in DAO methods, and common exceptions like CannotGetJdbcConnectionException (for connection issues) and DataIntegrityViolationException (for duplicate or non-existing key issues) may occur. To maintain loose coupling in the DAO pattern, a custom DAO exception is recommended. This ensures that calling code remains independent of specific DAO implementations. The custom exception class implements the parent exception''s constructors. When dealing with INSERT statements, the process mirrors SELECT queries—construct the SQL string, bind SQL arguments, and invoke a JdbcTemplate method. The choice between methods depends on whether you expect a return value, such as when using a RETURNING clause to retrieve the primary key of the newly inserted row.'

'DAO methods | insert | update | delete | JDBCTemplate | exception handling | exception | SQL queries | error handling'

'https://lms.techelevator.com/cohorts/535/blocks/14/content_files/02_Data_Access_Part_2/01-introduction.md'
),
(
'DAO Testing'

'Integration testing is essential for validating the collaboration of code units and their interactions with external dependencies, such as databases. These tests, akin to unit tests, prioritize reliability, independence, and clarity, following the Arrange-Act-Assert pattern to set up conditions, execute actions, and validate outcomes. JUnit remains the go-to framework for integration testing. However, integration tests distinguish themselves by potentially slower speeds due to external resource access and increased setup complexity. This complexity is particularly pronounced in DAO testing, where methods modify databases. DAO testing faces challenges in handling data retrieval or modification within databases, demanding awareness of the database state for accurate expectations. To overcome this, integration tests leverage mock data, eliminating ambiguity and providing precise data definitions for DAO interactions. Mock data, often defined in SQL files within the src/test/resources folder, offers flexibility for testing. For instance, a JdbcAuthorDao test might utilize SQL to establish a testing database with specific author data. It''s crucial to note that this testing database is temporary, existing solely during test execution. Any modifications to mock data should be made in the corresponding SQL file.'

'DAO | testing | integration testing | unit tests | junit | mock data | sql file'

'https://lms.techelevator.com/cohorts/535/blocks/14/content_files/03_DAO_Testing/01-introduction.md'
),
(
'Data Security'

'Data security is paramount due to common data breaches, prevalent even in sectors like banking and social media. SQL Injection Attacks pose a significant threat, exploiting unguarded user inputs to execute unauthorized database actions. The solution lies in prepared statements, demonstrated by Java''s JdbcTemplate class, which uses placeholders to delegate value insertion to the SQL database, thwarting manipulation attempts. Beyond external threats, the chapter explores data protection post-breach, introducing hashing as a method to irreversibly obscure original data. Cryptographic Hash Functions, applicable to file integrity verification, find utility in password hashing for web applications. Storing hashed passwords, rather than plaintext ones, adds a layer of security, thwarting unauthorized access attempts. Vulnerabilities arise from weak hashing algorithms or predictable passwords, underscoring the need for robust practices. Password hashing introduces salting, where a random value is added before hashing to individualize each hash, rendering precomputed attacks practically infeasible. Adaptive hashing functions like Argon2, PBKDF2, scrypt, and bcrypt offer dynamic password security, adjusting computational effort to withstand evolving computing capabilities.'

'data security | data breaches | SQL injection | hashing | prevention | security | password'

'https://lms.techelevator.com/cohorts/535/blocks/18/content_files/01_Data_Security/01-introduction.md'
),
(
'Networking and HTTP'

'Understanding the basics of how the internet functions is crucial for software developers. Key concepts include the roles of clients and servers, communication protocols (HTTP and HTTPS), and URL components (protocol, subdomain, domain, top-level domain, port, and path). The Domain Name System (DNS) translates domain names into IP addresses. HTTP communication involves requests and responses, each having a head and an optional body. The stateless nature of HTTP means each request is independent. Developer tools, like Chrome''s Network tab, allow insight into HTTP requests and responses, aiding troubleshooting and optimization. Follow-up requests for resources, such as images and scripts, contribute to rendering a complete web page. The lesson encourages using browser developer tools to gain practical insights into internet communication.'

'networking | http | https | URL | DNS | IP address | http request | http response | stateless | troubleshooting | web page rendering'

'https://lms.techelevator.com/cohorts/535/blocks/28/content_files/01_Networking_and_HTTP/01-introduction.md'
),
(
'Consuming RESTful APIs (Part 1)'

'In this unit, you''ll delve into using the HTTP protocol for Web APIs and explore the REST principles. An API (application programming interface) facilitates data transfer between computer programs, and a Web API extends this functionality over the internet. REST, short for "Representational State Transfer," outlines principles for designing Web APIs. To interact with Web APIs, you employ HTTP requests and handle responses through code, often using a client class like Spring RestTemplate. Notably, some APIs are public, accessible to all developers, while others are private and restricted. Examples like Amazon and ExchangeRate-API illustrate the diverse applications of Web APIs. The ExchangeRate-API, a public API, offers currency exchange rates through a URL endpoint. JSON (JavaScript Object Notation) emerges as a prevalent format for Web API response data due to its language independence and human readability. RestTemplate, a client in the Spring framework, executes HTTP methods, such as GET, to interact with Web APIs. It parses the response and throws exceptions for unsuccessful requests, emphasizing the importance of handling errors. Successful GET requests typically return a status code of 200. Lastly, you explore parsing JSON responses with RestTemplate, converting the data into Java objects based on predefined classes.'

'HTTP | web API | API | REST | Representational state transfer | public API | parsing JSON | status code | error handling | deserialization | Spring restTemplate | application programming interface | restTemplate'

'https://lms.techelevator.com/cohorts/535/blocks/19/content_files/02_Consuming_RESTful_APIs_Part_1/01-introduction.md'
),
(
'Consuming RESTful APIs (Part 2)'

'In this unit, you''ll delve into more advanced interactions with web APIs, focusing on sending data, handling errors, and utilizing HTTP methods like POST, PUT, and DELETE. These methods are crucial for creating, updating, and deleting data through API interactions. REST principles, denoted by Representational State Transfer, play a key role, emphasizing standard HTTP methods for seamless interactions. This unit delves into advanced aspects of web API interactions, focusing on sending data and error handling. Key HTTP methods—POST, PUT, and DELETE—are explored for creating, updating, and deleting data. The RestTemplate tool facilitates these operations, handling serialization and deserialization seamlessly. Adherence to RESTful principles, aligning with standard HTTP methods, is emphasized for consistent and compatible API interactions. Understanding HTTP status codes is crucial for effective error handling, with client (4xx) and server (5xx) codes indicating issues. Best practices involve associating data-changing methods with the appropriate HTTP methods, avoiding caching pitfalls associated with GET requests for data modification. Postman, introduced as a testing tool, offers flexibility in selecting request methods and customizing data formats like JSON. The unit clarifies "REST" and "RESTful" as an architectural style leveraging HTTP standards, defining GET, POST, PUT, and DELETE methods. The ResourceAccessException in RestTemplate signals network issues, prompting robust error-handling strategies within try/catch blocks. This comprehensive unit equips learners with nuanced API interaction skills, ensuring effective data exchange and adherence to RESTful principles, ultimately fostering robust, error-resilient applications.'

'put | get | post| delete | serialization | deserialization | http status code | caching | Postman | REST | API | HTTP methods | API endpoint | JSON format | web API | URL'

'https://lms.techelevator.com/cohorts/535/blocks/19/content_files/03_Consuming_RESTful_APIs_Part_2/01-introduction.md'
),
(
'Server-side APIs (Part 1)'

'This unit delves into the concept of API development, emphasizing the importance of design patterns and frameworks. It uses a hypothetical startup scenario to illustrate challenges in managing multiple applications and introduces the Model-View-Controller (MVC) pattern for enhanced code organization. MVC separates an application into Model, View, and Controller components, promoting clean code and maintainability. Spring MVC, a Java framework, is introduced, with Spring Boot simplifying its usage for building robust applications. The request and response lifecycle in a Spring MVC application is explained, emphasizing the role of controllers and models. Conventions for organizing controllers and naming are discussed, with @RestController as a crucial annotation for handling web requests. Handler methods in controllers, annotated with @RequestMapping, are explored, showcasing examples for retrieving, getting, and adding. Annotations like @RequestBody and @PathVariable are introduced for handling request body and path variables. The unit concludes by laying the foundation for API development, covering MVC principles, Spring MVC framework, and key annotations.'

'API | Design patterns | MVC | Model | view | controller | Spring boot | restController | handler methods | RequestMapping | RequestBody | pathVariable | JSON | content negotiation'

'https://lms.techelevator.com/cohorts/535/blocks/20/content_files/01_Server_Side_APIs_Part_1/01-introduction-to-mvc.md'
),
(
'Server-side APIs (Part 2)'

'This unit delves into the realm of API development, focusing on Web Service APIs and their adherence to the REST (Representational State Transfer) convention. REST, relying on standard web technologies like HTTP, URLs, and JSON, provides a flexible and widely adoptable approach for exposing code and business logic to diverse applications. It revolves around the concept of "resources," such as objects in an application, with URLs and HTTP methods addressing these resources. Resources, ranging from "days" in a calendar app to "products" in an e-commerce site, form the foundational elements of applications. The CRUD (Create, Retrieve, Update, Delete) operations are employed to manipulate these resources, utilizing HTTP methods like POST, GET, PUT, and DELETE. The question of whether to use POST or PUT is clarified by the idempotent nature of operations. PUT, being idempotent, updates resources consistently, while POST creates new ones. The unit emphasizes the significance of HTTP status codes in API responses, elucidating common codes like 200 (OK), 201 (Created), 204 (No Content), 304 (Not Modified), and error codes like 400 (Bad Request), 401 (Unauthorized), 404 (Not Found), and 500 (Internal Server Error). The @ResponseStatus annotation is introduced to control the status code of API responses, allowing customization based on different scenarios. The ResponseStatusException class enables tailored status codes and error messages in exceptional situations.'

'API | REST | http methods | post | get | put | delete | Data Validation | Bean validation | responseStatus | Crud | dependency injection | '

'https://lms.techelevator.com/cohorts/535/blocks/20/content_files/02_Server_Side_APIs_Part_2/01-what-is-rest.md'
),
(
'Securing APIs'

'This unit explores the crucial aspects of securing API methods in server applications and ensuring secure access from client applications. The focus lies on authentication and authorization, distinct but interconnected components of the security framework. Authentication is the process of validating a user''s identity, often accomplished through knowledge factors (e.g., passwords), ownership factors (e.g., USB keys), or inherence factors (e.g., fingerprints). Multi-factor authentication (MFA) combines these factors, enhancing security. Authorization involves granting users specific permissions to access resources or perform functions. For instance, different users may have varying levels of access, like viewing versus updating sensitive information. The unit introduces JSON Web Token (JWT) as a compact and secure means of transmitting information between parties. JWT, a JSON object, facilitates authorization in APIs. Upon user authentication, the server creates a JWT, which the client includes in API requests using the Authorization HTTP header with the "Bearer" prefix. The server verifies the JWT accuracy to grant or deny access to the requested resource. JWTs consist of three parts: header, payload (data), and signature. Tools like JWT.io allow developers to decode JWTs, revealing these components. Claims, statements about an entity, form the payload. Standard claims include subject (user ID), name, and role. The inclusion of expiration time prevents token misuse.'

'Authentication | Authorization | Knowledge factors | Ownership factors | Inherence factors | JSON Web Token | header | payload | signature | restTemplate | responseEntity| http response code | Unauthorized | forbidden'

'https://lms.techelevator.com/cohorts/535/blocks/20/content_files/03_Securing_APIs/01-introduction.md'
),
(
'Intro to HTML',

'HTML, or Hyper Text Markup Language, is a markup language used to structure and display content on the web. It employs tags to define the structure of text. For instance, <h1> tags indicate a heading, while <p> tags represent paragraphs. Unlike plain text, HTML informs web browsers on how to present content. To begin working with HTML and CSS, which styles HTML elements, you only need a web browser and a text editor, such as Visual Studio Code. HTML documents start with the common structure of <!DOCTYPE html> and the <html> root tag. The <head> contains metadata, and the <body> holds content. You can generate this structure using tools like Emmet in Visual Studio Code. The page title is set with the <title> tag in the <head>. Opening the web page is simple, either by double-clicking the file or using Visual Studio Code Live Server extension. HTML tags come in pairs with opening and closing tags, or they can be self-closing like <br /> and <hr />. Tags may have attributes, like lang="en" in the <html> tag, influencing element behavior. For a detailed list of attributes, refer to the MDN documentation on HTML attributes. While it would be difficult to list all of the tags, here are some common ones: Heading tags such as <h1>, the paragraph tag <p>, the emphasis tag <em>, the strong tag <strong>, the blockquote tab <blockquote>, the anchor tag <a>, the image tag <img>, list tags <ul> <ol> <li>, and table tags <table> <tr> <td> <th>',

'http | tag | tags | hyper | text | markup | language | markup | header | web | visual studio code | visual',

'https://lms.techelevator.com/cohorts/535/blocks/6/content_files/01_Intro_HTML_CSS/01-html-and-css.md'
),
(
'Intro to CSS',

'HTML structures web content, while Cascading Style Sheets (CSS) adds aesthetic appeal and layout. Browsers apply default styles, noticeable in headings, paragraphs, lists, and links. CSS empowers customization, stored in a "css" directory and linked to HTML using <link>. Syntax involves selectors, declarations, properties, and values. Fonts, vital for design, can be set using the body selector, featuring web-safe or Google Fonts. Font properties include size, weight, style, line height, and alignment. Colors, specified by keywords or hex codes, impact background and text for readability. Key CSS properties encompass font, text, and color adjustments. Web-safe and web fonts provide design flexibility, and tools like Visual Studio Code simplify color selection. CSS enhances the visual appeal, ensuring a harmonious and readable web design.',

'http | css | style | styling | styles | decoration | decorate | font | visual studio code | visual | web design | web | font | color | selector | properties',

'https://lms.techelevator.com/cohorts/535/blocks/6/content_files/01_Intro_HTML_CSS/07-intro-to-css.md'
),
(
'CSS Selectors and Box Model',

'CSS layout involves treating HTML elements as rectangles with attributes like height, width, margin, padding, and border. The box model, comprising these properties, provides control over an elements appearance. Understanding the flow of elements on a webpage is crucial, including display types like block, inline, and inline-block. CSS selectors, both basic and advanced, play a pivotal role in styling by selecting specific elements. Additionally, element positioning, unit measurements, and the principles of cascading and specificity are fundamental aspects of effective web design.',

'css | box | model | box model | decorate | layout | web design | properties | selectors | elements | attributes | appearance',

'https://lms.techelevator.com/cohorts/535/blocks/6/content_files/02_CSS_Selectors/07-cascading-and-specificity.md'
),
(
'CSS Grid',

'HTML page layouts have evolved from table-based structures to the use of <div>s and float-based positioning, with CSS frameworks like Bootstrap addressing layout challenges. Modern CSS introduces powerful tools like Flexbox and Grid, catering to diverse interface needs. Flexbox excels in organizing similar objects, making it ideal for interfaces such as Twitter feeds or product lists. CSS Grid, on the other hand, facilitates the division of pages into rows and columns, eliminating the complexities of float-based layouts. Combining Flexbox and Grid empowers designers to create intricate and stable layouts swiftly. Responsive web design, crucial for diverse screen sizes, involves flexible grid layouts, resizable images, and CSS media queries, ensuring a seamless user experience. Embracing a mobile-first approach has become imperative, starting with small screens and gradually introducing breakpoints for larger screens, ensuring optimal user interaction across devices.',

'grid | css | formatting | format | layout | appearance | appear | attributes | model | position | positioning | css grid | experience | organize | organization ',

'https://lms.techelevator.com/cohorts/535/blocks/6/content_files/03_CSS_Grid/01-layouts-in-css.md'
),
(
'CSS Flexbox',

'Flexbox is short for Flexible Box Module. It is a relatively new layout tool in CSS that provides a flexible way to arrange items on a page. Since its introduction several years ago, it has been steadily working its way into common usage in web development and is supported by nearly 98% of the available browsers. Flexbox dynamically handles alignment and the space between page items, which helps to save time. It consists of a flex container that contains one or more flex items which are constrained in their layout within the container using various flexbox properties specified by the developer.',

'css | formatting | format | layout | appearance | appear | attributes | model | position | positioning | css flexbox | experience | organize | organization | flexbox',

'https://lms.techelevator.com/cohorts/535/blocks/6/content_files/04_CSS_Flexbox/01-flexbox.md'
),
(
'Intro to JavaScript',

'JavaScript, originally designed for dynamic HTML content, has evolved into a versatile language with unique features. Variable names in JavaScript adhere to specific rules, allowing letters, digits, and $. Best practices include camelCase for variables and uppercase with underscores for constants. JavaScript offers let and const for variable declaration, with const indicating immutability. Data types like Number, String, Boolean, Object, null, and undefined exist, and JavaScript is loosely typed, allowing variables to hold any type. Key numeric operations, string manipulations, and logical branching mirror conventions in Java and C#. JavaScript introduces for, for...of, while, and do...while loops, similar to counterparts in Java and C#. Arrays in JavaScript support dynamic sizing, and various array functions, such as push(), pop(), and join(), enhance functionality. Finally, JavaScript runs primarily in web browsers, using the <script> element to embed or link scripts for execution. Understanding these fundamentals empowers developers to create robust web applications.',

'javascript | script | web design | web | functionality | dynamic | variable | loosely typed | programming | language | ecma script | ecma  ',

'https://lms.techelevator.com/cohorts/535/blocks/11/content_files/01_Intro_to_JavaScript/01-introduction.md'
),
(
'JavaScript Functions',

'JavaScript functions, akin to methods in Java or C#, are versatile blocks of code callable from anywhere, not confined to classes. Named functions comprise a signature with names, parameters, and optional or default values. Parameters are optional, allowing undefined values, and default values can be set, enhancing function flexibility. Rest parameters handle variable arguments. Anonymous functions, created with arrow syntax, lack names but offer versatility in assignment or direct use as function parameters. Array functions like forEach, map, filter, and reduce provide powerful tools for array manipulation. Documentation, facilitated by JSDoc comments, is crucial for code clarity, offering insights into function purpose, parameters, return values, and optional data types. JSDoc contributes to code readability and aids in development by providing context and guidance for programmers.',

'javascript | script | web design | web | function | functions | anonymous function | anonymous | jsdoc | parameters | parameter | rest parameter',

'https://lms.techelevator.com/cohorts/535/blocks/11/content_files/02_JavaScript_Functions/01-javascript-functions.md'
),
(
'Document Object Model',

'The Document Object Model (DOM) is the internal representation of a web page structure in a browser, crucial for dynamic and interactive web development. Upon loading an HTML document, browsers convert it into a tree-like structure, reflecting parent-child relationships of elements. This hierarchy, resembling HTML tags, is fundamental for JavaScript, as it operates on the DOM rather than static HTML. Notably, the DOM may differ from the HTML source, impacting CSS application. Understanding this is exemplified when creating tables, revealing added elements like tbody for representation. Developers employ JavaScript functions, including getElementById() and querySelector(), for DOM interaction. Mastery of DOM traversal is pivotal for dynamically modifying web pages. Techniques like appendChild() and insertAdjacentElement() enable the addition of new elements with precise placement. Manipulating elements involves accessing properties like innerText and innerHTML, with caution to prevent security vulnerabilities such as Cross-Site Scripting (XSS). The DOM facilitates navigation between elements with methods like parentNode and nextElementSibling. For removal, removeChild() is employed, removing elements by calling it from the parent. This comprehensive overview underscores the DOM centrality in web development, emphasizing its dynamic nature through JavaScript interactions and its impact on the interactive and responsive nature of modern web pages.',

'document object model | document | object | model | structure | dom | manipulate | manipulation | manipulating elements | append ',

'https://lms.techelevator.com/cohorts/535/blocks/11/content_files/03_DOM/01-introduction.md'
),
(
'Event Handling',

'Event-driven programming transforms traditional console-based logic, adapting to the dynamic flow of graphical user interface (GUI) applications. Unlike console programs, GUIs empower users with broad control, seen in web-based actions like clicks, selections, and resizing. This paradigm, crucial for flexibility, responds to diverse events asynchronously. JavaScripts addEventListener supports event subscription, specifying target, type, and function. The accompanying Event Object holds vital details. Event propagation traverses the DOM hierarchy, allowing multiple listeners. stopPropagation() halts upward traversal. In summary, this model empowers responsive web apps, embracing user events and a versatile pub-sub model for interactive digital landscapes.',

'event | event handling | listener | javascript',

'https://lms.techelevator.com/cohorts/535/blocks/11/content_files/04_Event_Handling/01-event-driven-programming.md'
),
(
'Intro to Vue.JS',

'Vue.js is an open-source JavaScript framework renowned for its user-friendly approach to building interactive web applications, particularly single-page applications (SPAs). Vue embraces a component-based architecture, encapsulating UI elements into reusable, self-contained components. This frameworks advantages lie in modularity, reusability, and its data-centric design, featuring robust data-binding capabilities. Vue Single File Components (SFCs) consolidate HTML, CSS, and JavaScript into a single .vue file. Components, like StudentInfo.vue, exhibit this structure, including template, script, and style blocks. State, crucial for components, is defined through a data function, enabling Vue to monitor and automatically update the UI as data changes. Mustache tags facilitate data display, while v-bind, v-model, and v-for directives enhance data binding and iteration. Computed properties derive values dynamically, and v-model facilitates two-way data binding for user interaction. Vue.js strikes a balance between simplicity and power, making it a compelling choice for modern web application development.',

'vue | component | modular | web design | web application | web | reusability | reusable',

'https://lms.techelevator.com/cohorts/535/blocks/15/content_files/01_Intro_to_Vue_JS/01-introduction.md'
),
(
'Vue Event Handling',

'Vue simplifies event handling in applications, connecting DOM element events like clicks to corresponding code through event binding. Methods, essential JavaScript functions in components, are introduced for behavior definition. The distinction between methods and computed properties is explained. Event listeners, using the v-on directive, respond to events like clicks or changes in a textbox. Specifics of keyboard and mouse events, including key modifiers for targeted responses, are covered. Shorthand notations, like @ for v-on, are mentioned. Event handlers, the code executed on events, can be inline or method-based. Handling event arguments, with access to the original DOM event, is emphasized. Using v-on:submit for form submissions is discussed, with solutions to prevent unwanted browser refresh. Conditional display, essential for dynamic UIs, is explained using v-if for element removal and v-show for toggling CSS display. Considerations for choosing between v-if and v-show, emphasizing CPU efficiency, are highlighted. The content provides a comprehensive understanding of Vue event handling and related concepts.',

'event | event handling | event | click | v-if | v-show | dom manipulation | dynamic | web design | interactivity | user interface | ui | usability | use | usable | interactive | clickable',

'https://lms.techelevator.com/cohorts/535/blocks/15/content_files/02_Vue_Event_Handling/01-introduction.md'
);
