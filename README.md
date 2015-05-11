# HTML5 History Issues

## Setup

1. Bundle
2. Migrate - `bundle exec rake db:migrate`
3. Seed - `bundle exec rake osom:seeds:create_things`
4. Start Server - `bundle exec rails server`

## Issues

### Navigating back to page 1

From page 1
1. Click Next to go to page 2
2. Press the back button on your browser. The table will not be updated.

	- Note that this also happens if using the _Prev_ or _First_ buttons in the pagination

### Navigating Back to Table from Other Page

You should have a table of `Things` with 10 pages of pagination

1. Click Next to go to page 2
2. Click Next to go to page 3
3. Click the back button in your browser. The pagination, table, contents, and url should update page 2.
4. Click one of the entries in this page
5. Click the back button in the browser, which should take you back to page 2

	- Note that this does not occur if you view an entry from a page at the _end_ of the stack. E.g. follow the above steps, but view an entry from page 3, without first pressing back to go to page 2.

### current_table in JR's fork of osom-tables

1. Go to the Gemfile, comment out the line `gem 'osom-tables'`, and comment in `gem 'osom-tables', git: 'https://github.com/jobready/osom-tables.git'`
2. Rebundle and restart your server
3. Do a cacheless refresh of your browser (Cmd+Shift+r)
4. Click next on the pagination to page 2
5. Click next again to go to page 3
6. Click back on your browser. The URL will be updated, but table and pagination will not be updated.

	- This is because `current_table` in `$(window).on('popstate', function(e) {` is currently set, but not to the table currently in the DOM.
