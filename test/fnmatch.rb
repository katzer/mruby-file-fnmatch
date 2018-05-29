# MIT License
#
# Copyright (c) 2018 Sebastian Katzer, appPlant GmbH
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

assert 'File' do
  assert_kind_of Class, File
end

assert 'File::FNM_NOESCAPE' do
  assert_kind_of Integer, File::FNM_NOESCAPE
end

assert 'File::FNM_PATHNAME' do
  assert_kind_of Integer, File::FNM_PATHNAME
end

assert 'File::FNM_DOTMATCH' do
  assert_kind_of Integer, File::FNM_DOTMATCH
end

assert 'File::FNM_CASEFOLD' do
  assert_kind_of Integer, File::FNM_CASEFOLD
end

assert 'File::FNM_EXTGLOB' do
  assert_kind_of Integer, File::FNM_EXTGLOB
end

assert 'File::fnmatch' do
  assert_true  File.fnmatch('cat', 'cat')
  assert_false File.fnmatch('cat', 'category')

  assert_false File.fnmatch('c{at,ub}s', 'cats')
  assert_true  File.fnmatch('c{at,ub}s', 'cats', File::FNM_EXTGLOB)

  assert_true  File.fnmatch('c?t',     'cat')
  assert_false File.fnmatch('c??t',    'cat')
  assert_true  File.fnmatch('c*',      'cats')
  assert_true  File.fnmatch('c*t',     'c/a/b/t')
  assert_true  File.fnmatch('ca[a-z]', 'cat')
  assert_false File.fnmatch('ca[^t]',  'cat')

  assert_false File.fnmatch('cat', 'CAT')
  assert_true  File.fnmatch('cat', 'CAT', File::FNM_CASEFOLD)

  assert_false File.fnmatch('?',   '/', File::FNM_PATHNAME)
  assert_false File.fnmatch('*',   '/', File::FNM_PATHNAME)
  assert_false File.fnmatch('[/]', '/', File::FNM_PATHNAME)

  assert_true File.fnmatch('\?',   '?')
  assert_true File.fnmatch('\a',   'a')
  assert_true File.fnmatch('\a',   '\a', File::FNM_NOESCAPE)
  assert_true File.fnmatch('[\?]', '?')

  assert_false File.fnmatch('*',   '.profile')
  assert_true  File.fnmatch('*',   '.profile', File::FNM_DOTMATCH)
  assert_true  File.fnmatch('.*',  '.profile')

  assert_false File.fnmatch('**/*.rb', 'main.rb')
  assert_false File.fnmatch('**/*.rb', './main.rb')
  assert_true  File.fnmatch('**/*.rb', 'lib/song.rb')
  assert_true  File.fnmatch('**.rb',   'main.rb')
  assert_false File.fnmatch('**.rb',   './main.rb')
  assert_true  File.fnmatch('**.rb',   'lib/song.rb')
  assert_true  File.fnmatch('*',       'dave/.profile')

  assert_false File.fnmatch('*/*', 'dave/.profile',   File::FNM_PATHNAME)
  assert_true  File.fnmatch('*/*', 'dave/.profile',   File::FNM_PATHNAME | File::FNM_DOTMATCH)

  assert_true  File.fnmatch('**/foo', 'a/b/c/foo',    File::FNM_PATHNAME)
  assert_true  File.fnmatch('**/foo', '/a/b/c/foo',   File::FNM_PATHNAME)
  assert_true  File.fnmatch('**/foo', 'c:/a/b/c/foo', File::FNM_PATHNAME)
  assert_false File.fnmatch('**/foo', 'a/.b/c/foo',   File::FNM_PATHNAME)
  assert_true  File.fnmatch('**/foo', 'a/.b/c/foo',   File::FNM_PATHNAME | File::FNM_DOTMATCH)
end
