* `terminal`: `rake routes`

Prefix Verb | URI Pattern | Controller#Action
-----------:|-------------|------------------
root GET | / | welcome#index

* `config/routes.rb`: `resources :labels`
* `terminal`: `rake routes`

Prefix Verb | URI Pattern | Controller#Action
-----------:|-------------|------------------
root GET | / | welcome#index
labels GET | /labels(.:format) | labels#index
POST | /labels(.:format) | labels#create
new_label GET | /labels/new(.:format) | labels#new
edit_label GET | /labels/:id/edit(.:format) | labels#edit
label GET | /labels/:id(.:format) | labels#show
PATCH | /labels/:id(.:format) | labels#update
PUT | /labels/:id(.:format) | labels#update
DELETE | /labels/:id(.:format) | labels#destroy

* `config/routes.rb`: `resources :labels, except: [:create]`
* `terminal`: `rake routes`

Prefix Verb | URI Pattern | Controller#Action
-----------:|-------------|------------------
root GET | / | welcome#index
labels GET | /labels(.:format) | labels#index
new_label GET | /labels/new(.:format) | labels#new
edit_label GET | /labels/:id/edit(.:format) | labels#edit
label GET | /labels/:id(.:format) | labels#show
PATCH | /labels/:id(.:format) | labels#update
PUT | /labels/:id(.:format) | labels#update
DELETE | /labels/:id(.:format) | labels#destroy

* `config/routes.rb`: `resources :labels do`
* `config/routes.rb`: ....`resources :albums`
::> `config/routes.rb`: `end`
::> `terminal`: `rake routes`

Prefix Verb | URI Pattern | Controller#Action
-----------:|-------------|------------------
root GET | / | welcome#index
label_albums GET | /labels/:label_id/albums(.:format) | albums#index
POST | /labels/:label_id/albums(.:format) | albums#create
new_label_album GET | /labels/:label_id/albums/new(.:format) | albums#new
edit_label_album GET | /labels/:label_id/albums/:id/edit(.:format) | albums#edit
label_album GET | /labels/:label_id/albums/:id(.:format) | albums#show
PATCH | /labels/:label_id/albums/:id(.:format) | albums#update
PUT | /labels/:label_id/albums/:id(.:format) | albums#update
DELETE | /labels/:label_id/albums/:id(.:format) | albums#destroy
labels GET | /labels(.:format) | labels#index
new_label GET | /labels/new(.:format) | labels#new
edit_label GET | /labels/:id/edit(.:format) | labels#edit
label GET | /labels/:id(.:format) | labels#show
PATCH | /labels/:id(.:format) | labels#update
PUT | /labels/:id(.:format) | labels#update
DELETE | /labels/:id(.:format) | labels#destroy

* `config/routes.rb`:
  `# get 'released/:year', 'albums#by_year'`
  `resources :albums, only: [:index, :show] do`
  ....`collection do`
  ........`get 'released/:year', action: 'by_year', as: 'by_year'`
  ....`end`
  `end`
* `terminal`:
  `rake routes`

Prefix Verb | URI Pattern | Controller#Action
-----------:|-------------|------------------
root GET | / | welcome#index
by_year_albums GET | /albums/released/:year(.:format) | albums#by_year
albums GET | /albums(.:format) | albums#index
album GET | /albums/:id(.:format) | albums#show

* now in an `.erb` file, we could say:
  `<%= link_to 'albums from 1980', by_year_albums_path(1980) %>`
  `# => '/albums/released/1980'` <-- good for links inside app
  `<%= link_to 'albums from 1980', by_year_albums_url(1980) %>`
  `# => 'http://jeremys_awesome_albums.com/albums/released/1980'` <-- maybe for a generated email about this project, like something that could be spit out from a contact form (sending a copy of the message you submitted)
