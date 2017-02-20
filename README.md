# HMD Track Coding Challenge

## Intro
This project is my implementation for [HMD Track Coding Challenge](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/README_OLD.md) to demonstrate my knowledge and skills in RoR development.

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
I wrote down what are the basic functionalities that AuditState.rb should perform. Instead of diving into building AuditState.rb and start modulating, I chose to implement those basic requirements from the [Instructions](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/README_OLD.md) in the models. I wrote test cases as I build basic functionalities. Usually, I make commits every time I change certain features but since this is a coding challenge, and project is pretty straightforward, I didn't focus much on writing commit comments.

## AuditedState.rb
* The most important functionalities in this module are building a custom getter and setter methods for state attribute.
* Please refer back to my [audited_state.rb](https://github.com/Mr-Perfection/altspacevr-project-hmdtracker-rails/blob/master/hmdtrack/app/models/concerns/audited_state.rb).

## Testing
* I wrote some assertion tests to make sure my models are saving or returning correct values.

## Migration

## Objective

  **AuditState**
  1)
* implement 'AuditState' concern module and basic functionalities(#1 priority).
  1) `model.state` should initially equal the first valid value (in this example, `:announced`), even if there are no rows in the state table for that model yet. (COMPLETED, initial state is stored in hmd_states collection of hmd)
  2) `model.state = :new_state` should insert a row into the state table with the value `new_state` in the database, and subsequent calls to `model.state` should return `:new_state` (COMPLETED)
  3) You can set `model.state` to a string or a symbol, and it should work. Reading `model.state` should return a symbol
    (COMPLETED, always symbolize the the 'model.state' before save)
  4) Trying to update `model.state` to an invalid value should raise a validation exception. (COMPLETED)
  5) Refactor the code into `AuditedState` as a Rail (COMPLETED) [Concern](http://api.rubyonrails.org/classes/ActiveSupport/Concern.html)

* Add any enhancements on this application (check the old_README.md for what Altspace expects.) (IN PROGESS)

## Getting started

'''
$ rake db:migrate
$ rake db:seed
$ rails s

$ rake test # testing



git reset HEAD~1 # remove a previous commit
'''

## Frameworks and Tech used

* Frameworks provided by Altspace + ...
