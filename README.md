# Re-former (no styles)
This project introduced forms and focused on how data entered through a form interacts with a Model and, by extension, a database.

## Task
The task was to understand how to create forms and use the submitted information to query, add to or update my database. The forms were constructed uisng:
- Pure HTML
  - Using naming conventions for classes to send certain data as top-level or nested data
    - e.g. `name='user[email]'` vs. `name='email'` for a text `<input>` for submitting a user's email
  - Adding an **authenticity token** to your form was essential
  - A refresher in using HTML as the HTML part is familiar
- Rails' soft-deprecated *form_tag* and *\*_tag* (e.g. *password_field_tag*) helper methods
  - Similar to HTML but took care of various elements including the authenticity token
- Rails' **form_with** helper method
  - Using the controller to send an instance variable containing either:
    - An existing record (UserController#edit)
    - A new (unsaved) record (UserController#new)

Some additional things I decided to do:
- Use a partial for the form
  - since it was used for both *edit* and *new* actions
- Adding the *show* controller action
- Adding links using the *link_to* helper method
  - For better navigation.

## MVC
Since it's simple, here's information about the Model, Views and Controller used:
- Model
  - **User**
    - username
    - email
    - password (no hash or salt)
  - Validations
    - *presence* on all attributes
- Views (and partial)
  - **_form.html.erb** (partial)
    - Form for adding new records or updating existing ones 
  - **new.html.erb**
    - Page with *_form.html.erb*
  - **edit.html.erb**
    - Page with *_form.html.erb*
  - **show.html.erb**
    - Page to display a user's username and email
- Controller
  - **UsersController**
    - Actions: new, show, edit, create, update
    - Strong parameters

## Additional resources
I looked up how passwords would be stored securely in a database, but that turned out to be irrelevant for the task (because of the process), however most relevant information came from:
- Rails API
- Rails documentation (on forms, controller, routing and validations)