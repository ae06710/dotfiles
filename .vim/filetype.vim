augroup filetypedetect
  au BufRead,BufNewFile *.ini.* setfiletype dosini
  au BufRead,BufNewFile *.c setfiletype c
  au BufRead,BufNewFile *.cpp setfiletype cpp
  au BufRead,BufNewFile *.css setfiletype css
  au BufRead,BufNewFile *.less setfiletype less
  au BufRead,BufNewFile *.sass setfiletype sass.css
  au BufRead,BufNewFile *.scss setfiletype scss.css
  au BufRead,BufNewFile *.html setfiletype html
  au BufRead,BufNewFile *.javascript,*.coffeescript,*.node,*.json,*.typescript,Grantfile setfiletype javascript
  au BufRead,BufNewFile *.php,*.phtml setfiletype php
  au BufRead,BufNewFile *.py setfiletype python
  au BufRead,BufNewFile *.rb,*.erb,*.eruby,*.pp,Gemfile,Rakefile,Puppetfile,Guradfile setfiletype ruby
  au BufRead,BufNewFile *.haml setfiletype haml
  au BufRead,BufNewFile *.slim setfiletype slim
  au BufRead,BufNewFile *.scala setfiletype scala
  au BufRead,BufNewFile *.shell setfiletype shell
  au BufRead,BufNewFile *.sql setfiletype sql
augroup END
