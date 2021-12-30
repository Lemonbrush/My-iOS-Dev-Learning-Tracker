# Functional tests

Unit tests tell a developer that the code is doing things right; functional tests tell a developer that the code is doing the **right things**

---

**Unit tests:**  
Unit tests are written from a programmer's perspective. They ensure that a particular method of a class successfully performs a set of specific tasks. Each test confirms that a method produces the expected output when given a known input.

**Functional tests:**  
Functional tests are written from a user's perspective. These tests confirm that the system does what users are expecting it to.

---

- A unit test tests an independent unit of behavior. What is a unit of behavior? It's the smallest piece of the system that can be independently unit tested. (This definition is actually circular, IOW it's really not a definition at all, but it seems to work quite well in practice, because you can sort-of understand it intuitively.)

- A functional test tests an independent piece of functionality.

---

- A unit of behavior is very small: while I absolutely dislike this stupid "one unit test per method" mantra, from a size perspective it is about right. A unit of behavior is something between a part of a method and maybe a couple of methods. At most an object, but not more than one.

- A piece of functionality usually comprises many methods and cuts across several objects and often through multiple architectural layers.

---

- A unit test would be something like: when I call the validate_country_code() function and pass it the country code 'ZZ' it should return false.

- A functional test would be: when I fill out the shipping form with a country code of ZZ, I should be redirected to a help page which allows me to pick my country code out of a menu.
Unit tests are written by developers, for developers, from the developer's perspective.

---

- Functional tests may be user facing, in which case they are written by developers together with users (or maybe with the right tools and right users even by the users themselves), for users, from the user's perspective. Or they may be developer facing (e.g. when they describe some internal piece of functionality that the user doesn't care about), in which case they are written by developers, for developers, but still from the user's perspective.

--- 

- In the former case, the functional tests may also serve as acceptance tests and as an executable encoding of functional requirements or a functional specification, in the latter case, they may also serve as integration tests.

- Unit tests change frequently, functional tests should never change within a major release.

#### Sources

- [What is the difference between unit tests and functional tests?](https://stackoverflow.com/questions/2741832/what-is-the-difference-between-unit-tests-and-functional-tests)