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

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/npm/01-whats-a-package.md |
https://www.npmjs.com/'
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

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/chrome-dev-tools/01-introduction.md |
https://developer.chrome.com/docs/devtools/'
),
(
'Cypress',

'Cypress is a testing framework for web pages and applications that run in a browser. You write Cypress tests in JavaScript with a syntax that''s meant to be approachable and understandable. Cypress can test anything that runs in a browser and lets you alter any aspect of how your application works. This level of control allows you to write end-to-end tests, integration tests, and unit tests using Cypress. Cypress doesn''t require any prerequisites, but it''s best to install through npm. There are two ways to run Cypress tests: in a browser window, or in the command-line with no visible browser. This is also known as headless.',

'Cypress | testing | framework | npm | tests | npm run test | headless | npm run test-headless',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/cypress/01-intro-to-cypress.md |
https://lms.techelevator.com/content_link/gitlab.com/te-curriculum/intro-to-tools-lms/npm/01-whats-a-package.md'
),
(
'Vue',

'Vue is an open source JavaScript framework for building web applications. It''s most often used to build single-page applications. Vue is similar to other JavaScript frameworks such as Angular and React. To run an existing Vue project, you must first install its dependencies. Dependencies are additional software packages that your application requires to run. NPM handles this using the project''s package.json and package-lock.json files.',

'Vue | dependencies | project | JavaScript | framework | single-page application | SPA | VueJS | Vue DevTools | Volar | ESLint',

'https://lms.techelevator.com/cohorts/535/blocks/5/content_files/vue/01-introduction-to-vue.md |
https://vuejs.org/guide/introduction.html |
https://eslint.org/ |
https://vitejs.dev/ |
https://vuejs.org/guide/quick-start.html#creating-a-vue-application'
),
(
'Variables and Data Types',

'Typical programs like web applications need to store and manipulate data. Programmers try to write these applications with as little repetitive code as possible. For example, building a password reset flow for every single user is time consuming. So, to save time, programmers use variables to store the user''s email address. This allows them to write their code in a generic and reusable manner.',

'variable | comment | line comment | data type | boolean | byte | short | int | long | float | double | char | string | declare | data-type identifier | camel-case | constant | expression | precedence | concatenate | type conversion | widen | narrow | literal',

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/01_Variables_Data_Types/01-variables.md |
https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html |
https://docs.oracle.com/javase/tutorial/java/nutsandbolts/_keywords.html |
https://docs.oracle.com/javase/specs/jls/se11/html/jls-15.html#jls-15.17.3'
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

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/06_Collections_Part_1_Lists_Stacks_Queues/01-array-recap.md |
https://docs.oracle.com/javase/tutorial/java/package/usepkgs.html |
https://docs.oracle.com/javase/tutorial/collections/interfaces/index.html |
https://docs.oracle.com/javase/tutorial/java/data/autoboxing.html |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/List.html |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/ArrayList.html |
https://docs.oracle.com/javase/tutorial/essential/exceptions/ |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Stack.html |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Queue.html |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/LinkedList.html'
),
(
'Collections (Part 2)',

'The Map class offers a distinct advantage over Lists. Maps consist of key-value pairs where each value is associated with a unique key, and the keys are arranged within the collection so that they can be instantly located and the values retrieved. There is no need to iterate through the collection looking for a particular value. A program should only loop through a Map when it needs to access every single value within. On the other hand, one disadvantage to Maps is they don''t maintain order in the sense of keeping track of the order in which items were added. Another unordered data structure is Set, a collection that holds unique values. It allows you to quickly determine if the value already exists in the set. Because Sets are unordered, they don''t maintain indexes. Items in a Set are identified by hashcodes. A hashcode is a specially computed value which uniquely identifies each item in the Set.',

'binary search | map | key | value | put | get | containsKey | entry set | hashmap | set | hashcode | add | remove | hashset',

'https://lms.techelevator.com/cohorts/535/blocks/7/content_files/07_Collections_Part_2_Maps/01-introduction.md |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Map.html |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/HashMap.html |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Set.html |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/HashSet.html'
),
(
'Classes and Encapsulation',

'Programmers often need to solve problems that the Java language doesn''t have an out-of-the-box solution for. To create these sorts of applications, programmers need to represent things like shopping carts and user profiles as custom data types. Using classes, they can define what characteristics and behaviors a data type has. Programmers can create as many instances of objects from the class blueprint as needed. The bundling of an object''s state and behaviors together is part of the definition of encapsulation, the first pillar of object-oriented programming.',

'class | state | instance | blueprint | behavior | encapsulation | object-oriented-programming | oop | attribute | property | properties | getter | setter | access modifier | this | derived | default | constructor | static | overload | coupled | loose | tight',

'https://lms.techelevator.com/cohorts/535/blocks/9/content_files/01_Classes_and_Encapsulation/01-introduction.md |
https://docs.oracle.com/javase/tutorial/java/package/namingpkgs.html'
),
(
'Inheritance',

'One OOP principle is Inheritance, which is the act of having one class adopt the properties and methods of another class. This prevents code duplication and allows you to share code across classes while having the source code live in only one class file.',

'object-oriented-programming | oop | inheritance | superclass | subclass | super | override | extend',

'https://lms.techelevator.com/cohorts/535/blocks/9/content_files/02_Inheritance/01-inheritance.md |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/String.html |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/ArrayList.html |
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html'
),
(
'Polymorphism',

'In object-oriented programming, polymorphism is the idea that something can be assigned a different meaning or usage based on its context. This specifically allows variables and objects to take on more than one form. Often, you want to write code that can make a basic request, and based on context, allow different behaviors to take place. Polymorphism means you can write one generic method call that uses whatever specific version of that method is appropriate when it runs.',

'object-oriented-programming | oop | polymorphism | code smell | loosely coupled | interface | implement',

'https://lms.techelevator.com/cohorts/535/blocks/9/content_files/03_Polymorphism/01-whats-polymorphism.md |
https://blog.codinghorror.com/code-smells/'
),
(
'Managing Inheritance',

'When you''re designing a new class, you can require other classes to implement certain methods, prevent other classes from overriding certain methods, and control which properties and methods child classes can access. Doing those things is an important way to communicate with other developers and helps ensure they use your code correctly. An abstract class is a class that you can''t create an instance of. An abstract method is a method with no implementation that''s declared in an abstract class. A final class is a class that other classes can''t inherit from. A final method is a method that a child class can''t override.',

'abstract | final | protected | access | concrete | polymorphism',

'https://lms.techelevator.com/cohorts/535/blocks/9/content_files/04_Managing_Inheritance/01-introduction.md'
);