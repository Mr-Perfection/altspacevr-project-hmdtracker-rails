# HMD Track Coding Challenge

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


## Assumptions
* I made an assumption that there is no restriction on hmd_states that belong to hmd model. It means I allowed to have duplicates of states. ex) there will be more than hmd_state that has a same :state attribute with different :created_at attributes. If this is not the case, I can simply create a private method that checks duplicates and put it in :before_create filter.

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
I wrote down what are the basic functionalities that AuditState.rb should perform. Instead of diving into building AuditState.rb and start modulating, I chose to implement those basic requirements from  [Instructions](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/README_OLD.md) in  models. I wrote test cases as I build basic functionalities. Usually, I make commits every time I change certain features but since this is a coding challenge, and project is pretty straightforward, I didn't focus much on writing commit comments.

## AuditedState.rb
* The most important functionalities in this module are building a custom getter and setter methods for state attribute.
* Please refer back to my [audited_state.rb](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/hmdtrack/app/models/concerns/audited_state.rb).

## Testing
* I wrote some assertion tests to make sure my models are saving or returning correct values.
* Used `rails console` to check any unexpected behaviors.

## Migration
* Used `rake db:migrate:reset` to make sure I do not break any migration process.
* Created a migration file that migrates the existing legacy `state` column value into the new `hmd_states` table, and removal of the legacy column.
* Please refer back to my [migration script](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/hmdtrack/db/migrate/20170220022316_migrate_hmd_to_hmd_states.rb).

## Enhancements

- Improve the state auditing library with better efficiency or more features.
- Update the app to have a more responsive, AJAX-y UX.
- Add a basic authentication system and a way for users to customize the list.
- Implement some type of notifications when something changes.
- Anything you want! Been wanting to play with some new Ruby or JS framework? Use this as an excuse!
