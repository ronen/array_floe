# array_floe
[![Gem Version](https://badge.fury.io/rb/array_floe.png)](http://badge.fury.io/rb/array_floe)
[![Build Status](https://secure.travis-ci.org/lomba/schema_plus.png)](http://travis-ci.org/ronen/array_floe)
[![Dependency Status](https://gemnasium.com/lomba/schema_plus.png)](https://gemnasium.com/ronen/array_floe)

## Overview

This small extension to ruby's Array class simplifies the reasonably-common
need to specially handle "floe"--i.e., **f**irst, **l**ast, **o**dd,
**e**ven--when iterating through the elements of an array.  It's particularly
handy for generating CSS classes.

Full Rdoc is available at http://rubydoc.info/gems/array_floe

## Usage

The gem provides two additional iterators, Array#each_with_floe and
Array#each_with_index_floe, that provide a "floe" object for each element in
the array:

    ary.each_with_floe do |element, floe|
        if floe.first?
            puts "#{element} is the first element"
        end
        if floe.last?
            puts "#{element} is the last element"
        end
        if floe.odd?
            puts "#{element} is an odd-numbered element"
        end
        if floe.even?
            puts "#{element} is an even-numbered element"
        end
    end

    ary.each_with_index_floe do |element, i, floe|
        assert_equal(i == 0,          floe.first?)
        assert_equal(i == ary.size-1, floe.last?)
        assert_equal(i % 2 == 1,      float.odd?)
        assert_equal(i % 2 == 0,      float.even?)
    end

If no block is given, an enumerator is returned instead.

The "floe" object's `to_s` method returns a space-separated list of "first",
"last", "odd", and "even" as appropriate:

    [:a, :b, :c, :d].each_with_floe.collect{|element, floe| floe.to_s} #=> [ "first even", "odd", "even", "last odd" ]

`floe.to_s` is particularly useful to construct CSS classes when generating
HTML.  For example, this [haml](http://haml-lang.com/) snippet:

    %table
    - [:a, :b, :c, :d].each_with_floe do |row, floe|
      %tr{:class => floe}
        %td= row

would yield this HTML snippet:

    <table>
        <tr class="first even">
            <td>a</td>
        </tr>
        <tr class="odd">
            <td>b</td>
        </tr>
        <tr class="even">
            <td>c</td>
        </tr>
        <tr class="last odd">
            <td>d</td>
        </tr>
    </table>

## Installing

Standard installation from http://rubygems.org/gems/array_floe

    % gem install array_floe

or, if you're using [bundler](http://gembundler.com/), include this line in
your Gemfile:

    gem "array_floe"

## Ruby Versions

Tested on ruby 1.8.7 and 1.9.3 and 2.0.0

## Copyright

Released under the MIT License.  See LICENSE.txt for further details.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/ronen/array_floe/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

