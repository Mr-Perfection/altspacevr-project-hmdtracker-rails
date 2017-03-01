# HMD Track Coding Challenge

## UPDATE: I was invited to do the on-site interview after the coding challenge.

## Intro
This project is my implementation for [HMD Track Coding Challenge](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/README_OLD.md) to demonstrate my knowledge and skills in RoR development.

## Getting started

```
# migrate up-to-date.
$ rake db:migrate:reset
$ rails s

# testing
$ rake test

# remove a previous commit
git reset HEAD~1
```


## Demo
[ENJOY MY DEMO XD](https://hmdtracksl.herokuapp.com/hmds)

## Assumptions
* I made an assumption that there is no restriction on hmd_states that belong to hmd model. It means I allow hmd model to have duplicate states. If this assumption is wrong, I can simply create a private method that checks duplicates and put it in `:before_create` filter.

```rb
  # inside hmd.rb
  # code is not tested. Just to support how I would approach if my assumption is wrong
  before_save :check_duplicates
  # ...
  def check_duplicates
    if self.hmd_states.include?(self.state)
      raise RuntimeError.new('You cannot have a duplicate state')
    end
  end
```

## Implementation
I wrote down what are the basic functionalities that AuditState.rb should perform. Instead of diving into building AuditState.rb and start modulating, I chose to implement those basic requirements from  [Instructions](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/README_OLD.md) in  models. I wrote test cases as I build basic functionalities.

## AuditedState.rb
* The most important functionalities in this module are building a custom getter and setter methods for state attribute.
* In the database, `state` is stored as a string no matter if `state` is a symbol or string type. I decided to 'don't care' type for setter and symbol only for getter.
* Used class attribute for `:allowed_states` and attribute_accessor for `current_state`. `current_state` is updated every time there is a new update on `state` attribute.
* Please refer back to my [audited_state.rb](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/hmdtrack/app/models/concerns/audited_state.rb).

## Testing
* I wrote some assertion tests to make sure my models are saving or returning correct values.
* Used `rails console` to check any unexpected behaviors.
* Please refer back to my [test folder](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/tree/master/hmdtrack/test).

## Migration
* Used `rake db:migrate:reset` to make sure I do not break any migration process.
* Created a migration file that migrates the existing legacy `state` column value into the new `hmd_states` table, and removal of the legacy column.
* Please refer back to my [migration script](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/hmdtrack/db/migrate/20170220022316_migrate_hmd_to_hmd_states.rb).

## Scalability
* TBD

## Enhancements
* TBD
- Improve the state auditing library with better efficiency or more features.
- Update the app to have a more responsive, AJAX-y UX.
- Add a basic authentication system and a way for users to customize the list.
- Implement some type of notifications when something changes.
- Anything you want! Been wanting to play with some new Ruby or JS framework? Use this as an excuse!
