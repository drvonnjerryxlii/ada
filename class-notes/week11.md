- - -
> ### jump links ###
- - -

* [day 44](#day-forty-four)
* [day 45](#day-forty-five)
* [day 46](#day-forty-six)
* [day 47](#day-forty-seven)
* [day 48](#day-forty-eight)

- - -
> ### day forty-four ###
- - -

weekend hw review:
* session data is kept on the server, so it's considered more secure.
* cookies are kept on the client side.

[conditional validation][cv]
* `validates :card_number, presence: true, if: :paid_with_card?`  
  `def paid_with_card?`  
  ....`payment_type == "card"`  
  `end`
* ~~`validates :surname, presence: true, if: "name.nil?"`~~ Jeremy says don't ever do this.
* `validates :password, confirmation: true, unless: Proc.new { |a| a.password.blank? }`


[callbacks][cb]
* > With callbacks it is possible to write code that will run whenever an Active
  > Record object is created, saved, updated, deleted, validated, or loaded from
  > the database.
* before/after is pretty clear. _around_ means any time that it's occurring, that it doesn't matter whether it happens before or after -- just that it does happen around that time. it's a little bit less resource-intensive, so it's a great way to kick off tasks like logging tasks.
* `create` callbacks only fire when creating new objects in the database.
   * like sending a confirmation email
* `save` callbacks fire whenever a record is being saved.
* 3.1 Creating an Object
   * before_validation
   * after_validation
   * before_save
   * around_save
   * before_create
   * around_create
   * after_create
   * after_save
   * after_commit/after_rollback
* 3.2 Updating an Object
   * before_validation
   * after_validation
   * before_save
   * around_save
   * before_update
   * around_update
   * after_update
   * after_save
   * after_commit/after_rollback
* 3.3 Destroying an Object
   * before_destroy
   * around_destroy
   * after_destroy
   * after_commit/after_rollback

[sessions][ses]

[user authentication][ua]

[ses]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/session.md
[cv]: http://guides.rubyonrails.org/active_record_validations.html#conditional-validation
[cb]: http://guides.rubyonrails.org/active_record_callbacks.html
[ua]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/user-authentication.md

HOMEWORK:
* reading about sessions
   * [here][ses1] & [here][ses2]

[ses1]: http://guides.rubyonrails.org/security.html#introduction
[ses2]: http://guides.rubyonrails.org/action_controller_overview.html#session

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty-five ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty-six ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty-seven ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty-eight ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>
