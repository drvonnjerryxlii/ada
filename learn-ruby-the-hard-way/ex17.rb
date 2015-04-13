# -*- coding: utf-8 -*-

from_file, to_file = ARGV; puts "Copying from #{from_file} to #{to_file}"; open(to_file, 'w').write(open(from_file).read); puts "Done!"; open(from_file).close; open(to_file).close