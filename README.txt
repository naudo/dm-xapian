CONTRIBUTORS WELCOME

Currently somewhat tested, but, ahem, no spec:

* rake xapian:update_index models="model1 model2 ..."
* rake xapian:rebuild_index models="model1 model2 ..."
* rake xapian:query models="model1 model2 ..." query="..."
* tracking of models to be updated after added or updated (via rake xapian:update_index)


dm-xapian
=========

Merb plugin that provides use of the Ruby Xapian search engine library.


Setup
=====

For setup instructions read through SETUP.txt, its short and tells you where to get what else you need and what to do with it.


Xapian
======

Xapian is an Open Source Search Engine Library, released under the GPL. It's written in C++, with bindings to allow use from Perl, Python, PHP, Java, Tcl, C# and Ruby (so far!)

Xapian is a highly adaptable toolkit which allows developers to easily add advanced indexing and search facilities to their own applications. It supports the Probabilistic Information Retrieval model and also supports a rich set of boolean query operators.

If you're after a packaged search engine for your website, you should take a look at Omega: an application we supply built upon Xapian. Unlike most other website search solutions, Xapian's versatility allows you to extend Omega to meet your needs as they grow.

The latest stable version is 1.0.7, released on 2008-07-15.

http://xapian.org/


Xapian Bindings for Ruby
========================
The Ruby bindings for Xapian are packaged in the xapian module. 

General info: http://xapian.org/docs/bindings/ruby/
API Docs:     http://xapian.org/docs/bindings/ruby/rdocs/

To Use
======
* install gem via "rake install"
* add to config/init.rb:
  dependencies "dm-xapian"
* Add to each model:
  is_indexed :texts => [ :name, :region, :country, :varietal ],
     :values => [[:price, 0, "price", :float], [:ean, 1, "ean", :string]],
     :terms => [ [ :winery, 'W', "winery" ] ]
  
  * Terms are global across all models
  * texts, values and terms based on properties
