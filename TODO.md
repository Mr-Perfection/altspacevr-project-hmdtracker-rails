# HMD Track Coding Challenge

## Objective

* implement 'AuditState' concern module and basic functionalities(#1 priority).
* Add any enhancements on this application (check the old_README.md for what Altspace expects.)

## Getting started

'''
$ rake db:migrate #migrate
$ rake db:seed
$ rails s
'''

## Frameworks

* Frameworks provided by Altspace + ...




You can implement `AuditedState` as a Rails [Concern](http://api.rubyonrails.org/classes/ActiveSupport/Concern.html) and should use Ruby meta programming to extend the class's functionality. Here are the requirements for this concern:

- `model.state` should initially equal the first valid value (in this example, `:announced`), even if there are no rows in the state table for that model yet.

- `model.state = :new_state` should insert a row into the state table with the value `new_state` in the database, and subsequent calls to `model.state` should return `:new_state`.

- You can set `model.state` to a string or a symbol, and it should work. Reading `model.state` should return a symbol.

- Trying to update `model.state` to an invalid value should raise a validation exception.

You should **not** need to change the controller code if you've implemented this correctly. By simply making these changes to the two model classes to include and use `AuditedState` you should be seeing rows get inserted into the `hmd_states` table instead of updating the `state` column on the `hmds` table.

For this part of the project, there are a few things we'll be looking for in your submitted repo:

- Your implementation of `audited_state.rb`
- A small set of unit tests + test fixtures.
- A migration script to migrate the existing legacy `state` column value into the new `hmd_states` table, and removal of the legacy column.

For this part of the project, please **do not** include additional 3rd party code. You can reference 3rd party code of course, but any code you write for the concern should be your own. (We'll be asking you how it works!)
