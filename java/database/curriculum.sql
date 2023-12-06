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
);