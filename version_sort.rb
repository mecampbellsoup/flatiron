require "awesome_print"
require 'pry'

class Array
  def version_sort
    g_subbed = self.collect do |filename|
      filename.gsub(/([0-9]+|[a-z]+|[.])/).to_a  # now I have array of arrays which are full of subdivided strings
    end
    converted = []
    g_subbed.each do |filename_array|
      file = []
      filename_array.collect do |component|
        if component.to_i.to_s == component && component.to_i.to_s.length == component.length
          file << component.to_i
        else
          file << component
        end
      end
      converted << file
    end
    sorted = converted.sort_by {|k| k[1]}
    sorted.collect {|file_array| file_array.join() }
  end
end

filenames = [
  "foo-1.10.2.ext",
  "foo-1.11.ext",
  "foo-1.3.ext",
  "foo-1.50.ext",
  "foo-1.8.7.ext",
  "foo-1.9.3.ext",
  "foo-1.ext",
  "foo-10.1.ext",
  "foo-10.ext",
  "foo-100.ext",
  "foo-13.ext",
  "foo-2.0.0.ext",
  "foo-2.0.1.ext",
  "foo-2.0.ext",
  "foo-2.007.ext",
  "foo-2.01.ext",
  "foo-2.012b.ext",
  "foo-2.01a.ext",
  "foo-2.0a.ext",
  "foo-2.0b.ext",
  "foo-2.1.ext",
  "foo-25.ext",
  "foo-6.ext",
]

ap filenames.version_sort

version_sorted_filenames = [
  "foo-1.ext",
  "foo-1.3.ext",
  "foo-1.8.7.ext",
  "foo-1.9.3.ext",
  "foo-1.10.2.ext",
  "foo-1.11.ext",
  "foo-1.50.ext",
  "foo-2.0.ext",
  "foo-2.0a.ext",
  "foo-2.0b.ext",
  "foo-2.0.0.ext",
  "foo-2.0.1.ext",
  "foo-2.01.ext",
  "foo-2.1.ext",
  "foo-2.01a.ext",
  "foo-2.007.ext",
  "foo-2.012b.ext",
  "foo-6.ext",
  "foo-10.ext",
  "foo-10.1.ext",
  "foo-13.ext",
  "foo-25.ext",
  "foo-100.ext",
]

#assert_equal filenames.version_sort, version_sorted_filenames