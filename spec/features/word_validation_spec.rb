Feature:
As a guest user (no sign in necessary)
When I visit "/"
And I fill in a text box with "foxes"
And I click "Validate Word"
Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."

As a guest user
When I visit "/"
And I fill in a text box with "foxez"
And I click "Validate Word"
Then I should see a message that says "'foxez' is not a valid word."
