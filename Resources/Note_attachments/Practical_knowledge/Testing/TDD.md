# Test Driven Development

![ProjectStructureExample](https://github.com/Lemonbrush/My-iOS-Dev-Learning-Tracker/blob/main/Resources/Images/Other/TDD.png)

### Three phases of TDD
- Create precise tests: Developers need to create precise unit tests to verify the functionality of specific features. They must ensure that the test compiles so that it can execute. In most cases, the test is bound to fail. This is a meaningful failure as developers are creating compact tests based on their assumptions of how the feature will behave.  

- Correcting the Code: Once a test fails, developers need to make the minimal changes required to correct the code so that it can run successfully when re-executed.  

- Refactor the Code: Once the test runs successfully, check for redundancy or any possible code optimizations to enhance overall performance. Ensure that refactoring does not affect the external behavior of the program.

### Main rules: 
- You are not allowed to write any production code unless it is to make a failing unit test pass.  

- You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures.    

- You are not allowed to write any more production code than is sufficient to pass the one failing unit test.    

You must begin by writing a unit test for the functionality that you intend to write. But by rule 2, you can't write very much of that unit test. As soon as the unit test code fails to compile, or fails an assertion, you must stop and write production code. But by rule 3 you can only write the production code that makes the test compile or pass, and no more.  

If you think about this you will realize that you simply cannot write very much code at all without compiling and executing something. Indeed, this is really the point. In everything we do, whether writing tests, writing production code, or refactoring, we keep the system executing at all times. The time between running tests is on the order of seconds, or minutes. Even 10 minutes is too long.  

Now most programmers, when they first hear about this technique, think: "This is stupid!" "It's going to slow me down, it's a waste of time and effort, It will keep me from thinking, it will keep me from designing, it will just break my flow." However, think about what would happen if you walked in a room full of people working this way. Pick any random person at any random time. A minute ago, all their code worked.  

Let me repeat that: A minute ago all their code worked! And it doesn't matter who you pick, and it doesn't matter when you pick. A minute ago **all their code worked!**  

If all your code works every minute, how often will you use a debugger? Answer, not very often. It's easier to simply hit ^Z a bunch of times to get the code back to a working state, and then try to write the last minutes worth again. And if you aren't debugging very much, how much time will you be saving? How much time do you spend debugging now? How much time do you spend fixing bugs once you've debugged them? What if you could decrease that time by a significant fraction?  

But the benefit goes far beyond that. If you work this way, then every hour you are producing several tests. Every day dozens of tests. Every month hundreds of tests. Over the course of a year you will write thousands of tests. You can keep all these tests and run them any time you like! When would you run them? All the time! Any time you made any kind of change at all!  

Why don't we clean up code that we know is messy? We're afraid we'll break it. But if we have the tests, we can be reasonably sure that the code is not broken, or that we'll detect the breakage immediately. If we have the tests we become fearless about making changes. If we see messy code, or an unclean structure, we can clean it without fear. Because of the tests, the code becomes malleable again. Because of the tests, software becomes soft again.  

But the benefits go beyond that. If you want to know how to call a certain API, there is a test that does it. If you want to know how to create a certain object, there is a test that does it. Anything you want to know about the existing system, there is a test that demonstrates it. The tests are like little design documents, little coding examples, that describe how the system works and how to use it.  

Have you ever integrated a third party library into your project? You got a big manual full of nice documentation. At the end there was a thin appendix of examples. Which of the two did you read? The examples of course! That's what the unit tests are! They are the most useful part of the documentation. They are the living examples of how to use the code. They are design documents that are hideously detailed, utterly unambiguous, so formal that they execute, and they cannot get out of sync with the production code.  

But the benefits go beyond that. If you have ever tried to add unit tests to a system that was already working, you probably found that it wasn't much fun. You likely found that you either had to change portions of the design of the system, or cheat on the tests; because the system you were trying to write tests for was not designed to be testable. For example, you'd like to test some function 'f'. However, 'f' calls another function that deletes a record from the database. In your test, you don't want the record deleted, but you don't have any way to stop it. The system wasn't designed to be tested.  

When you follow the three rules of TDD, all your code will be testable by definition! And another word for "testable" is "decoupled". In order to test a module in isolation, you must decouple it. So TDD forces you to decouple modules. Indeed, if you follow the three rules, you will find yourself doing much more decoupling than you may be used to. This forces you to create better, less coupled, designs.  

Given all these benfits, these stupid little rules of TDD might not actually be so stupid. They might actually be something fundemental, something profound. Indeed, I had been a programmer for nearly thirty years before I was introduced to TDD. I did not think anyone could teach me a low level programming practice that would make a difference. Thirty years is a lot of experience after all. But when I started to use TDD, I was dumbfounded at the effectiveness of the technique. I was also hooked. I can no longer concieve of typing in a big long batch of code hoping it works. I can no longer tolerate ripping a set of modules apart, hoping to reassemble them and get them all working by next Friday. Every decision I make while programming is driven by the basic need to be executing again a minute from now.  

### Benefits of Test Driven Development (TDD)
- Fosters the creation of optimized code.

- Helps developers better analyze and understand client requirements and request clarity when they are not adequately defined.

- The addition and testing of new functionalities become much easier in the latter stages of development.

- Test coverage under TDD is much higher compared to the conventional development models. This is because the TDD focuses on creating tests for each functionality right from the beginning.

- Enhances the productivity of the developer and leads to the development of a codebase that is flexible and easy to maintain.

### Source 
- [TheThreeRulesOfTdd](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd)
- [What is Test Driven Development (TDD) : Approach & Benefits](https://www.browserstack.com/guide/what-is-test-driven-development)