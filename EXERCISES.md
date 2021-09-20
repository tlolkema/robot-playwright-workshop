# Exercises

- Every exercise is a testcase, which are located in `exercises/tests.robot`
- The resource file where all the keywords should go is located in `exercises/resources.resource`
- The JSON schemas should be placed in the `exercises/schemas` folder
- You can use the custom keywords already defined in `PythonLibrary.py` and `PlaywrightLibrary.py`

> Try to make the exercises yourself, or ask for a hint by one of the teachers before looking at the `solutions` folder.

## Exercise 1

Use the Browser library to:

- Fill in the form
- Submit the form
- Validate the welcome text

You can use the Browser library keyword documentation to write the missing keywords:

> https://marketsquare.github.io/robotframework-browser/Browser.html

Define the missing locators in the variables section of `resources.resource` and use these to write the missing keywords.

## Exercise 2

- Use the keyword `When Stub Endpoint And Return File` from the `PlaywrightLibrary.js` to return a response from the JSON file `stub_response.json`

- Use the keywords you made in Exercise 1 to submit the form
- Validate that the webpage shows the stubbed response

## Exercise 3

- Use a keyword in `PlaywrightLibrary.js` to return an error on the `/frameworks` endpoint
- Validate that the correct error message is shown

> **TIP**: Use [HTTP 418](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/418)

## Exercise 4

- Generate a JSON schema of the `/frameworks` response
- Put this JSON schema in `schemas/frameworks-response-schema.json`
- Make a request to `/frameworks` to validate the response against the JSON schema (check `resources.resource` for keywords to use)

## Exercise 5

- Use the Browser library to click on the $1.000.000 Button

## Exercise 6

- Make a request to `/signup`
- Validate this response to a JSON schema

## Exercise 7

- Let the suite fail if a console error occured during one of the tests

## Bonus Exercise

- Extend the `PlaywrightLibrary` by writing an own method, and use this in one of your tests
